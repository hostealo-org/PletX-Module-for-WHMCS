<!-- Toastr CSS for notifications -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet"/>
<!-- ECharts -->
<script src="https://cdn.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>

<style>
    .antiddos-container {
      /*  background-color: #0d1117;
        color: #e4e4e4;*/
    }

    .antiddos-container .card {
        /*background-color: #161b22;
        border: 1px solid #30363d;
        border-radius: 6px;*/
        margin-bottom: 20px;
    }

    .antiddos-container .ticket-reply {
        background-color: transparent;
    }

    .antiddos-container .ticket-reply-top {
        background-color: #1c2128;
        border-bottom: 1px solid #30363d;
        padding: 15px 20px;
        border-radius: 6px 6px 0 0;
    }

    .antiddos-container .ticket-reply-top .user-info .name {
        color: #e4e4e4;
        font-weight: 600;
        font-size: 16px;
    }

    .antiddos-container .ticket-reply-message {
        background-color: #0d1117;
        padding: 20px;
        border-radius: 0 0 6px 6px;
    }

    /* Form Controls Dark Theme */
    .antiddos-container .form-control {
        background-color: #0d1117;
        border: 1px solid #30363d;
        color: #e4e4e4;
        padding: 8px 12px;
        border-radius: 6px;
    }

    .antiddos-container .form-control:focus {
        background-color: #161b22;
        border-color: #58a6ff;
        color: #e4e4e4;
        outline: none;
        box-shadow: 0 0 0 3px rgba(88, 166, 255, 0.15);
    }

    .antiddos-container .form-control option {
        background-color: #161b22;
        color: #e4e4e4;
    }

    .antiddos-container label {
        color: #8b949e;
        font-weight: 500;
        margin-bottom: 8px;
        display: block;
    }

    /* Buttons */
    .antiddos-container .btn {
        padding: 8px 16px;
        border-radius: 6px;
        font-weight: 500;
        cursor: pointer;
        border: 1px solid transparent;
        transition: all 0.2s;
    }

    .antiddos-container .btn-success {
        background-color: #238636;
        color: #ffffff;
        border-color: #238636;
    }

    .antiddos-container .btn-success:hover {
        background-color: #2ea043;
        border-color: #2ea043;
    }

    .antiddos-container .btn-primary {
        background-color: #1f6feb;
        color: #ffffff;
        border-color: #1f6feb;
    }

    .antiddos-container .btn-primary:hover {
        background-color: #388bfd;
        border-color: #388bfd;
    }

    .antiddos-container .btn-danger {
        background-color: #da3633;
        color: #ffffff;
        border-color: #da3633;
    }

    .antiddos-container .btn-danger:hover {
        background-color: #e5534b;
        border-color: #e5534b;
    }

    .antiddos-container .btn-sm {
        padding: 4px 12px;
        font-size: 12px;
    }

    /* Nav Tabs */
    .antiddos-container .nav-tabs {
        border-bottom: 1px solid #30363d;
        margin-bottom: 0;
    }

    .antiddos-container .nav-tabs .nav-link {
        color: #8b949e;
        border: none;
        padding: 12px 20px;
        background-color: transparent;
        border-bottom: 2px solid transparent;
    }

    .antiddos-container .nav-tabs .nav-link:hover {
        color: #e4e4e4;
        border-bottom-color: #30363d;
    }

    .antiddos-container .nav-tabs .nav-link.active {
        color: #e4e4e4;
        background-color: transparent;
    }

    .antiddos-container .tab-content {
        background-color: #0d1117;
        padding: 20px;
        border-radius: 0 0 6px 6px;
    }

    /* Tables */
    .antiddos-container .table {
        width: 100%;
        color: #e4e4e4;
        background-color: transparent;
    }

    .antiddos-container .table thead th {
        background-color: #161b22;
        color: #8b949e;
        border-bottom: 1px solid #30363d;
        padding: 12px;
        font-weight: 600;
        font-size: 12px;
        text-transform: uppercase;
    }

    .antiddos-container .table tbody td {
        padding: 12px;
        border-bottom: 1px solid #21262d;
    }

    .antiddos-container .table tbody tr:hover {
        background-color: #161b22;
    }

    /* Badges */
    .antiddos-container .badge {
        padding: 4px 8px;
        border-radius: 12px;
        font-size: 11px;
        font-weight: 600;
        text-transform: uppercase;
    }

    .antiddos-container .badge-success {
        background-color: #238636;
        color: #ffffff;
    }

    .antiddos-container .badge-danger {
        background-color: #da3633;
        color: #ffffff;
    }

    .antiddos-container .badge-warning {
        background-color: #bb8009;
        color: #ffffff;
    }

    .antiddos-container .badge-info {
        background-color: #1f6feb;
        color: #ffffff;
    }

    /* Chart Container */
    .antiddos-container .chart-container {
        background-color: #0d1117;
        padding: 20px;
        border-radius: 6px;
        border: 1px solid #30363d;
    }

    .antiddos-container #bandwidthChart {
        max-height: 350px !important;
        height: 350px !important;
    }

    /* Stat Cards */
    .antiddos-container .stat-card {
        background-color: #161b22;
        border: 1px solid #30363d;
        border-radius: 6px;
        padding: 20px;
        margin-bottom: 15px;
    }

    .antiddos-container .stat-card h4 {
        color: #e4e4e4;
        margin: 0 0 15px 0;
        font-size: 16px;
        font-weight: 600;
    }

    /* Search Box */
    .antiddos-container .search-box {
        display: flex;
        gap: 10px;
        margin-bottom: 20px;
    }

    .antiddos-container .search-box input {
        flex: 1;
    }

    /* Empty State */
    .antiddos-container .empty-state {
        text-align: center;
        padding: 60px 20px;
        color: #8b949e;
    }

    .antiddos-container .empty-state i {
        font-size: 48px;
        margin-bottom: 20px;
        display: block;
        opacity: 0.5;
    }

    /* Loading Overlay */
    .loading-overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: rgba(13, 17, 23, 0.8);
        z-index: 10000;
        align-items: center;
        justify-content: center;
    }

    .loading-overlay.active {
        display: flex;
    }

    .loading-spinner {
        border: 4px solid #30363d;
        border-top: 4px solid #58a6ff;
        border-radius: 50%;
        width: 50px;
        height: 50px;
        animation: spin 1s linear infinite;
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }

    /* Modal Styling - Let Bootstrap handle display logic */
    .antiddos-container .modal-content {
        background-color: #0d1117;
        border: 1px solid #30363d;
        border-radius: 12px;
        box-shadow: 0 16px 32px rgba(0, 0, 0, 0.4);
    }

    .antiddos-container .modal-header {
        background-color: #161b22;
        border-bottom: 1px solid #30363d;
        border-radius: 12px 12px 0 0;
    }

    .antiddos-container .modal-header .modal-title {
        color: #e4e4e4;
    }

    .antiddos-container .modal-body {
        background-color: #0d1117;
        color: #e4e4e4;
    }

    .antiddos-container .modal-footer {
        background-color: #0d1117;
        border-top: 1px solid #30363d;
        border-radius: 0 0 12px 12px;
    }

    .antiddos-container .modal .close {
        color: #8b949e;
        opacity: 1;
    }

    .antiddos-container .modal .close:hover {
        color: #e4e4e4;
    }

    /* Modal backdrop */
    .modal-backdrop {
        background-color: rgba(13, 17, 23, 0.85);
    }

    /* Enhanced Modal Styling */
    .modal-lg {
        max-width: 900px;
    }

    .antiddos-container .modal-body label {
        font-size: 13px;
        font-weight: 600;
        margin-bottom: 8px;
    }

    .antiddos-container .modal-body label i {
        margin-right: 6px;
        color: #58a6ff;
        font-size: 12px;
    }

    .antiddos-container .modal-body .form-control {
        transition: all 0.2s;
    }

    .antiddos-container .modal-body .form-control:hover {
        border-color: #58a6ff;
    }

    .antiddos-container .modal-body small {
        font-size: 11px;
        line-height: 1.4;
    }

    .antiddos-container .modal-header h5 {
        font-size: 18px;
        font-weight: 600;
    }

    .antiddos-container .modal-header h5 i {
        margin-right: 10px;
    }

    .antiddos-container .modal-footer .btn {
        padding: 10px 24px;
        font-weight: 600;
    }

    /* Pagination */
    .antiddos-container .pagination {
        display: flex;
        list-style: none;
        padding: 0;
        gap: 5px;
        margin-top: 20px;
    }

    .antiddos-container .pagination li a {
        padding: 8px 12px;
        background-color: #161b22;
        border: 1px solid #30363d;
        border-radius: 6px;
        color: #e4e4e4;
        text-decoration: none;
        transition: all 0.2s;
    }

    .antiddos-container .pagination li a:hover {
        background-color: #1c2128;
        border-color: #58a6ff;
    }

    .antiddos-container .pagination li.active a {
        background-color: #1f6feb;
        border-color: #1f6feb;
        color: #ffffff;
    }

    .antiddos-container .pagination li.disabled a {
        background-color: transparent;
        border-color: transparent;
        color: #8b949e;
        cursor: default;
        pointer-events: none;
    }

    .antiddos-container .pagination li.disabled a:hover {
        background-color: transparent;
        border-color: transparent;
    }

    /* Form Groups */
    .antiddos-container .form-group {
        margin-bottom: 20px;
    }

    /* Action Buttons Container */
    .antiddos-container .actions-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .antiddos-container .actions-header h3 {
        margin: 0;
        color: #e4e4e4;
        font-size: 20px;
        font-weight: 600;
    }

    /* Alert Box */
    .antiddos-container .alert {
        padding: 15px 20px;
        border-radius: 6px;
        border: 1px solid;
        margin-bottom: 20px;
    }

    .antiddos-container .alert-warning {
        background-color: #3d2b00;
        border-color: #9e6a03;
        color: #f0c969;
    }

    .antiddos-container .alert-info {
        background-color: #0c2d6b;
        border-color: #1f6feb;
        color: #79c0ff;
    }

    /* Code/Prefix Display */
    .antiddos-container code {
        background-color: #161b22;
        color: #79c0ff;
        padding: 3px 6px;
        border-radius: 4px;
        font-family: monospace;
        font-size: 13px;
    }

    .antiddos-container .prefix-list {
        list-style: none;
        padding: 0;
    }

    .antiddos-container .prefix-list li {
        padding: 10px;
        background-color: #161b22;
        border: 1px solid #30363d;
        border-radius: 6px;
        margin-bottom: 8px;
    }

    /* Stats Widgets */
    .antiddos-container .stats-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 15px;
        margin-bottom: 25px;
    }

    .antiddos-container .stat-widget {
        background: linear-gradient(135deg, #161b22 0%, #1c2128 100%);
        border: 1px solid #30363d;
        border-radius: 8px;
        padding: 20px;
        transition: all 0.3s;
        position: relative;
        overflow: hidden;
    }

    .antiddos-container .stat-widget::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 3px;
        background: linear-gradient(90deg, #1f6feb 0%, #58a6ff 100%);
    }

    .antiddos-container .stat-widget.danger::before {
        background: linear-gradient(90deg, #da3633 0%, #f85149 100%);
    }

    .antiddos-container .stat-widget.success::before {
        background: linear-gradient(90deg, #238636 0%, #2ea043 100%);
    }

    .antiddos-container .stat-widget.warning::before {
        background: linear-gradient(90deg, #bb8009 0%, #d4a72c 100%);
    }

    .antiddos-container .stat-widget:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(31, 111, 235, 0.15);
        border-color: #58a6ff;
    }

    .antiddos-container .stat-widget-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 12px;
    }

    .antiddos-container .stat-widget-title {
        color: #8b949e;
        font-size: 13px;
        font-weight: 500;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .antiddos-container .stat-widget-icon {
        font-size: 20px;
        opacity: 0.6;
    }

    .antiddos-container .stat-widget-icon.danger {
        color: #f85149;
    }

    .antiddos-container .stat-widget-icon.success {
        color: #2ea043;
    }

    .antiddos-container .stat-widget-icon.info {
        color: #58a6ff;
    }

    .antiddos-container .stat-widget-icon.warning {
        color: #d4a72c;
    }

    .antiddos-container .stat-widget-value {
        font-size: 32px;
        font-weight: 700;
        color: #e4e4e4;
        margin: 8px 0;
        line-height: 1;
    }

    .antiddos-container .stat-widget-subtitle {
        color: #8b949e;
        font-size: 12px;
        margin-top: 8px;
    }

    .antiddos-container .stat-widget-loading {
        text-align: center;
        padding: 10px;
        color: #8b949e;
        font-size: 12px;
    }
</style>

<div class="loading-overlay" id="loadingOverlay">
    <div class="loading-spinner"></div>
</div>

<div class="antiddos-container">
    {if count($services) == 0}
        <!-- No Services Alert -->
        <div class="row">
            <div class="col-sm-12">
                <div class="alert alert-warning">
                    <h4><i class="fas fa-exclamation-triangle"></i> No Services Available</h4>
                    <p>You don't have any services with protected IPs. Please contact support if you believe this is an error.</p>
                </div>
            </div>
        </div>
    {else}
        <!-- IP Selector -->
        <div class="row mb-3">
            <div class="col-sm-12">
                <div class="card">
                    <div class="ticket-reply">
                        <div class="ticket-reply-top">
                            <div class="user">
                                <div class="user-info">
                                    <span class="name">
                                        <i class="fas fa-network-wired"></i>
                                        Select Protected Service
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="ticket-reply-message">
                            <div class="form-group" style="margin-bottom: 0;">
                                <select id="serviceSelector" class="form-control" style="max-width: 400px;">
                                    <option value="">-- Select a service --</option>
                                    {foreach from=$services item=service}
                                        <option value="{$service.ip}">{$service.ip} - {$service.hostname}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div id="serviceContent" style="display:none;">
            <!-- Main Panel with Tabs -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="card mb-3">
                        <div class="ticket-reply">
                            <div class="ticket-reply-top">
                                <div class="user">
                                    <div class="user-info">
                                        <span class="name">
                                            <i class="fas fa-shield-alt"></i>
                                            Anti-DDoS Protection Panel
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="ticket-reply-message" style="padding: 0;">
                                <!-- Tab Navigation -->
                                <ul class="nav nav-tabs" role="tablist" style="padding: 0 20px; margin: 0;">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="overview-tab" data-toggle="tab" href="#overview" role="tab">
                                            <i class="fas fa-chart-line"></i> Overview
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="rules-tab" data-toggle="tab" href="#rules" role="tab">
                                            <i class="fas fa-list-ul"></i> Rules
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="attacks-tab" data-toggle="tab" href="#attacks" role="tab">
                                            <i class="fas fa-exclamation-triangle"></i> Attacks
                                        </a>
                                    </li>
                                    <li class="nav-item" id="createRuleTabNav" style="display: none;">
                                        <a class="nav-link" id="create-rule-tab" data-toggle="tab" href="#createRule" role="tab">
                                            <i class="fas fa-plus-circle"></i> Create Rule
                                        </a>
                                    </li>
                                </ul>

                                <!-- Tab Content -->
                                <div class="tab-content">
                                    <!-- Overview Tab -->
                                    <div class="tab-pane fade show active" id="overview" role="tabpanel">
                                        <!-- Stats Widgets Grid -->
                                        <div class="stats-grid">
                                            <!-- Total Attacks -->
                                            <div class="stat-widget danger">
                                                <div class="stat-widget-header">
                                                    <span class="stat-widget-title">Total Attacks</span>
                                                    <i class="fas fa-exclamation-triangle stat-widget-icon danger"></i>
                                                </div>
                                                <div class="stat-widget-value" id="totalAttacksValue">-</div>
                                                <div class="stat-widget-subtitle">All time mitigated</div>
                                            </div>

                                            <!-- Attacks This Week -->
                                            <div class="stat-widget warning">
                                                <div class="stat-widget-header">
                                                    <span class="stat-widget-title">This Week</span>
                                                    <i class="fas fa-calendar-week stat-widget-icon warning"></i>
                                                </div>
                                                <div class="stat-widget-value" id="weekAttacksValue">-</div>
                                                <div class="stat-widget-subtitle">Attacks last 7 days</div>
                                            </div>

                                            <!-- Attacks Today -->
                                            <div class="stat-widget info">
                                                <div class="stat-widget-header">
                                                    <span class="stat-widget-title">Today</span>
                                                    <i class="fas fa-clock stat-widget-icon info"></i>
                                                </div>
                                                <div class="stat-widget-value" id="todayAttacksValue">-</div>
                                                <div class="stat-widget-subtitle">Attacks mitigated today</div>
                                            </div>

                                            <!-- Average Passed Traffic -->
                                            <div class="stat-widget success">
                                                <div class="stat-widget-header">
                                                    <span class="stat-widget-title">Avg Passed</span>
                                                    <i class="fas fa-arrow-up stat-widget-icon success"></i>
                                                </div>
                                                <div class="stat-widget-value" id="avgPassedValue">-</div>
                                                <div class="stat-widget-subtitle" id="avgPassedUnit">Clean traffic</div>
                                            </div>

                                            <!-- Average Dropped Traffic -->
                                            <div class="stat-widget danger">
                                                <div class="stat-widget-header">
                                                    <span class="stat-widget-title">Avg Dropped</span>
                                                    <i class="fas fa-arrow-down stat-widget-icon danger"></i>
                                                </div>
                                                <div class="stat-widget-value" id="avgDroppedValue">-</div>
                                                <div class="stat-widget-subtitle" id="avgDroppedUnit">Blocked traffic</div>
                                            </div>
                                        </div>

                                        <!-- Bandwidth Chart -->
                                        <div style="margin-top: 20px;">
                                            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px; flex-wrap: wrap; gap: 10px;">
                                                <h4 style="margin: 0; color: #e4e4e4;">Bandwidth Overview</h4>
                                                <div style="display: flex; gap: 10px; align-items: center;">
                                                    <select id="overviewPeriod" class="form-control" style="max-width: 150px;">
                                                        <option value="10m">Last 10 Minutes</option>
                                                        <option value="1h">Last Hour</option>
                                                        <option value="1d">Last Day</option>
                                                        <option value="1w">Last Week</option>
                                                    </select>
                                                    <div style="display: flex; align-items: center; gap: 8px; background-color: #161b22; padding: 6px 12px; border-radius: 6px; border: 1px solid #30363d;">
                                                        <label style="margin: 0; color: #8b949e; font-size: 13px; display: flex; align-items: center; gap: 6px; cursor: pointer; white-space: nowrap;">
                                                            <input type="checkbox" id="autoRefreshEnabled" style="cursor: pointer;">
                                                            <span>Auto-refresh</span>
                                                        </label>
                                                        <select id="autoRefreshInterval" class="form-control" style="width: 70px; padding: 4px 8px; font-size: 13px;" disabled>
                                                            <option value="10" selected>10s</option>
                                                            <option value="30">30s</option>
                                                            <option value="60">1m</option>
                                                            <option value="300">5m</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: flex; flex-direction: column; gap: 20px; position: relative;">
                                                <div id="chartLoadingOverlay" style="display: none; position: absolute; top: 0; left: 0; right: 0; bottom: 0; background-color: rgba(13, 17, 23, 0.8); z-index: 10; border-radius: 6px; align-items: center; justify-content: center;">
                                                    <div style="text-align: center;">
                                                        <div class="loading-spinner" style="margin: 0 auto;"></div>
                                                        <p style="color: #8b949e; margin-top: 15px; font-size: 13px;">Updating charts...</p>
                                                    </div>
                                                </div>
                                                <div class="chart-container" style="height: 450px;">
                                                    <h5 id="passTrafficTitle" style="color: #2ea043; margin-bottom: 10px; font-size: 14px; text-align: center;">
                                                        <i class="fas fa-check-circle"></i> Pass Traffic (Clean)
                                                    </h5>
                                                    <div id="passTrafficChart" style="width: 100%; height: 370px;"></div>
                                                </div>
                                                <div class="chart-container" style="height: 450px;">
                                                    <h5 id="dropTrafficTitle" style="color: #f85149; margin-bottom: 10px; font-size: 14px; text-align: center;">
                                                        <i class="fas fa-shield-alt"></i> Drop Traffic (Blocked)
                                                    </h5>
                                                    <div id="dropTrafficChart" style="width: 100%; height: 370px;"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Rules Tab -->
                                    <div class="tab-pane fade" id="rules" role="tabpanel">
                                        <div class="actions-header">
                                            <h3>Anti-DDoS Rules</h3>
                                            <button class="btn btn-success" onclick="openCreateRuleTab(); return false;">
                                                <i class="fas fa-plus"></i> Create Rule
                                            </button>
                                        </div>

                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>IP Address</th>
                                                        <th>Port</th>
                                                        <th>Protocol</th>
                                                        <th>Application</th>
                                                        <th>State</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="rulesTableBody">
                                                    <tr>
                                                        <td colspan="7" class="empty-state">
                                                            <i class="fas fa-shield-alt"></i>
                                                            <p>Select a service to view rules</p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                        <div id="rulesPagination"></div>
                                    </div>

                                    <!-- Attacks Tab -->
                                    <div class="tab-pane fade" id="attacks" role="tabpanel">
                                        <div class="actions-header">
                                            <h3 style="margin-bottom: 20px;">Attack History</h3>
                                        </div>

                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Target IP</th>
                                                        <th>Started</th>
                                                        <th>Ended</th>
                                                        <th>Max Peak</th>
                                                        <th>Flags</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="attacksTableBody">
                                                    <tr>
                                                        <td colspan="7" class="empty-state">
                                                            <i class="fas fa-shield-alt"></i>
                                                            <p>Select a service to view attack history</p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                        <div id="attacksPagination"></div>
                                    </div>

                                    <!-- Create Rule Tab -->
                                    <div class="tab-pane fade" id="createRule" role="tabpanel">
                                        <div class="actions-header">
                                            <h3><i class="fas fa-shield-alt" style="color: #58a6ff;"></i> Create New Anti-DDoS Rule</h3>
                                            <button class="btn btn-secondary" onclick="cancelCreateRule(); return false;">
                                                <i class="fas fa-times"></i> Cancel
                                            </button>
                                        </div>

                                        <form id="createRuleForm">
                                            <!-- Basic Configuration Section -->
                                            <div style="background-color: #161b22; padding: 25px; border-radius: 8px; margin-bottom: 20px; border: 1px solid #30363d;">
                                                <h6 style="color: #58a6ff; margin-bottom: 25px; font-size: 14px; text-transform: uppercase; letter-spacing: 0.5px;">
                                                    <i class="fas fa-cog"></i> Basic Configuration
                                                </h6>
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label><i class="fas fa-network-wired"></i> Protocol *</label>
                                                            <select id="ruleProtocol" class="form-control" required onchange="handleProtocolChange()">
                                                                <option value="">-- Select Protocol --</option>
                                                                <option value="TCP">TCP</option>
                                                                <option value="UDP">UDP</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label><i class="fas fa-layer-group"></i> Application *</label>
                                                            <select id="ruleApplicationId" class="form-control" required disabled onchange="handleApplicationChange()">
                                                                <option value="">-- Select Protocol First --</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label><i class="fas fa-plug"></i> Port *</label>
                                                            <input type="number" id="rulePort" class="form-control" min="1" max="65535" placeholder="e.g. 80" required>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Custom TCP Options Section -->
                                            <div id="customTcpOptions" style="display:none; background-color: #161b22; padding: 25px; border-radius: 8px; margin-bottom: 20px; border: 1px solid #30363d;">
                                                <h6 style="color: #d4a72c; margin-bottom: 25px; font-size: 14px; text-transform: uppercase; letter-spacing: 0.5px;">
                                                    <i class="fas fa-sliders-h"></i> Advanced TCP Options
                                                </h6>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label>
                                                                <i class="fas fa-link"></i> Max Connections per Minute
                                                                <small style="color: #8b949e; display: block; font-weight: normal; margin-top: 5px;">Every SYN packet is counted as a connection</small>
                                                            </label>
                                                            <input type="number" id="ruleMaxConnections" class="form-control" min="1" max="65534" placeholder="e.g. 100">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label>
                                                                <i class="fas fa-hand-paper"></i> Max Connections Action
                                                                <small style="color: #8b949e; display: block; font-weight: normal; margin-top: 5px;">Action after reaching the connections per minute</small>
                                                            </label>
                                                            <select id="ruleMaxConnectionsAction" class="form-control">
                                                                <option value="">-- Select Action --</option>
                                                                <option value="drop">Drop - Block connection</option>
                                                                <option value="cookie">Cookie - Challenge with cookie</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label>
                                                                <i class="fas fa-cube"></i> Max Packet Size (bytes)
                                                                <small style="color: #8b949e; display: block; font-weight: normal; margin-top: 5px;">Zero (0) for unlimited - 1500 by default</small>
                                                            </label>
                                                            <input type="number" id="ruleMaxPacketSize" class="form-control" min="0" max="1500" placeholder="0 = unlimited, default: 1500">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>
                                                                <i class="fas fa-cubes"></i> Max Packets Per Second Per Connection
                                                                <small style="color: #8b949e; display: block; font-weight: normal; margin-top: 5px;">Zero (0) for unlimited</small>
                                                            </label>
                                                            <input type="number" id="ruleMaxPacketNum" class="form-control" min="0" max="65534" placeholder="0 = unlimited">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>
                                                                <i class="fas fa-tachometer-alt"></i> Max Bytes Per Second Per Connection
                                                                <small style="color: #8b949e; display: block; font-weight: normal; margin-top: 5px;">Zero (0) for unlimited</small>
                                                            </label>
                                                            <input type="number" id="ruleMaxBytes" class="form-control" min="0" max="65534" placeholder="0 = unlimited">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Submit Button -->
                                            <div style="text-align: right;">
                                                <button type="button" class="btn btn-secondary" onclick="cancelCreateRule(); return false;" style="margin-right: 10px;">
                                                    <i class="fas fa-times"></i> Cancel
                                                </button>
                                                <button type="submit" class="btn btn-success btn-lg">
                                                    <i class="fas fa-check"></i> Create Rule
                                                </button>
                                            </div>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    {/if}
</div>

<!-- jQuery and Toastr -->
<!--<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<script>
{literal}
// Global variables
let currentIp = null;
let currentPage = 1;
let passTrafficChart = null;
let dropTrafficChart = null;
let applicationsData = [];
let rulesMonitorInterval = null;
let overviewAutoRefreshInterval = null;

// Configure toastr
toastr.options = {
    closeButton: true,
    progressBar: true,
    positionClass: "toast-top-right",
    timeOut: 3000
};

// Show/Hide loading overlay
function showLoading() {
    document.getElementById('loadingOverlay').classList.add('active');
}

function hideLoading() {
    document.getElementById('loadingOverlay').classList.remove('active');
}

// Show/Hide chart loading overlay
function showChartLoading() {
    const overlay = document.getElementById('chartLoadingOverlay');
    if (overlay) {
        overlay.style.display = 'flex';
    }
}

function hideChartLoading() {
    const overlay = document.getElementById('chartLoadingOverlay');
    if (overlay) {
        overlay.style.display = 'none';
    }
}

// Service selector change handler
document.getElementById('serviceSelector').addEventListener('change', function() {
    currentIp = this.value;
    if (currentIp) {
        document.getElementById('serviceContent').style.display = 'block';
        loadOverview();
        loadApplications();
        loadAttackStats();
    } else {
        document.getElementById('serviceContent').style.display = 'none';
    }
});

// Overview period change handler
document.getElementById('overviewPeriod').addEventListener('change', function() {
    loadOverview();
});

// Auto-refresh checkbox handler
document.getElementById('autoRefreshEnabled').addEventListener('change', function() {
    const intervalSelect = document.getElementById('autoRefreshInterval');
    intervalSelect.disabled = !this.checked;

    if (this.checked) {
        startOverviewAutoRefresh();
    } else {
        stopOverviewAutoRefresh();
    }
});

// Auto-refresh interval change handler
document.getElementById('autoRefreshInterval').addEventListener('change', function() {
    if (document.getElementById('autoRefreshEnabled').checked) {
        stopOverviewAutoRefresh();
        startOverviewAutoRefresh();
    }
});

// Start overview auto-refresh
function startOverviewAutoRefresh() {
    if (overviewAutoRefreshInterval) {
        clearInterval(overviewAutoRefreshInterval);
    }

    const intervalSeconds = parseInt(document.getElementById('autoRefreshInterval').value);
    console.log(`[Anti-DDoS] Starting overview auto-refresh every ${intervalSeconds} seconds`);

    overviewAutoRefreshInterval = setInterval(function() {
        if (currentIp) {
            loadOverview(true); // Pass true to indicate auto-refresh
        }
    }, intervalSeconds * 1000);
}

// Stop overview auto-refresh
function stopOverviewAutoRefresh() {
    if (overviewAutoRefreshInterval) {
        console.log('[Anti-DDoS] Stopping overview auto-refresh');
        clearInterval(overviewAutoRefreshInterval);
        overviewAutoRefreshInterval = null;
    }
}

// Bootstrap tab show handler
$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    const target = $(e.target).attr("href");

    if (target === '#overview') {
        // Restart auto-refresh if it was enabled
        if (document.getElementById('autoRefreshEnabled').checked) {
            startOverviewAutoRefresh();
        }
    } else {
        // Stop auto-refresh when leaving overview tab
        stopOverviewAutoRefresh();
    }

    if (target === '#rules') {
        loadRules(1);
        startRulesMonitoring();
    } else {
        stopRulesMonitoring();
    }

    if (target === '#attacks') loadAttacks(1);
});

// Convert traffic peak to Gbps
function convertToGbps(peakValue) {
    if (!peakValue && peakValue !== 0) return 'N/A';

    // If it's a plain number, use API-specific conversion factor
    // 152055520 -> 1.13 Gbps, so factor is ~134500000
    if (typeof peakValue === 'number') {
        const gbpsValue = peakValue / 134500000;
        return gbpsValue.toFixed(2) + ' Gbps';
    }

    // If it's a string, try to parse it
    const peakString = peakValue.toString();

    // Check if it's a numeric string without units (like "152055520")
    if (/^\d+(\.\d+)?$/.test(peakString)) {
        const gbpsValue = parseFloat(peakString) / 134500000;
        return gbpsValue.toFixed(2) + ' Gbps';
    }

    // Extract number and unit from string like "1500 Mbps" or "2.5 Gbps"
    const match = peakString.match(/([\d.]+)\s*([KMG]?bps|[KMG]b)/i);
    if (!match) return peakString;

    const value = parseFloat(match[1]);
    const unit = match[2].toUpperCase();

    let gbpsValue = value;
    if (unit.startsWith('M')) {
        gbpsValue = value / 1000; // Mbps to Gbps
    } else if (unit.startsWith('K')) {
        gbpsValue = value / 1000000; // Kbps to Gbps
    }
    // If already Gbps, no conversion needed

    return gbpsValue.toFixed(2) + ' Gbps';
}

// Open create rule tab
function openCreateRuleTab() {
    // Show the tab navigation item
    document.getElementById('createRuleTabNav').style.display = 'block';
    // Switch to the create rule tab
    $('#create-rule-tab').tab('show');
}

// Cancel create rule and go back to rules tab
function cancelCreateRule() {
    // Reset form
    document.getElementById('createRuleForm').reset();
    document.getElementById('customTcpOptions').style.display = 'none';
    document.getElementById('ruleApplicationId').disabled = true;
    document.getElementById('ruleApplicationId').innerHTML = '<option value="">-- Select Protocol First --</option>';
    document.getElementById('ruleProtocol').value = '';

    // Hide the create rule tab navigation
    document.getElementById('createRuleTabNav').style.display = 'none';
    // Switch back to rules tab
    $('#rules-tab').tab('show');
}

// Load overview data
function loadOverview(isAutoRefresh = false) {
    if (!currentIp) return;

    const period = document.getElementById('overviewPeriod').value;

    // Use chart loading for auto-refresh, full page loading for manual refresh
    if (isAutoRefresh) {
        showChartLoading();
    } else {
        showLoading();
    }

    $.ajax({
        url: 'modules/addons/antiddos_panel/ajax.php',
        method: 'GET',
        data: {
            action: 'getOverview',
            ip: currentIp,
            period: period,
            query_ip: currentIp  // Filter by specific IP
        },
        success: function(response) {
            if (isAutoRefresh) {
                hideChartLoading();
            } else {
                hideLoading();
            }

            // Check for error or message field
            if (response.error || response.message) {
                showNoDataMessage('There is no traffic data available for now');
                return;
            }

            // Check if there's actual bandwidth data
            if (!response.bandwidth_data || response.bandwidth_data.length === 0) {
                showNoDataMessage('There is no traffic data available for now');
                return;
            }

            renderBandwidthChart(response);
        },
        error: function() {
            if (isAutoRefresh) {
                hideChartLoading();
            } else {
                hideLoading();
            }
            toastr.error('Failed to load overview data');
        }
    });
}

// Show no data message in chart area
function showNoDataMessage(message) {
    // Clear existing charts
    if (passTrafficChart) {
        passTrafficChart.dispose();
        passTrafficChart = null;
    }
    if (dropTrafficChart) {
        dropTrafficChart.dispose();
        dropTrafficChart = null;
    }

    // Display message in both chart containers
    const passDiv = document.getElementById('passTrafficChart');
    const dropDiv = document.getElementById('dropTrafficChart');

    const noDataHtml = `
        <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 100%; color: #8b949e;">
            <i class="fas fa-chart-line" style="font-size: 48px; margin-bottom: 15px; opacity: 0.3;"></i>
            <p style="font-size: 14px; margin: 0;">${message}</p>
        </div>
    `;

    passDiv.innerHTML = noDataHtml;
    dropDiv.innerHTML = noDataHtml;

    // Clear chart titles units
    document.getElementById('passTrafficTitle').innerHTML = '<i class="fas fa-check-circle"></i> Pass Traffic (Clean)';
    document.getElementById('dropTrafficTitle').innerHTML = '<i class="fas fa-shield-alt"></i> Drop Traffic (Blocked)';
}

// Render bandwidth charts (separate for Pass and Drop) - ECharts version
function renderBandwidthChart(data) {
    // Dispose existing charts
    if (passTrafficChart) {
        passTrafficChart.dispose();
    }
    if (dropTrafficChart) {
        dropTrafficChart.dispose();
    }

    // Sort data by time to ensure oldest is on left, newest on right
    let sortedData = data.bandwidth_data ? [...data.bandwidth_data] : [];
    sortedData.sort((a, b) => new Date(a.time) - new Date(b.time));

    const labels = sortedData.map(d => {
        const date = new Date(d.time);
        return date.toLocaleTimeString();
    });
    const passData = sortedData.map(d => parseFloat(d.total_pass_traffic));
    const dropData = sortedData.map(d => parseFloat(d.total_drop_traffic));

    // Calculate averages for widgets
    if (passData.length > 0) {
        const avgPassed = (passData.reduce((a, b) => a + b, 0) / passData.length).toFixed(2);
        document.getElementById('avgPassedValue').textContent = avgPassed;
        document.getElementById('avgPassedUnit').textContent = 'Average ' + (data.pass_unit || 'Kb') + '/s';
    }

    if (dropData.length > 0) {
        const avgDropped = (dropData.reduce((a, b) => a + b, 0) / dropData.length).toFixed(2);
        document.getElementById('avgDroppedValue').textContent = avgDropped;
        document.getElementById('avgDroppedUnit').textContent = 'Average ' + (data.drop_unit || 'Kb') + '/s';
    }

    const passUnit = data.pass_unit || 'Kb';
    const dropUnit = data.drop_unit || 'Kb';

    // Common ECharts options
    const getCommonOption = (seriesData, color, unit) => ({
        backgroundColor: 'transparent',
        tooltip: {
            trigger: 'axis',
            backgroundColor: 'rgba(13, 17, 23, 0.95)',
            borderColor: '#30363d',
            borderWidth: 1,
            textStyle: {
                color: '#e4e4e4'
            },
            axisPointer: {
                type: 'cross',
                lineStyle: {
                    color: '#30363d'
                }
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '18%',
            top: '8%',
            containLabel: true
        },
        dataZoom: [
            {
                type: 'slider',
                start: 0,
                end: 100,
                height: 30,
                bottom: 15,
                handleIcon: 'path://M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                handleSize: '100%',
                handleStyle: {
                    color: color,
                    borderColor: '#30363d'
                },
                textStyle: {
                    color: '#8b949e'
                },
                borderColor: '#30363d',
                backgroundColor: '#161b22',
                dataBackground: {
                    lineStyle: {
                        color: color,
                        opacity: 0.5
                    },
                    areaStyle: {
                        color: color,
                        opacity: 0.2
                    }
                },
                selectedDataBackground: {
                    lineStyle: {
                        color: color
                    },
                    areaStyle: {
                        color: color,
                        opacity: 0.3
                    }
                },
                fillerColor: 'rgba(46, 160, 67, 0.1)',
                labelFormatter: function(value, valueStr) {
                    return labels[value] || valueStr;
                }
            },
            {
                type: 'inside',
                start: 0,
                end: 100,
                zoomOnMouseWheel: 'ctrl',
                moveOnMouseMove: true,
                moveOnMouseWheel: false
            }
        ],
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: labels,
            axisLine: {
                lineStyle: {
                    color: '#30363d'
                }
            },
            axisLabel: {
                color: '#8b949e',
                rotate: 45
            }
        },
        yAxis: {
            type: 'value',
            axisLine: {
                lineStyle: {
                    color: '#30363d'
                }
            },
            axisLabel: {
                color: '#8b949e',
                formatter: function(value) {
                    return value + ' ' + unit + '/s';
                }
            },
            splitLine: {
                lineStyle: {
                    color: '#30363d'
                }
            }
        },
        series: [{
            name: unit + '/s',
            type: 'line',
            smooth: true,
            data: seriesData,
            lineStyle: {
                color: color,
                width: 2
            },
            areaStyle: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                    { offset: 0, color: color + '40' },
                    { offset: 1, color: color + '00' }
                ])
            },
            itemStyle: {
                color: color
            }
        }]
    });

    // Pass Traffic Chart
    const passDiv = document.getElementById('passTrafficChart');
    passTrafficChart = echarts.init(passDiv);
    passTrafficChart.setOption(getCommonOption(passData, '#2ea043', passUnit));

    // Drop Traffic Chart
    const dropDiv = document.getElementById('dropTrafficChart');
    dropTrafficChart = echarts.init(dropDiv);
    dropTrafficChart.setOption(getCommonOption(dropData, '#f85149', dropUnit));

    // Synchronize zoom between charts
    let isSyncing = false;

    passTrafficChart.on('datazoom', function(params) {
        if (isSyncing) return;
        isSyncing = true;

        dropTrafficChart.setOption({
            dataZoom: [{
                start: params.start,
                end: params.end
            }]
        });

        setTimeout(() => { isSyncing = false; }, 50);
    });

    dropTrafficChart.on('datazoom', function(params) {
        if (isSyncing) return;
        isSyncing = true;

        passTrafficChart.setOption({
            dataZoom: [{
                start: params.start,
                end: params.end
            }]
        });

        setTimeout(() => { isSyncing = false; }, 50);
    });

    // Update chart titles with units
    document.getElementById('passTrafficTitle').innerHTML = `<i class="fas fa-check-circle"></i> Pass Traffic (Clean) <span style="font-weight: normal; color: #8b949e;">[${passUnit}/s]</span>`;
    document.getElementById('dropTrafficTitle').innerHTML = `<i class="fas fa-shield-alt"></i> Drop Traffic (Blocked) <span style="font-weight: normal; color: #8b949e;">[${dropUnit}/s]</span>`;

    // Handle window resize
    window.addEventListener('resize', function() {
        if (passTrafficChart) passTrafficChart.resize();
        if (dropTrafficChart) dropTrafficChart.resize();
    });
}

