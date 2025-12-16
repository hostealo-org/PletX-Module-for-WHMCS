<?php
if (!defined("WHMCS")) {
    die("Direct access not allowed.");
}

use WHMCS\Database\Capsule;

/**
 * Anti-DDoS Panel Module Configuration
 */
function antiddos_panel_config() {
    return [
        'name'        => 'Anti-DDoS Panel',
        'description' => 'Module to manage Anti-DDoS rules and attacks using PletX API in the Client Area.',
        'version'     => '1.0',
        'author'      => 'Hostealo.es',
        'language'    => 'english',
        'fields'      => [
            'api_url' => [
                'FriendlyName' => 'PletX API URL',
                'Type'         => 'text',
                'Size'         => '50',
                'Default'      => 'https://api.pletx.net',
                'Description'  => 'Base URL for the PletX API',
            ],
            'api_key' => [
                'FriendlyName' => 'PletX API Key',
                'Type'         => 'password',
                'Size'         => '50',
                'Description'  => 'Bearer token for PletX API authentication',
            ],
            'allowed_ip_prefixes' => [
                'FriendlyName' => 'Allowed IP Prefixes',
                'Type'         => 'textarea',
                'Rows'         => '5',
                'Description'  => 'Comma-separated list of IP prefixes that clients can manage (e.g., 45.198,78.40.111)',
            ],
        ],
    ];
}

/**
 * Activate the module
 */
function antiddos_panel_activate() {
    try {
        // Create configuration table if needed
        if (!Capsule::schema()->hasTable('mod_antiddos_config')) {
            Capsule::schema()->create('mod_antiddos_config', function ($table) {
                $table->increments('id');
                $table->integer('client_id');
                $table->text('settings')->nullable();
                $table->timestamps();
            });
        }

        return [
            'status'      => 'success',
            'description' => 'Anti-DDoS Panel Module activated successfully.',
        ];
    } catch (Exception $e) {
        return [
            'status'      => 'error',
            'description' => 'Unable to activate: ' . $e->getMessage(),
        ];
    }
}

/**
 * Deactivate the module
 */
function antiddos_panel_deactivate() {
    return [
        'status'      => 'success',
        'description' => 'Anti-DDoS Panel Module deactivated successfully.',
    ];
}

/**
 * Get module configuration from admin settings
 */
function antiddos_panel_getConfig() {
    $settings = Capsule::table('tbladdonmodules')
        ->where('module', 'antiddos_panel')
        ->pluck('value', 'setting');

    return [
        'api_url' => $settings['api_url'] ?? 'https://api.pletx.net',
        'api_key' => $settings['api_key'] ?? '',
        'allowed_ip_prefixes' => array_filter(
            array_map('trim', explode(',', $settings['allowed_ip_prefixes'] ?? ''))
        ),
    ];
}

/**
 * Check if an IP is allowed based on configured prefixes
 */
function antiddos_panel_isAllowedIp($ip, $allowedPrefixes) {
    foreach ($allowedPrefixes as $prefix) {
        if (strpos($ip, $prefix) === 0) {
            return true;
        }
    }
    return false;
}

/**
 * Get client services with allowed IPs
 */
function antiddos_panel_getClientServices($clientId) {
    $config = antiddos_panel_getConfig();
    $allowedPrefixes = $config['allowed_ip_prefixes'];
    $services = [];
    $ipSet = [];

    $command  = 'GetClientsProducts';
    $postData = [
        'clientid' => $clientId,
        'stats'    => true,
    ];
    $results = localAPI($command, $postData);

    if ($results['result'] === 'success') {
        foreach ($results['products']['product'] as $prod) {
            if (strtolower($prod['status']) !== 'active') {
                continue;
            }

            $hostname = !empty($prod['domain']) ? $prod['domain'] : 'No hostname';

            // Check dedicated IP
            if (!empty($prod['dedicatedip'])) {
                $ip = trim($prod['dedicatedip']);
                if (antiddos_panel_isAllowedIp($ip, $allowedPrefixes) && !isset($ipSet[$ip])) {
                    $services[] = ['ip' => $ip, 'hostname' => $hostname];
                    $ipSet[$ip] = true;
                }
            }

            // Check assigned IPs
            if (!empty($prod['assignedips'])) {
                $extraIps = explode(',', $prod['assignedips']);
                foreach ($extraIps as $ipVal) {
                    $ip = trim($ipVal);
                    if (antiddos_panel_isAllowedIp($ip, $allowedPrefixes) && !isset($ipSet[$ip])) {
                        $services[] = ['ip' => $ip, 'hostname' => $hostname];
                        $ipSet[$ip] = true;
                    }
                }
            }
        }
    }

    return $services;
}

/**
 * Client area page handler
 */
function antiddos_panel_clientarea($vars) {
    $clientId = isset($_SESSION['uid']) ? (int) $_SESSION['uid'] : 0;

    if (!$clientId) {
        return [
            'pagetitle'    => 'Anti-DDoS Panel',
            'breadcrumb'   => [
                'index.php?m=antiddos_panel' => 'Anti-DDoS Panel',
            ],
            'templatefile' => 'error',
            'requirelogin' => true,
            'vars'         => [
                'error' => 'You must be logged in to access this page.',
            ],
        ];
    }

    $services = antiddos_panel_getClientServices($clientId);
    $config = antiddos_panel_getConfig();

    return [
        'pagetitle'    => 'Anti-DDoS Panel',
        'breadcrumb'   => [
            'index.php?m=antiddos_panel' => 'Anti-DDoS Panel',
        ],
        'templatefile' => 'overview',
        'requirelogin' => true,
        'vars'         => [
            'services'  => $services,
            'clientId'  => $clientId,
            'apiUrl'    => $config['api_url'],
            'moduleUrl' => 'index.php?m=antiddos_panel',
        ],
    ];
}
