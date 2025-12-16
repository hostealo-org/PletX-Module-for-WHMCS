<?php
use WHMCS\Database\Capsule;

require_once __DIR__ . '/../../../init.php';
require_once __DIR__ . '/../../../includes/functions.php';
require_once __DIR__ . '/lib/PletXAPIClient.php';
require_once __DIR__ . '/antiddos_panel.php';

// Debug logging function
function antiddos_debugLog($action, $userId, $ip, $requestData, $response = null) {
    // Create logs directory if it doesn't exist
    $logDir = __DIR__ . '/module_logs';
    if (!is_dir($logDir)) {
        mkdir($logDir, 0755, true);
    }

    // Create log file based on action
    $logFile = $logDir . '/' . $action . '.log';

    $timestamp = date('Y-m-d H:i:s');
    $userIp = $_SERVER['REMOTE_ADDR'] ?? 'Unknown';
    $userAgent = $_SERVER['HTTP_USER_AGENT'] ?? 'Unknown';
    $requestMethod = $_SERVER['REQUEST_METHOD'] ?? 'Unknown';
    $requestUri = $_SERVER['REQUEST_URI'] ?? 'Unknown';

    // Prepare log entry
    $logEntry = [
        'timestamp' => $timestamp,
        'user_id' => $userId,
        'user_ip' => $userIp,
        'user_agent' => $userAgent,
        'action' => $action,
        'target_ip' => $ip,
        'request_method' => $requestMethod,
        'request_uri' => $requestUri,
        'request_data' => $requestData,
        'response_summary' => $response ? (isset($response['error']) ? 'Error: ' . $response['error'] : 'Success') : 'N/A',
        'session_id' => session_id()
    ];

    // Format the log entry
    $logLine = "========================================\n";
    $logLine .= "[{$timestamp}] ACTION: {$action}\n";
    $logLine .= "USER ID: {$userId} | USER IP: {$userIp}\n";
    $logLine .= "TARGET IP: {$ip}\n";
    $logLine .= "REQUEST METHOD: {$requestMethod}\n";
    $logLine .= "REQUEST URI: {$requestUri}\n";
    $logLine .= "USER AGENT: {$userAgent}\n";
    $logLine .= "SESSION ID: " . session_id() . "\n";
    $logLine .= "REQUEST DATA: " . json_encode($requestData, JSON_PRETTY_PRINT) . "\n";

    if ($response !== null) {
        $logLine .= "RESPONSE: " . json_encode($response, JSON_PRETTY_PRINT) . "\n";
    }

    $logLine .= "========================================\n\n";

    // Write to specific action log file
    file_put_contents($logFile, $logLine, FILE_APPEND | LOCK_EX);

    // Also write to a master log file for all actions
    $masterLogFile = $logDir . '/master.log';
    file_put_contents($masterLogFile, $logLine, FILE_APPEND | LOCK_EX);

    // Also log to system error log for critical errors
    if ($response && isset($response['error'])) {
        error_log("Anti-DDoS Panel Error - User: {$userId}, Action: {$action}, Error: " . $response['error']);
    }
}

/**
 * Verify IP ownership for the current user
 */
function antiddos_verifyIpOwnership($userId, $ip) {
    $services = antiddos_panel_getClientServices($userId);
    foreach ($services as $service) {
        if ($service['ip'] === $ip) {
            return true;
        }
    }
    return false;
}

/**
 * Get API client instance
 */
function antiddos_getApiClient() {
    $config = antiddos_panel_getConfig();
    return new PletXAPIClient($config['api_url'], $config['api_key']);
}

// Set response headers
header('Content-Type: application/json; charset=utf-8');

$clientId = isset($_SESSION['uid']) ? (int) $_SESSION['uid'] : 0;

// Log unauthorized access attempts
if (!$clientId) {
    $response = ['error' => 'Unauthorized: no active WHMCS session'];
    antiddos_debugLog('UNAUTHORIZED_ACCESS', 0, 'N/A', $_REQUEST, $response);
    echo json_encode($response);
    exit;
}

$action = isset($_REQUEST['action']) ? $_REQUEST['action'] : null;
$ip     = isset($_REQUEST['ip'])     ? $_REQUEST['ip']     : null;