// Load attack statistics
function loadAttackStats() {
    if (!currentIp) return;

    // Load all attacks to calculate stats
    $.ajax({
        url: 'modules/addons/antiddos_panel/ajax.php',
        method: 'GET',
        data: {
            action: 'getAttacks',
            ip: currentIp,
            page: 1,
            max_view: 0 // Get all attacks
        },
        success: function(response) {
            if (response.error) {
                console.error('Failed to load attack stats:', response.error);
                return;
            }
            calculateAttackStats(response.data || []);
        },
        error: function() {
            console.error('Failed to load attack stats');
        }
    });
}

// Calculate attack statistics
function calculateAttackStats(attacks) {
    const now = new Date();
    const todayStart = new Date(now.getFullYear(), now.getMonth(), now.getDate());
    const weekStart = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000);

    let totalAttacks = attacks.length;
    let weekAttacks = 0;
    let todayAttacks = 0;

    attacks.forEach(attack => {
        const attackDate = new Date(attack.started_at);

        if (attackDate >= weekStart) {
            weekAttacks++;
        }

        if (attackDate >= todayStart) {
            todayAttacks++;
        }
    });

    // Update widgets
    document.getElementById('totalAttacksValue').textContent = totalAttacks.toLocaleString();
    document.getElementById('weekAttacksValue').textContent = weekAttacks.toLocaleString();
    document.getElementById('todayAttacksValue').textContent = todayAttacks.toLocaleString();
}

