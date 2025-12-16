<?php

/**
 * PletX API Client
 * Handles all communication with the PletX Anti-DDoS API
 */
class PletXAPIClient {
    private $apiUrl;
    private $apiKey;
    private $lastError;

    /**
     * Constructor
     * @param string $apiUrl Base URL for PletX API
     * @param string $apiKey Bearer token for authentication
     */
    public function __construct($apiUrl, $apiKey) {
        $this->apiUrl = rtrim($apiUrl, '/');
        $this->apiKey = $apiKey;
        $this->lastError = null;
    }

    /**
     * Get last error message
     * @return string|null
     */
    public function getLastError() {
        return $this->lastError;
    }

    /**
     * Make API request
     * @param string $endpoint API endpoint (e.g., '/services/rules')
     * @param string $method HTTP method (GET, POST, DELETE)
     * @param array|null $data Request data for POST/PUT
     * @param array $queryParams Query parameters for GET
     * @return array|null Response data or null on error
     */
    private function request($endpoint, $method = 'GET', $data = null, $queryParams = []) {
        $url = $this->apiUrl . $endpoint;

        // Add query parameters
        if (!empty($queryParams)) {
            $url .= '?' . http_build_query($queryParams);
        }

        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Authorization: Bearer ' . $this->apiKey,
            'Content-Type: application/json',
        ]);

        switch (strtoupper($method)) {
            case 'POST':
                curl_setopt($ch, CURLOPT_POST, true);
                if ($data !== null) {
                    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
                }
                break;
            case 'DELETE':
                curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'DELETE');
                break;
            case 'PUT':
                curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'PUT');
                if ($data !== null) {
                    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
                }
                break;
        }

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        if (curl_errno($ch)) {
            $this->lastError = curl_error($ch);
            curl_close($ch);
            return null;
        }

        curl_close($ch);

        $decoded = json_decode($response, true);

        // Check for API errors
        if ($httpCode >= 400) {
            $this->lastError = $decoded['message'] ?? 'API request failed with status ' . $httpCode;
            return null;
        }

        $this->lastError = null;
        return $decoded;
    }

    // ==================== Applications ====================

    /**
     * Get list of available applications
     * @return array|null
     */
    public function getApplications() {
        return $this->request('/services/applications', 'GET');
    }

    // ==================== Attacks ====================

    /**
     * Get list of attacks
     * @param int $page Page number (default: 1)
     * @param int $maxView Items per page (default: 10, 0 for all)
     * @param string|null $keyword Search keyword (can be used for IP filtering)
     * @param string|null $filterIp Filter by specific IP address (uses keyword parameter)
     * @return array|null
     */
    public function getAttacks($page = 1, $maxView = 10, $keyword = null, $filterIp = null) {
        $params = [
            'page' => $page,
            'max_view' => $maxView,
        ];

        // If filterIp is provided, use it as keyword (API filters by IP in keyword field)
        if ($filterIp) {
            $params['keyword'] = $filterIp;
        } elseif ($keyword) {
            $params['keyword'] = $keyword;
        }

        return $this->request('/services/attacks', 'GET', null, $params);
    }

    /**
     * Get attack details by ID
     * @param int $attackId Attack ID
     * @return array|null
     */
    public function getAttackDetails($attackId) {
        return $this->request('/services/attacks/' . $attackId, 'GET');
    }

    // ==================== Overview ====================

    /**
     * Get service overview with bandwidth data
     * @param string $period Overview period (10m, 1h, 1d, 1w)
     * @param string|null $queryIp Filter by IP or CIDR
     * @return array|null
     */
    public function getServiceOverview($period = '10m', $queryIp = null) {
        $params = ['overview_period' => $period];
        if ($queryIp) {
            $params['query_ip'] = $queryIp;
        }
        return $this->request('/services/overview', 'GET', null, $params);
    }

    // ==================== Prefixes ====================

    /**
     * Get service prefixes
     * @return array|null
     */
    public function getPrefixes() {
        return $this->request('/services/prefixes', 'GET');
    }

    // ==================== Rules ====================

    /**
     * Get list of rules
     * @param int $page Page number (default: 1)
     * @param int $maxView Items per page (default: 10, 0 for all)
     * @param string|null $keyword Search keyword (can be used for IP filtering)
     * @param string|null $filterIp Filter by specific IP address (uses keyword parameter)
     * @return array|null
     */
    public function getRules($page = 1, $maxView = 10, $keyword = null, $filterIp = null) {
        $params = [
            'page' => $page,
            'max_view' => $maxView,
        ];

        // If filterIp is provided, use it as keyword (API filters by IP in keyword field)
        if ($filterIp) {
            $params['keyword'] = $filterIp;
        } elseif ($keyword) {
            $params['keyword'] = $keyword;
        }

        return $this->request('/services/rules', 'GET', null, $params);
    }

    /**
     * Create a new rule
     * @param array $ruleData Rule configuration
     * @return array|null
     */
    public function createRule($ruleData) {
        // Convert to form data format for the API
        $formData = [];
        foreach ($ruleData as $key => $value) {
            $formData[$key] = $value;
        }

        // For form data POST, we need to use application/x-www-form-urlencoded
        $url = $this->apiUrl . '/services/rules';
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Authorization: Bearer ' . $this->apiKey,
            'Content-Type: application/x-www-form-urlencoded',
        ]);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($formData));

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        if (curl_errno($ch)) {
            $this->lastError = curl_error($ch);
            curl_close($ch);
            return null;
        }

        curl_close($ch);

        $decoded = json_decode($response, true);

        if ($httpCode >= 400) {
            $this->lastError = $decoded['message'] ?? 'API request failed with status ' . $httpCode;
            return null;
        }

        $this->lastError = null;
        return $decoded;
    }

    /**
     * Delete rule(s)
     * @param string|null $ip IP address (required)
     * @param int|null $port Port number (optional, with protocol)
     * @param string|null $protocol Protocol (TCP/UDP, optional, with port)
     * @return array|null
     */
    public function deleteRules($ip, $port = null, $protocol = null) {
        $params = ['ip' => $ip];
        if ($port !== null) {
            $params['port'] = $port;
        }
        if ($protocol !== null) {
            $params['protocol'] = $protocol;
        }
        return $this->request('/services/rules?' . http_build_query($params), 'DELETE');
    }

    /**
     * Delete rule by ID
     * @param int $ruleId Rule ID
     * @return array|null
     */
    public function deleteRuleById($ruleId) {
        return $this->request('/services/rules/' . $ruleId, 'DELETE');
    }
}