// Log missing action
if (!$action) {
    $response = ['error' => 'No action specified.'];
    antiddos_debugLog('MISSING_ACTION', $clientId, 'N/A', $_REQUEST, $response);
    echo json_encode($response);
    exit;
}

// Actions that don't require IP validation
$actionsWithoutIp = ['getApplications'];

// Log missing IP (except for actions that don't need it)
if (!$ip && !in_array($action, $actionsWithoutIp)) {
    $response = ['error' => 'No IP specified.'];
    antiddos_debugLog('MISSING_IP', $clientId, 'N/A', $_REQUEST, $response);
    echo json_encode($response);
    exit;
}

// Log ownership verification attempts (except for actions that don't need it)
if (!in_array($action, $actionsWithoutIp) && !antiddos_verifyIpOwnership($clientId, $ip)) {
    $response = ['error' => 'Not authorized to manage this IP.'];
    antiddos_debugLog('UNAUTHORIZED_IP_ACCESS', $clientId, $ip, $_REQUEST, $response);
    echo json_encode($response);
    exit;
}

// Get API client
$apiClient = antiddos_getApiClient();

// Route to appropriate action
switch ($action) {
    // ==================== Applications ====================
    case 'getApplications':
        $response = $apiClient->getApplications();
        if ($response === null) {
            $response = ['error' => $apiClient->getLastError() ?? 'Failed to retrieve applications'];
        }
        antiddos_debugLog('getApplications', $clientId, 'N/A', $_REQUEST, $response);
        echo json_encode($response);
        break;

    // ==================== Rules ====================
    case 'getRules':
        $page = isset($_REQUEST['page']) ? (int)$_REQUEST['page'] : 1;
        $maxView = isset($_REQUEST['max_view']) ? (int)$_REQUEST['max_view'] : 10;
        $keyword = isset($_REQUEST['keyword']) ? $_REQUEST['keyword'] : null;

        // Filter by IP to show only rules for the current IP
        $response = $apiClient->getRules($page, $maxView, $keyword, $ip);
        if ($response === null) {
            $response = ['error' => $apiClient->getLastError() ?? 'Failed to retrieve rules'];
        }
        antiddos_debugLog('getRules', $clientId, $ip, $_REQUEST, $response);
        echo json_encode($response);
        break;

    case 'createRule':
        $ruleData = [
            'application_id' => isset($_REQUEST['application_id']) ? (int)$_REQUEST['application_id'] : null,
            'ip' => $ip,
            'port' => isset($_REQUEST['port']) ? (int)$_REQUEST['port'] : null,
        ];

        // Add optional fields for custom TCP
        if (isset($_REQUEST['max_connections'])) {
            $ruleData['max_connections'] = (int)$_REQUEST['max_connections'];
        }
        if (isset($_REQUEST['max_connections_action'])) {
            $ruleData['max_connections_action'] = $_REQUEST['max_connections_action'];
        }
        if (isset($_REQUEST['max_packet_size'])) {
            $ruleData['max_packet_size'] = (int)$_REQUEST['max_packet_size'];
        }
        if (isset($_REQUEST['max_packet_num'])) {
            $ruleData['max_packet_num'] = (int)$_REQUEST['max_packet_num'];
        }
        if (isset($_REQUEST['max_bytes'])) {
            $ruleData['max_bytes'] = (int)$_REQUEST['max_bytes'];
        }

        $response = $apiClient->createRule($ruleData);
        if ($response === null) {
            $response = ['error' => $apiClient->getLastError() ?? 'Failed to create rule'];
        }
        antiddos_debugLog('createRule', $clientId, $ip, $ruleData, $response);
        echo json_encode($response);
        break;

    case 'deleteRule':
        $ruleId = isset($_REQUEST['rule_id']) ? (int)$_REQUEST['rule_id'] : null;

        if ($ruleId) {
            // SECURITY: Verify that the rule_id belongs to the IP the user owns
            $rulesResponse = $apiClient->getRules(1, 0, null, $ip); // Get all rules for this IP
            if ($rulesResponse === null || isset($rulesResponse['error'])) {
                $response = ['error' => 'Failed to verify rule ownership'];
                antiddos_debugLog('deleteRule_verification_failed', $clientId, $ip, $_REQUEST, $response);
                echo json_encode($response);
                exit;
            }

            // Check if the rule exists and belongs to the user's IP
            $ruleFound = false;
            if (isset($rulesResponse['data']) && is_array($rulesResponse['data'])) {
                foreach ($rulesResponse['data'] as $rule) {
                    if (isset($rule['rule_id']) && $rule['rule_id'] == $ruleId &&
                        isset($rule['ip']) && $rule['ip'] === $ip) {
                        $ruleFound = true;
                        break;
                    }
                }
            }

            if (!$ruleFound) {
                $response = ['error' => 'Rule not found or not authorized to delete this rule'];
                antiddos_debugLog('deleteRule_unauthorized_attempt', $clientId, $ip, $_REQUEST, $response);
                echo json_encode($response);
                exit;
            }

            // Delete by rule ID (now verified to belong to the user's IP)
            $response = $apiClient->deleteRuleById($ruleId);
        } else {
            // Delete by IP/port/protocol
            $port = isset($_REQUEST['port']) ? (int)$_REQUEST['port'] : null;
            $protocol = isset($_REQUEST['protocol']) ? $_REQUEST['protocol'] : null;
            $response = $apiClient->deleteRules($ip, $port, $protocol);
        }

        if ($response === null) {
            $response = ['error' => $apiClient->getLastError() ?? 'Failed to delete rule'];
        }
        antiddos_debugLog('deleteRule', $clientId, $ip, $_REQUEST, $response);
        echo json_encode($response);
        break;

    // ==================== Attacks ====================
    case 'getAttacks':
        $page = isset($_REQUEST['page']) ? (int)$_REQUEST['page'] : 1;
        $maxView = isset($_REQUEST['max_view']) ? (int)$_REQUEST['max_view'] : 10;
        $keyword = isset($_REQUEST['keyword']) ? $_REQUEST['keyword'] : null;

        // Filter by IP to show only attacks for the current IP
        $response = $apiClient->getAttacks($page, $maxView, $keyword, $ip);
        if ($response === null) {
            $response = ['error' => $apiClient->getLastError() ?? 'Failed to retrieve attacks'];
        }
        antiddos_debugLog('getAttacks', $clientId, $ip, $_REQUEST, $response);
        echo json_encode($response);
        break;

    case 'getAttackDetails':
        $attackId = isset($_REQUEST['attack_id']) ? (int)$_REQUEST['attack_id'] : null;
        if (!$attackId) {
            $response = ['error' => 'Missing attack ID'];
            antiddos_debugLog('getAttackDetails_error', $clientId, $ip, $_REQUEST, $response);
            echo json_encode($response);
            exit;
        }

        $response = $apiClient->getAttackDetails($attackId);
        if ($response === null) {
            $response = ['error' => $apiClient->getLastError() ?? 'Failed to retrieve attack details'];
        }
        antiddos_debugLog('getAttackDetails', $clientId, $ip, $_REQUEST, $response);
        echo json_encode($response);
        break;

    // ==================== Overview ====================
    case 'getOverview':
        $period = isset($_REQUEST['period']) ? $_REQUEST['period'] : '10m';
        $queryIp = isset($_REQUEST['query_ip']) ? $_REQUEST['query_ip'] : null;

        $response = $apiClient->getServiceOverview($period, $queryIp);
        if ($response === null) {
            $response = ['error' => $apiClient->getLastError() ?? 'Failed to retrieve overview'];
        }
        antiddos_debugLog('getOverview', $clientId, $ip, $_REQUEST, $response);
        echo json_encode($response);
        break;

    // ==================== Prefixes ====================
    case 'getPrefixes':
        $response = $apiClient->getPrefixes();
        if ($response === null) {
            $response = ['error' => $apiClient->getLastError() ?? 'Failed to retrieve prefixes'];
        }
        antiddos_debugLog('getPrefixes', $clientId, $ip, $_REQUEST, $response);
        echo json_encode($response);
        break;

    default:
        $response = ['error' => 'Invalid action.'];
        antiddos_debugLog('INVALID_ACTION', $clientId, $ip, $_REQUEST, $response);
        echo json_encode($response);
        break;
}

exit;