// Load applications
function loadApplications() {
    $.ajax({
        url: 'modules/addons/antiddos_panel/ajax.php',
        method: 'GET',
        data: {
            action: 'getApplications'
        },
        success: function(response) {
            if (response.error) {
                toastr.error(response.error);
                return;
            }
            applicationsData = response.data || [];
            populateApplicationsDropdown();
        },
        error: function() {
            toastr.error('Failed to load applications');
        }
    });
}

// Populate applications dropdown
function populateApplicationsDropdown(protocolFilter = null) {
    const select = document.getElementById('ruleApplicationId');
    select.innerHTML = '<option value="">-- Select Application --</option>';

    const filteredApps = protocolFilter
        ? applicationsData.filter(app => app.protocol === protocolFilter)
        : applicationsData;

    if (filteredApps.length === 0) {
        select.innerHTML = '<option value="">No applications available</option>';
        select.disabled = true;
        return;
    }

    select.disabled = false;
    filteredApps.forEach(app => {
        const option = document.createElement('option');
        option.value = app.app_id;
        option.textContent = app.name + (app.note ? ' - ' + app.note : '');
        option.dataset.protocol = app.protocol;
        option.dataset.name = app.name; // Store the application name
        select.appendChild(option);
    });
}

// Handle protocol change in create rule form
function handleProtocolChange() {
    const protocolSelect = document.getElementById('ruleProtocol');
    const selectedProtocol = protocolSelect.value;

    if (selectedProtocol) {
        populateApplicationsDropdown(selectedProtocol);
    } else {
        document.getElementById('ruleApplicationId').innerHTML = '<option value="">-- Select Protocol First --</option>';
        document.getElementById('ruleApplicationId').disabled = true;
        document.getElementById('customTcpOptions').style.display = 'none';
    }
}

// Handle application change in create rule form
function handleApplicationChange() {
    const appSelect = document.getElementById('ruleApplicationId');
    const selectedOption = appSelect.options[appSelect.selectedIndex];
    const customOptions = document.getElementById('customTcpOptions');

    if (selectedOption && selectedOption.dataset.name === 'Custom') {
        customOptions.style.display = 'block';
    } else {
        customOptions.style.display = 'none';
    }
}

// Load rules
function loadRules(page) {
    if (!currentIp) return;

    currentPage = page;
    showLoading();

    $.ajax({
        url: 'modules/addons/antiddos_panel/ajax.php',
        method: 'GET',
        data: {
            action: 'getRules',
            ip: currentIp,
            page: page,
            max_view: 10
        },
        success: function(response) {
            hideLoading();
            if (response.error) {
                toastr.error(response.error);
                return;
            }
            renderRulesTable(response);
            checkRulesNeedMonitoring(response.data);
        },
        error: function() {
            hideLoading();
            toastr.error('Failed to load rules');
        }
    });
}

// Check if any rules need monitoring
function checkRulesNeedMonitoring(rules) {
    if (!rules) return;

    const needsMonitoring = rules.some(rule =>
        rule.internal_state === 'creating' ||
        rule.internal_state === 'create' ||
        rule.internal_state === 'delete'
    );

    if (needsMonitoring && !rulesMonitorInterval) {
        startRulesMonitoring();
    } else if (!needsMonitoring && rulesMonitorInterval) {
        stopRulesMonitoring();
    }
}

// Start monitoring rules with transitional states
function startRulesMonitoring() {
    if (rulesMonitorInterval) return;

    console.log('[Anti-DDoS] Starting rules monitoring...');

    rulesMonitorInterval = setInterval(function() {
        if (!currentIp) {
            stopRulesMonitoring();
            return;
        }

        $.ajax({
            url: 'modules/addons/antiddos_panel/ajax.php',
            method: 'GET',
            data: {
                action: 'getRules',
                ip: currentIp,
                page: currentPage,
                max_view: 10
            },
            success: function(response) {
                if (response.error) return;

                const oldRules = [];
                const tbody = document.getElementById('rulesTableBody');
                tbody.querySelectorAll('tr').forEach(row => {
                    const ruleId = row.cells[0]?.textContent;
                    const state = row.querySelector('.badge')?.textContent.trim();
                    if (ruleId && state) {
                        oldRules.push({ id: ruleId, state: state });
                    }
                });

                renderRulesTable(response);

                // Check for state changes and show notifications
                response.data.forEach(newRule => {
                    const oldRule = oldRules.find(r => r.id === newRule.rule_id.toString());
                    if (oldRule) {
                        const oldStateNormalized = oldRule.state.toLowerCase().trim();
                        if ((oldStateNormalized === 'creating' || oldStateNormalized === 'create') &&
                            newRule.internal_state === 'working') {
                            console.log(`[Anti-DDoS] Rule ${newRule.rule_id} changed from ${oldStateNormalized} to working`);
                            toastr.success(`Rule ${newRule.rule_id} is now active!`);
                        }
                    }
                });

                // Check if any rule was deleted
                oldRules.forEach(oldRule => {
                    if (oldRule.state === 'deleting') {
                        const stillExists = response.data.find(r => r.rule_id.toString() === oldRule.id);
                        if (!stillExists) {
                            toastr.success(`Rule ${oldRule.id} deleted successfully!`);
                        }
                    }
                });

                checkRulesNeedMonitoring(response.data);
            }
        });
    }, 2000); // Check every 2 seconds
}

// Stop monitoring rules
function stopRulesMonitoring() {
    if (rulesMonitorInterval) {
        console.log('[Anti-DDoS] Stopping rules monitoring');
        clearInterval(rulesMonitorInterval);
        rulesMonitorInterval = null;
    }
}

// Render rules table
function renderRulesTable(response) {
    const tbody = document.getElementById('rulesTableBody');
    tbody.innerHTML = '';

    if (!response.data || response.data.length === 0) {
        tbody.innerHTML = '<tr><td colspan="7" class="empty-state"><i class="fas fa-shield-alt"></i><p>No rules found</p></td></tr>';
        return;
    }

    response.data.forEach(rule => {
        const tr = document.createElement('tr');

        // Determine state badge and icon
        let stateBadge = '';
        if (rule.internal_state === 'working') {
            stateBadge = '<span class="badge badge-success"><i class="fas fa-check-circle"></i> working</span>';
        } else if (rule.internal_state === 'creating' || rule.internal_state === 'create') {
            stateBadge = '<span class="badge badge-warning"><i class="fas fa-spinner fa-spin"></i> ' + rule.internal_state + '</span>';
        } else if (rule.internal_state === 'delete') {
            stateBadge = '<span class="badge badge-danger"><i class="fas fa-spinner fa-spin"></i> deleting</span>';
        } else {
            stateBadge = `<span class="badge badge-info">${rule.internal_state}</span>`;
        }

        // Show delete button only if state is working
        let actionButton = '';
        if (rule.internal_state === 'working') {
            actionButton = `
                <button class="btn btn-danger btn-sm" onclick="deleteRule(${rule.rule_id})">
                    <i class="fas fa-trash"></i>
                </button>
            `;
        } else if (rule.internal_state === 'delete') {
            actionButton = '<span style="color: #8b949e; font-size: 12px;"><i class="fas fa-spinner fa-spin"></i> Deleting...</span>';
        } else if (rule.internal_state === 'create' || rule.internal_state === 'creating') {
            actionButton = '<span style="color: #8b949e; font-size: 12px;"><i class="fas fa-spinner fa-spin"></i> Creating...</span>';
        } else {
            actionButton = '<span style="color: #8b949e; font-size: 12px;">-</span>';
        }

        tr.innerHTML = `
            <td>${rule.rule_id}</td>
            <td><code>${rule.ip}</code></td>
            <td><strong>${rule.port}</strong></td>
            <td><span class="badge badge-info">${rule.protocol}</span></td>
            <td>${rule.name || 'N/A'}</td>
            <td>${stateBadge}</td>
            <td>${actionButton}</td>
        `;
        tbody.appendChild(tr);
    });

    renderPagination('rulesPagination', response.total_rows, currentPage, loadRules);
}

// Load attacks
function loadAttacks(page) {
    if (!currentIp) return;

    currentPage = page;
    showLoading();

    $.ajax({
        url: 'modules/addons/antiddos_panel/ajax.php',
        method: 'GET',
        data: {
            action: 'getAttacks',
            ip: currentIp,
            page: page,
            max_view: 10
        },
        success: function(response) {
            hideLoading();
            if (response.error) {
                toastr.error(response.error);
                return;
            }
            renderAttacksTable(response);
        },
        error: function() {
            hideLoading();
            toastr.error('Failed to load attacks');
        }
    });
}

// Render attacks table
function renderAttacksTable(response) {
    const tbody = document.getElementById('attacksTableBody');
    tbody.innerHTML = '';

    if (!response.data || response.data.length === 0) {
        tbody.innerHTML = '<tr><td colspan="7" class="empty-state"><i class="fas fa-shield-alt"></i><p>No attacks recorded</p></td></tr>';
        return;
    }

    response.data.forEach(attack => {
        // Fix flags display - handle both array and object formats
        let flagsArray = [];
        if (Array.isArray(attack.flags)) {
            flagsArray = attack.flags;
        } else if (attack.flags && attack.flags.flags && Array.isArray(attack.flags.flags)) {
            flagsArray = attack.flags.flags;
        }

        // Display max 2 flags + "+X more" with tooltip
        let flagsHtml = '';
        if (flagsArray.length === 0) {
            flagsHtml = '<span style="color: #8b949e;">N/A</span>';
        } else if (flagsArray.length <= 2) {
            flagsHtml = flagsArray.map(flag => `<span class="badge badge-danger" style="margin: 2px;">${flag}</span>`).join(' ');
        } else {
            const visibleFlags = flagsArray.slice(0, 2);
            const remainingCount = flagsArray.length - 2;
            const allFlags = flagsArray.join(', ');
            flagsHtml = visibleFlags.map(flag => `<span class="badge badge-danger" style="margin: 2px;">${flag}</span>`).join(' ');
            flagsHtml += ` <span class="badge badge-warning" style="margin: 2px; cursor: help;" title="${allFlags}">+${remainingCount}</span>`;
        }

        // Format ended_at - show "Incoming" if attack is still ongoing
        const endedAtDisplay = (!attack.ended_at || attack.ended_at === 'null' || attack.ended_at === null)
            ? '<span style="color: #d4a72c;"><i class="fas fa-spinner fa-pulse"></i> Incoming</span>'
            : attack.ended_at;

        // Create main row
        const tr = document.createElement('tr');
        tr.style.cursor = 'pointer';
        tr.dataset.attackId = attack.attack_id;
        tr.innerHTML = `
            <td>${attack.attack_id}</td>
            <td><code>${attack.ip}</code></td>
            <td>${attack.started_at}</td>
            <td>${endedAtDisplay}</td>
            <td><strong style="color: #f85149;">${attack.maximum_peak}</strong></td>
            <td>${flagsHtml}</td>
            <td>
                <button class="btn btn-primary btn-sm" onclick="toggleAttackDetails(${attack.attack_id}); event.stopPropagation();">
                    <i class="fas fa-chevron-down" id="icon-${attack.attack_id}"></i> View
                </button>
            </td>
        `;

        // Add click handler to row
        tr.onclick = function() {
            toggleAttackDetails(attack.attack_id);
        };

        tbody.appendChild(tr);

        // Create details row (hidden by default)
        const detailsTr = document.createElement('tr');
        detailsTr.id = `attack-details-${attack.attack_id}`;
        detailsTr.style.display = 'none';
        detailsTr.innerHTML = `
            <td colspan="7" style="padding: 0;">
                <div id="attack-details-content-${attack.attack_id}" style="background-color: #0d1117; padding: 20px; border-top: 1px solid #30363d;">
                    <div style="text-align: center; color: #8b949e;">
                        <i class="fas fa-spinner fa-spin"></i> Loading details...
                    </div>
                </div>
            </td>
        `;
        tbody.appendChild(detailsTr);
    });

    renderPagination('attacksPagination', response.total_rows, currentPage, loadAttacks);
}

// Toggle attack details expand/collapse
function toggleAttackDetails(attackId) {
    const detailsRow = document.getElementById(`attack-details-${attackId}`);
    const icon = document.getElementById(`icon-${attackId}`);
    const contentDiv = document.getElementById(`attack-details-content-${attackId}`);

    if (detailsRow.style.display === 'none') {
        // Expand - load details if not already loaded
        detailsRow.style.display = 'table-row';
        icon.classList.remove('fa-chevron-down');
        icon.classList.add('fa-chevron-up');

        // Check if already loaded
        if (contentDiv.dataset.loaded !== 'true') {
            loadAttackDetails(attackId);
        }
    } else {
        // Collapse
        detailsRow.style.display = 'none';
        icon.classList.remove('fa-chevron-up');
        icon.classList.add('fa-chevron-down');
    }
}

// Load attack details
function loadAttackDetails(attackId) {
    const contentDiv = document.getElementById(`attack-details-content-${attackId}`);

    $.ajax({
        url: 'modules/addons/antiddos_panel/ajax.php',
        method: 'GET',
        data: {
            action: 'getAttackDetails',
            ip: currentIp,
            attack_id: attackId
        },
        success: function(response) {
            if (response.error) {
                contentDiv.innerHTML = `<div style="text-align: center; color: #f85149; padding: 20px;"><i class="fas fa-exclamation-circle"></i> ${response.error}</div>`;
                return;
            }
            renderAttackDetailsInline(response, contentDiv);
        },
        error: function() {
            contentDiv.innerHTML = '<div style="text-align: center; color: #f85149; padding: 20px;"><i class="fas fa-exclamation-circle"></i> Failed to load attack details</div>';
        }
    });
}

// Render attack details inline
function renderAttackDetailsInline(response, contentDiv) {
    const attack = response.attack_details;
    const ports = response.attack_ports || [];

    // Fix flags display - handle multiple formats
    let flagsArray = [];
    if (Array.isArray(attack.flags)) {
        flagsArray = attack.flags;
    } else if (attack.flags && attack.flags.flags && Array.isArray(attack.flags.flags)) {
        flagsArray = attack.flags.flags;
    } else if (typeof attack.flags === 'string') {
        // Try to parse as JSON string (e.g., "[\"ICMP_FLOOD\",\"SYN_FLOOD\"]")
        try {
            const parsed = JSON.parse(attack.flags);
            if (Array.isArray(parsed)) {
                flagsArray = parsed;
            } else {
                flagsArray = [attack.flags]; // Keep as single string if not array
            }
        } catch (e) {
            flagsArray = [attack.flags]; // Keep as single string if JSON parse fails
        }
    }

    let flagsText = 'N/A';
    if (flagsArray.length > 0) {
        flagsText = flagsArray.map(flag => `<span class="badge badge-danger" style="margin: 2px;">${flag}</span>`).join(' ');
    }

    // Format ended_at for details view
    const endedAtDisplay = (!attack.ended_at || attack.ended_at === 'null' || attack.ended_at === null)
        ? '<span style="color: #d4a72c;"><i class="fas fa-spinner fa-pulse"></i> Incoming</span>'
        : attack.ended_at;

    let html = `
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 20px;">
            <div style="background-color: #161b22; padding: 20px; border-radius: 6px; border: 1px solid #30363d;">
                <h5 style="color: #58a6ff; margin-bottom: 15px; font-size: 14px; text-transform: uppercase;">
                    <i class="fas fa-info-circle"></i> General Information
                </h5>
                <div style="color: #8b949e; font-size: 13px;">
                    <p style="margin: 8px 0;"><strong style="color: #e4e4e4;">Attack ID:</strong> ${attack.attack_id}</p>
                    <p style="margin: 8px 0;"><strong style="color: #e4e4e4;">Target IP:</strong> <code>${attack.ip}</code></p>
                    <p style="margin: 8px 0;"><strong style="color: #e4e4e4;">Started:</strong> ${attack.started_at}</p>
                    <p style="margin: 8px 0;"><strong style="color: #e4e4e4;">Ended:</strong> ${endedAtDisplay}</p>
                </div>
            </div>
            <div style="background-color: #161b22; padding: 20px; border-radius: 6px; border: 1px solid #30363d;">
                <h5 style="color: #f85149; margin-bottom: 15px; font-size: 14px; text-transform: uppercase;">
                    <i class="fas fa-exclamation-triangle"></i> Attack Information
                </h5>
                <div style="color: #8b949e; font-size: 13px;">
                    <p style="margin: 8px 0;"><strong style="color: #e4e4e4;">Maximum Peak:</strong> <strong style="color: #f85149;">${convertToGbps(attack.maximum_peak)}</strong></p>
                    <p style="margin: 8px 0;"><strong style="color: #e4e4e4;">Flags:</strong><br/>${flagsText}</p>
                </div>
            </div>
        </div>
    `;

    if (ports.length > 0) {
        const chartId = `port-chart-${attack.attack_id}`;
        html += `
            <div style="background-color: #161b22; padding: 20px; border-radius: 6px; border: 1px solid #30363d;">
                <h5 style="color: #d4a72c; margin-bottom: 15px; font-size: 14px; text-transform: uppercase;">
                    <i class="fas fa-network-wired"></i> Port Breakdown
                </h5>

                <!-- Chart -->
                <div id="${chartId}" style="margin-bottom: 20px; width: 100%; height: ${Math.max(200, ports.length * 40)}px;"></div>

                <!-- Table -->
                <div class="table-responsive">
                    <table class="table" style="margin: 0;">
                        <thead>
                            <tr>
                                <th>Port</th>
                                <th>Protocol</th>
                                <th>Packets Peak</th>
                            </tr>
                        </thead>
                        <tbody>
        `;
        ports.forEach(port => {
            html += `
                <tr>
                    <td><strong>${port.port}</strong></td>
                    <td><span class="badge badge-info">${port.protocol_name}</span></td>
                    <td>${port.packets_peak.toLocaleString()}</td>
                </tr>
            `;
        });
        html += '</tbody></table></div></div>';
    }

    contentDiv.innerHTML = html;
    contentDiv.dataset.loaded = 'true';

    // Create port breakdown chart if ports exist
    if (ports.length > 0) {
        const chartId = `port-chart-${attack.attack_id}`;
        setTimeout(() => {
            renderPortBreakdownChart(chartId, ports);
        }, 100);
    }
}

// Render port breakdown chart - ECharts version
function renderPortBreakdownChart(chartId, ports) {
    const chartDiv = document.getElementById(chartId);
    if (!chartDiv) return;

    // Sort ports by packets_peak descending
    const sortedPorts = [...ports].sort((a, b) => b.packets_peak - a.packets_peak);

    // Prepare data
    const labels = sortedPorts.map(p => `Port ${p.port} (${p.protocol_name})`);
    const data = sortedPorts.map(p => p.packets_peak);

    // Color by protocol
    const colors = sortedPorts.map(p => {
        if (p.protocol_name === 'TCP') return '#58a6ff';
        if (p.protocol_name === 'UDP') return '#ff8a4c';
        return '#8b949e'; // Other
    });

    // Initialize ECharts
    const myChart = echarts.init(chartDiv);

    const option = {
        backgroundColor: 'transparent',
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            },
            backgroundColor: 'rgba(13, 17, 23, 0.95)',
            borderColor: '#30363d',
            borderWidth: 1,
            textStyle: {
                color: '#e4e4e4'
            },
            formatter: function(params) {
                const value = params[0].value.toLocaleString();
                return params[0].name + '<br/>Packets: ' + value;
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            top: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'value',
            axisLine: {
                lineStyle: {
                    color: '#30363d'
                }
            },
            axisLabel: {
                color: '#8b949e',
                formatter: function(value) {
                    return value.toLocaleString();
                }
            },
            splitLine: {
                lineStyle: {
                    color: '#30363d'
                }
            }
        },
        yAxis: {
            type: 'category',
            data: labels,
            axisLine: {
                lineStyle: {
                    color: '#30363d'
                }
            },
            axisLabel: {
                color: '#8b949e',
                fontSize: 11
            }
        },
        series: [{
            name: 'Packets Peak',
            type: 'bar',
            data: data.map((value, index) => ({
                value: value,
                itemStyle: {
                    color: colors[index]
                }
            })),
            barWidth: '60%',
            label: {
                show: false
            }
        }]
    };

    myChart.setOption(option);

    // Handle window resize
    window.addEventListener('resize', function() {
        myChart.resize();
    });
}


// Handle create rule form submission
document.getElementById('createRuleForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const formData = {
        action: 'createRule',
        ip: currentIp,
        application_id: document.getElementById('ruleApplicationId').value,
        port: document.getElementById('rulePort').value
    };

    if (document.getElementById('customTcpOptions').style.display !== 'none') {
        const maxConn = document.getElementById('ruleMaxConnections').value;
        const maxConnAction = document.getElementById('ruleMaxConnectionsAction').value;
        const maxPacketSize = document.getElementById('ruleMaxPacketSize').value;
        const maxPacketNum = document.getElementById('ruleMaxPacketNum').value;
        const maxBytes = document.getElementById('ruleMaxBytes').value;

        if (maxConn) formData.max_connections = maxConn;
        if (maxConnAction) formData.max_connections_action = maxConnAction;
        if (maxPacketSize) formData.max_packet_size = maxPacketSize;
        if (maxPacketNum) formData.max_packet_num = maxPacketNum;
        if (maxBytes) formData.max_bytes = maxBytes;
    }

    showLoading();

    $.ajax({
        url: 'modules/addons/antiddos_panel/ajax.php',
        method: 'POST',
        data: formData,
        success: function(response) {
            hideLoading();
            if (response.error) {
                toastr.error(response.error);
                return;
            }

            toastr.success('Rule created successfully! Waiting for activation...');

            // Reset form and go back to rules tab
            cancelCreateRule();

            // Load rules and ensure monitoring starts
            $.ajax({
                url: 'modules/addons/antiddos_panel/ajax.php',
                method: 'GET',
                data: {
                    action: 'getRules',
                    ip: currentIp,
                    page: currentPage,
                    max_view: 10,
                    keyword: document.getElementById('rulesSearch').value
                },
                success: function(response) {
                    if (response.error) {
                        toastr.error(response.error);
                        return;
                    }
                    renderRulesTable(response);
                    // Force start monitoring since we just created a rule
                    if (!rulesMonitorInterval) {
                        startRulesMonitoring();
                    }
                }
            });
        },
        error: function() {
            hideLoading();
            toastr.error('Failed to create rule');
        }
    });
});

// Delete rule
function deleteRule(ruleId) {
    if (!confirm('Are you sure you want to delete this rule?')) {
        return;
    }

    showLoading();

    $.ajax({
        url: 'modules/addons/antiddos_panel/ajax.php',
        method: 'POST',
        data: {
            action: 'deleteRule',
            ip: currentIp,
            rule_id: ruleId
        },
        success: function(response) {
            hideLoading();
            if (response.error) {
                toastr.error(response.error);
                return;
            }

            toastr.info('Deleting rule...');

            // Load rules - the auto-monitoring will take care of showing when it's deleted
            loadRules(currentPage);
        },
        error: function() {
            hideLoading();
            toastr.error('Failed to delete rule');
        }
    });
}

// Render pagination
function renderPagination(elementId, totalRows, currentPage, loadFunction) {
    const element = document.getElementById(elementId);
    const itemsPerPage = 10;
    const totalPages = Math.ceil(totalRows / itemsPerPage);

    if (totalPages <= 1) {
        element.innerHTML = '';
        return;
    }

    let html = '<ul class="pagination">';

    // Previous button
    if (currentPage > 1) {
        html += `<li><a href="#" onclick="${loadFunction.name}(${currentPage - 1}); return false;"><i class="fas fa-chevron-left"></i> Previous</a></li>`;
    }

    // Smart pagination logic
    const maxVisiblePages = 7; // Maximum number of page buttons to show
    const sidePages = 2; // Number of pages to show on each side of current page

    if (totalPages <= maxVisiblePages) {
        // Show all pages if total is small
        for (let i = 1; i <= totalPages; i++) {
            if (i === currentPage) {
                html += `<li class="active"><a href="#">${i}</a></li>`;
            } else {
                html += `<li><a href="#" onclick="${loadFunction.name}(${i}); return false;">${i}</a></li>`;
            }
        }
    } else {
        // Always show first page
        if (currentPage === 1) {
            html += `<li class="active"><a href="#">1</a></li>`;
        } else {
            html += `<li><a href="#" onclick="${loadFunction.name}(1); return false;">1</a></li>`;
        }

        // Show ellipsis if needed after first page
        if (currentPage > sidePages + 2) {
            html += `<li class="disabled"><a href="#" onclick="return false;">...</a></li>`;
        }

        // Calculate start and end of middle range
        let start = Math.max(2, currentPage - sidePages);
        let end = Math.min(totalPages - 1, currentPage + sidePages);

        // Adjust range if near the beginning
        if (currentPage <= sidePages + 2) {
            start = 2;
            end = Math.min(maxVisiblePages - 1, totalPages - 1);
        }

        // Adjust range if near the end
        if (currentPage >= totalPages - sidePages - 1) {
            start = Math.max(2, totalPages - maxVisiblePages + 2);
            end = totalPages - 1;
        }

        // Show middle pages
        for (let i = start; i <= end; i++) {
            if (i === currentPage) {
                html += `<li class="active"><a href="#">${i}</a></li>`;
            } else {
                html += `<li><a href="#" onclick="${loadFunction.name}(${i}); return false;">${i}</a></li>`;
            }
        }

        // Show ellipsis if needed before last page
        if (currentPage < totalPages - sidePages - 1) {
            html += `<li class="disabled"><a href="#" onclick="return false;">...</a></li>`;
        }

        // Always show last page
        if (currentPage === totalPages) {
            html += `<li class="active"><a href="#">${totalPages}</a></li>`;
        } else {
            html += `<li><a href="#" onclick="${loadFunction.name}(${totalPages}); return false;">${totalPages}</a></li>`;
        }
    }

    // Next button
    if (currentPage < totalPages) {
        html += `<li><a href="#" onclick="${loadFunction.name}(${currentPage + 1}); return false;">Next <i class="fas fa-chevron-right"></i></a></li>`;
    }

    html += '</ul>';
    element.innerHTML = html;
}
{/literal}
</script>
