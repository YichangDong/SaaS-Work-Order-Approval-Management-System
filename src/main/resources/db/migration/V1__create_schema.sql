CREATE TABLE IF NOT EXISTS sys_tenant (
    id BIGINT NOT NULL COMMENT 'Primary key',
    tenant_name VARCHAR(128) NOT NULL COMMENT 'Tenant name',
    tenant_code VARCHAR(64) NOT NULL COMMENT 'Tenant code',
    contact_name VARCHAR(64) NOT NULL COMMENT 'Contact name',
    contact_phone VARCHAR(32) NOT NULL COMMENT 'Contact phone',
    package_type VARCHAR(32) NOT NULL COMMENT 'Package type',
    expire_time DATETIME(3) NOT NULL COMMENT 'Expire time',
    status VARCHAR(16) NOT NULL COMMENT 'Tenant status',
    remark VARCHAR(255) DEFAULT NULL COMMENT 'Remark',
    created_by BIGINT DEFAULT NULL COMMENT 'Creator id',
    updated_by BIGINT DEFAULT NULL COMMENT 'Updater id',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Created time',
    updated_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'Updated time',
    PRIMARY KEY (id),
    UNIQUE KEY uk_sys_tenant_code (tenant_code),
    KEY idx_sys_tenant_status (status),
    KEY idx_sys_tenant_expire_time (expire_time)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tenant master';

CREATE TABLE IF NOT EXISTS sys_user (
    id BIGINT NOT NULL COMMENT 'Primary key',
    tenant_id BIGINT NOT NULL COMMENT 'Tenant id',
    dept_id BIGINT DEFAULT NULL COMMENT 'Department id',
    username VARCHAR(64) NOT NULL COMMENT 'Username',
    nickname VARCHAR(64) NOT NULL COMMENT 'Nickname',
    password_hash VARCHAR(255) NOT NULL COMMENT 'Password hash',
    phone VARCHAR(32) DEFAULT NULL COMMENT 'Phone number',
    email VARCHAR(128) DEFAULT NULL COMMENT 'Email',
    status VARCHAR(16) NOT NULL COMMENT 'User status',
    last_login_at DATETIME(3) DEFAULT NULL COMMENT 'Last login time',
    remark VARCHAR(255) DEFAULT NULL COMMENT 'Remark',
    created_by BIGINT DEFAULT NULL COMMENT 'Creator id',
    updated_by BIGINT DEFAULT NULL COMMENT 'Updater id',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Created time',
    updated_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'Updated time',
    PRIMARY KEY (id),
    UNIQUE KEY uk_sys_user_tenant_username (tenant_id, username),
    KEY idx_sys_user_tenant_dept (tenant_id, dept_id),
    KEY idx_sys_user_tenant_status (tenant_id, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='User account';

CREATE TABLE IF NOT EXISTS sys_dept (
    id BIGINT NOT NULL COMMENT 'Primary key',
    tenant_id BIGINT NOT NULL COMMENT 'Tenant id',
    parent_id BIGINT NOT NULL DEFAULT 0 COMMENT 'Parent dept id',
    dept_name VARCHAR(128) NOT NULL COMMENT 'Department name',
    dept_code VARCHAR(64) DEFAULT NULL COMMENT 'Department code',
    ancestor_path VARCHAR(255) DEFAULT NULL COMMENT 'Ancestor path',
    leader_name VARCHAR(64) DEFAULT NULL COMMENT 'Leader name',
    phone VARCHAR(32) DEFAULT NULL COMMENT 'Contact phone',
    sort_order INT NOT NULL DEFAULT 0 COMMENT 'Sort order',
    status VARCHAR(16) NOT NULL COMMENT 'Department status',
    remark VARCHAR(255) DEFAULT NULL COMMENT 'Remark',
    created_by BIGINT DEFAULT NULL COMMENT 'Creator id',
    updated_by BIGINT DEFAULT NULL COMMENT 'Updater id',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Created time',
    updated_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'Updated time',
    PRIMARY KEY (id),
    UNIQUE KEY uk_sys_dept_tenant_code (tenant_id, dept_code),
    KEY idx_sys_dept_tenant_parent (tenant_id, parent_id),
    KEY idx_sys_dept_tenant_status (tenant_id, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Department tree';

CREATE TABLE IF NOT EXISTS sys_role (
    id BIGINT NOT NULL COMMENT 'Primary key',
    tenant_id BIGINT NOT NULL COMMENT 'Tenant id',
    role_name VARCHAR(128) NOT NULL COMMENT 'Role name',
    role_code VARCHAR(64) NOT NULL COMMENT 'Role code',
    data_scope VARCHAR(32) NOT NULL DEFAULT 'SELF' COMMENT 'Data scope',
    status VARCHAR(16) NOT NULL COMMENT 'Role status',
    remark VARCHAR(255) DEFAULT NULL COMMENT 'Remark',
    created_by BIGINT DEFAULT NULL COMMENT 'Creator id',
    updated_by BIGINT DEFAULT NULL COMMENT 'Updater id',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Created time',
    updated_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'Updated time',
    PRIMARY KEY (id),
    UNIQUE KEY uk_sys_role_tenant_code (tenant_id, role_code),
    KEY idx_sys_role_tenant_status (tenant_id, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Role definition';

CREATE TABLE IF NOT EXISTS sys_menu (
    id BIGINT NOT NULL COMMENT 'Primary key',
    tenant_id BIGINT NOT NULL DEFAULT 0 COMMENT 'Tenant id, 0 means platform shared',
    parent_id BIGINT NOT NULL DEFAULT 0 COMMENT 'Parent menu id',
    menu_name VARCHAR(128) NOT NULL COMMENT 'Menu name',
    menu_type VARCHAR(16) NOT NULL COMMENT 'DIR MENU BUTTON',
    route_path VARCHAR(255) DEFAULT NULL COMMENT 'Frontend route path',
    component_path VARCHAR(255) DEFAULT NULL COMMENT 'Frontend component path',
    permission_code VARCHAR(128) DEFAULT NULL COMMENT 'Permission code',
    icon VARCHAR(64) DEFAULT NULL COMMENT 'Icon name',
    sort_order INT NOT NULL DEFAULT 0 COMMENT 'Sort order',
    visible TINYINT(1) NOT NULL DEFAULT 1 COMMENT 'Visible flag',
    cacheable TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Cache flag',
    status VARCHAR(16) NOT NULL COMMENT 'Menu status',
    created_by BIGINT DEFAULT NULL COMMENT 'Creator id',
    updated_by BIGINT DEFAULT NULL COMMENT 'Updater id',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Created time',
    updated_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'Updated time',
    PRIMARY KEY (id),
    UNIQUE KEY uk_sys_menu_tenant_permission (tenant_id, permission_code),
    KEY idx_sys_menu_tenant_parent (tenant_id, parent_id),
    KEY idx_sys_menu_tenant_status (tenant_id, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Menu and permission';

CREATE TABLE IF NOT EXISTS sys_user_role (
    id BIGINT NOT NULL COMMENT 'Primary key',
    tenant_id BIGINT NOT NULL COMMENT 'Tenant id',
    user_id BIGINT NOT NULL COMMENT 'User id',
    role_id BIGINT NOT NULL COMMENT 'Role id',
    created_by BIGINT DEFAULT NULL COMMENT 'Creator id',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Created time',
    PRIMARY KEY (id),
    UNIQUE KEY uk_sys_user_role (tenant_id, user_id, role_id),
    KEY idx_sys_user_role_role (tenant_id, role_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='User role relation';

CREATE TABLE IF NOT EXISTS sys_role_menu (
    id BIGINT NOT NULL COMMENT 'Primary key',
    tenant_id BIGINT NOT NULL COMMENT 'Tenant id',
    role_id BIGINT NOT NULL COMMENT 'Role id',
    menu_id BIGINT NOT NULL COMMENT 'Menu id',
    created_by BIGINT DEFAULT NULL COMMENT 'Creator id',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Created time',
    PRIMARY KEY (id),
    UNIQUE KEY uk_sys_role_menu (tenant_id, role_id, menu_id),
    KEY idx_sys_role_menu_menu (menu_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Role menu relation';

CREATE TABLE IF NOT EXISTS sys_dict_type (
    id BIGINT NOT NULL COMMENT 'Primary key',
    tenant_id BIGINT NOT NULL DEFAULT 0 COMMENT 'Tenant id',
    dict_name VARCHAR(128) NOT NULL COMMENT 'Dictionary name',
    dict_type VARCHAR(64) NOT NULL COMMENT 'Dictionary type',
    status VARCHAR(16) NOT NULL COMMENT 'Dictionary status',
    remark VARCHAR(255) DEFAULT NULL COMMENT 'Remark',
    created_by BIGINT DEFAULT NULL COMMENT 'Creator id',
    updated_by BIGINT DEFAULT NULL COMMENT 'Updater id',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Created time',
    updated_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'Updated time',
    PRIMARY KEY (id),
    UNIQUE KEY uk_sys_dict_type_tenant_type (tenant_id, dict_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Dictionary type';

CREATE TABLE IF NOT EXISTS sys_dict_data (
    id BIGINT NOT NULL COMMENT 'Primary key',
    tenant_id BIGINT NOT NULL DEFAULT 0 COMMENT 'Tenant id',
    dict_type VARCHAR(64) NOT NULL COMMENT 'Dictionary type',
    label VARCHAR(128) NOT NULL COMMENT 'Display label',
    value VARCHAR(128) NOT NULL COMMENT 'Dictionary value',
    sort_order INT NOT NULL DEFAULT 0 COMMENT 'Sort order',
    status VARCHAR(16) NOT NULL COMMENT 'Dictionary status',
    css_class VARCHAR(64) DEFAULT NULL COMMENT 'Optional css class',
    tag_type VARCHAR(32) DEFAULT NULL COMMENT 'Optional tag type',
    remark VARCHAR(255) DEFAULT NULL COMMENT 'Remark',
    created_by BIGINT DEFAULT NULL COMMENT 'Creator id',
    updated_by BIGINT DEFAULT NULL COMMENT 'Updater id',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Created time',
    updated_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'Updated time',
    PRIMARY KEY (id),
    UNIQUE KEY uk_sys_dict_data_tenant_type_value (tenant_id, dict_type, value),
    KEY idx_sys_dict_data_tenant_type (tenant_id, dict_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Dictionary data';

CREATE TABLE IF NOT EXISTS sys_config (
    id BIGINT NOT NULL COMMENT 'Primary key',
    tenant_id BIGINT NOT NULL DEFAULT 0 COMMENT 'Tenant id',
    config_key VARCHAR(128) NOT NULL COMMENT 'Config key',
    config_value VARCHAR(1024) NOT NULL COMMENT 'Config value',
    config_name VARCHAR(128) NOT NULL COMMENT 'Config name',
    config_type VARCHAR(16) NOT NULL DEFAULT 'SYSTEM' COMMENT 'SYSTEM or BUSINESS',
    remark VARCHAR(255) DEFAULT NULL COMMENT 'Remark',
    created_by BIGINT DEFAULT NULL COMMENT 'Creator id',
    updated_by BIGINT DEFAULT NULL COMMENT 'Updater id',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Created time',
    updated_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'Updated time',
    PRIMARY KEY (id),
    UNIQUE KEY uk_sys_config_tenant_key (tenant_id, config_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='System config';

CREATE TABLE IF NOT EXISTS ticket (
    id BIGINT NOT NULL COMMENT 'Primary key',
    ticket_no VARCHAR(64) NOT NULL COMMENT 'Ticket number',
    title VARCHAR(255) NOT NULL COMMENT 'Title',
    description TEXT NOT NULL COMMENT 'Description',
    type VARCHAR(64) NOT NULL COMMENT 'Ticket type',
    priority VARCHAR(16) NOT NULL COMMENT 'Priority',
    status VARCHAR(32) NOT NULL COMMENT 'Current status',
    submitter_id BIGINT NOT NULL COMMENT 'Submitter id',
    current_approver_id BIGINT DEFAULT NULL COMMENT 'Current approver id',
    current_handler_id BIGINT DEFAULT NULL COMMENT 'Current handler id',
    expected_complete_time DATETIME(3) DEFAULT NULL COMMENT 'Expected completion time',
    approved_at DATETIME(3) DEFAULT NULL COMMENT 'Approved time',
    completed_at DATETIME(3) DEFAULT NULL COMMENT 'Completed time',
    tenant_id BIGINT NOT NULL COMMENT 'Tenant id',
    created_by BIGINT DEFAULT NULL COMMENT 'Creator id',
    updated_by BIGINT DEFAULT NULL COMMENT 'Updater id',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Created time',
    updated_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'Updated time',
    PRIMARY KEY (id),
    UNIQUE KEY uk_ticket_no (ticket_no),
    KEY idx_ticket_tenant_status (tenant_id, status),
    KEY idx_ticket_tenant_submitter (tenant_id, submitter_id),
    KEY idx_ticket_tenant_approver (tenant_id, current_approver_id),
    KEY idx_ticket_tenant_handler (tenant_id, current_handler_id),
    KEY idx_ticket_tenant_created (tenant_id, created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Ticket current snapshot';

CREATE TABLE IF NOT EXISTS ticket_flow_record (
    id BIGINT NOT NULL COMMENT 'Primary key',
    ticket_id BIGINT NOT NULL COMMENT 'Ticket id',
    operate_type VARCHAR(32) NOT NULL COMMENT 'Operation type',
    before_status VARCHAR(32) DEFAULT NULL COMMENT 'Previous status',
    after_status VARCHAR(32) NOT NULL COMMENT 'New status',
    operator_id BIGINT NOT NULL COMMENT 'Operator id',
    operator_name VARCHAR(64) NOT NULL COMMENT 'Operator name',
    comment VARCHAR(500) DEFAULT NULL COMMENT 'Comment',
    tenant_id BIGINT NOT NULL COMMENT 'Tenant id',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Created time',
    PRIMARY KEY (id),
    KEY idx_ticket_flow_ticket_time (ticket_id, created_at),
    KEY idx_ticket_flow_tenant_operator (tenant_id, operator_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Ticket flow record';

CREATE TABLE IF NOT EXISTS ticket_approval (
    id BIGINT NOT NULL COMMENT 'Primary key',
    ticket_id BIGINT NOT NULL COMMENT 'Ticket id',
    approver_id BIGINT NOT NULL COMMENT 'Approver id',
    action_type VARCHAR(32) NOT NULL COMMENT 'APPROVE REJECT TRANSFER',
    from_approver_id BIGINT DEFAULT NULL COMMENT 'Source approver id',
    target_approver_id BIGINT DEFAULT NULL COMMENT 'Target approver id',
    comment VARCHAR(500) DEFAULT NULL COMMENT 'Approval comment',
    tenant_id BIGINT NOT NULL COMMENT 'Tenant id',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Created time',
    PRIMARY KEY (id),
    KEY idx_ticket_approval_ticket_time (ticket_id, created_at),
    KEY idx_ticket_approval_tenant_approver (tenant_id, approver_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Approval records';

CREATE TABLE IF NOT EXISTS ticket_comment (
    id BIGINT NOT NULL COMMENT 'Primary key',
    ticket_id BIGINT NOT NULL COMMENT 'Ticket id',
    user_id BIGINT NOT NULL COMMENT 'Comment user id',
    content VARCHAR(2000) NOT NULL COMMENT 'Comment content',
    reply_to_comment_id BIGINT DEFAULT NULL COMMENT 'Reply target id',
    tenant_id BIGINT NOT NULL COMMENT 'Tenant id',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Created time',
    updated_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'Updated time',
    PRIMARY KEY (id),
    KEY idx_ticket_comment_ticket_time (ticket_id, created_at),
    KEY idx_ticket_comment_tenant_user (tenant_id, user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Ticket comments';

CREATE TABLE IF NOT EXISTS ticket_attachment_ref (
    id BIGINT NOT NULL COMMENT 'Primary key',
    ticket_id BIGINT NOT NULL COMMENT 'Ticket id',
    biz_type VARCHAR(32) NOT NULL COMMENT 'TICKET COMMENT RESULT',
    biz_id BIGINT DEFAULT NULL COMMENT 'Related business id',
    file_id BIGINT NOT NULL COMMENT 'File id',
    tenant_id BIGINT NOT NULL COMMENT 'Tenant id',
    created_by BIGINT DEFAULT NULL COMMENT 'Creator id',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Created time',
    PRIMARY KEY (id),
    UNIQUE KEY uk_ticket_attachment_ref (ticket_id, biz_type, biz_id, file_id),
    KEY idx_ticket_attachment_file (file_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Ticket attachment relation';

CREATE TABLE IF NOT EXISTS file_info (
    id BIGINT NOT NULL COMMENT 'Primary key',
    tenant_id BIGINT NOT NULL COMMENT 'Tenant id',
    biz_type VARCHAR(32) NOT NULL COMMENT 'Business type',
    file_name VARCHAR(255) NOT NULL COMMENT 'Original file name',
    file_key VARCHAR(255) NOT NULL COMMENT 'Storage key',
    file_url VARCHAR(512) NOT NULL COMMENT 'File url',
    preview_url VARCHAR(512) DEFAULT NULL COMMENT 'Preview url',
    file_size BIGINT NOT NULL COMMENT 'File size',
    content_type VARCHAR(128) NOT NULL COMMENT 'Content type',
    storage_type VARCHAR(32) NOT NULL COMMENT 'Storage type',
    bucket_name VARCHAR(128) DEFAULT NULL COMMENT 'Bucket name',
    created_by BIGINT DEFAULT NULL COMMENT 'Creator id',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Created time',
    PRIMARY KEY (id),
    UNIQUE KEY uk_file_info_key (file_key),
    KEY idx_file_info_tenant_biz (tenant_id, biz_type),
    KEY idx_file_info_tenant_created (tenant_id, created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='File metadata';

CREATE TABLE IF NOT EXISTS notify_message (
    id BIGINT NOT NULL COMMENT 'Primary key',
    tenant_id BIGINT NOT NULL COMMENT 'Tenant id',
    receiver_id BIGINT NOT NULL COMMENT 'Receiver user id',
    title VARCHAR(255) NOT NULL COMMENT 'Message title',
    content VARCHAR(2000) NOT NULL COMMENT 'Message content',
    status VARCHAR(16) NOT NULL COMMENT 'UNREAD READ',
    message_type VARCHAR(32) NOT NULL COMMENT 'TODO RESULT COMMENT SLA',
    biz_type VARCHAR(32) DEFAULT NULL COMMENT 'Business type',
    biz_id BIGINT DEFAULT NULL COMMENT 'Business id',
    read_at DATETIME(3) DEFAULT NULL COMMENT 'Read time',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Created time',
    PRIMARY KEY (id),
    KEY idx_notify_message_receiver (receiver_id, status, created_at),
    KEY idx_notify_message_tenant_type (tenant_id, message_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Inbox messages';

CREATE TABLE IF NOT EXISTS sys_login_log (
    id BIGINT NOT NULL COMMENT 'Primary key',
    tenant_id BIGINT NOT NULL COMMENT 'Tenant id',
    user_id BIGINT DEFAULT NULL COMMENT 'User id',
    username VARCHAR(64) DEFAULT NULL COMMENT 'Username',
    login_ip VARCHAR(64) DEFAULT NULL COMMENT 'Login ip',
    login_location VARCHAR(128) DEFAULT NULL COMMENT 'Login location',
    user_agent VARCHAR(512) DEFAULT NULL COMMENT 'User agent',
    login_status VARCHAR(16) NOT NULL COMMENT 'SUCCESS FAIL',
    fail_reason VARCHAR(255) DEFAULT NULL COMMENT 'Fail reason',
    login_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Login time',
    PRIMARY KEY (id),
    KEY idx_sys_login_log_tenant_user (tenant_id, user_id),
    KEY idx_sys_login_log_time (login_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Login log';

CREATE TABLE IF NOT EXISTS sys_operation_log (
    id BIGINT NOT NULL COMMENT 'Primary key',
    tenant_id BIGINT NOT NULL COMMENT 'Tenant id',
    user_id BIGINT DEFAULT NULL COMMENT 'User id',
    module_name VARCHAR(64) NOT NULL COMMENT 'Module name',
    business_type VARCHAR(64) NOT NULL COMMENT 'Business type',
    request_uri VARCHAR(255) NOT NULL COMMENT 'Request uri',
    http_method VARCHAR(16) NOT NULL COMMENT 'Http method',
    request_body TEXT DEFAULT NULL COMMENT 'Request body',
    operation_status VARCHAR(16) NOT NULL COMMENT 'SUCCESS FAIL',
    error_message VARCHAR(1000) DEFAULT NULL COMMENT 'Error message',
    trace_id VARCHAR(64) DEFAULT NULL COMMENT 'Trace id',
    cost_ms BIGINT DEFAULT NULL COMMENT 'Cost time in milliseconds',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Created time',
    PRIMARY KEY (id),
    KEY idx_sys_operation_log_tenant_user (tenant_id, user_id),
    KEY idx_sys_operation_log_trace (trace_id),
    KEY idx_sys_operation_log_time (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Operation log';

CREATE TABLE IF NOT EXISTS sys_error_log (
    id BIGINT NOT NULL COMMENT 'Primary key',
    tenant_id BIGINT NOT NULL COMMENT 'Tenant id',
    user_id BIGINT DEFAULT NULL COMMENT 'User id',
    request_uri VARCHAR(255) DEFAULT NULL COMMENT 'Request uri',
    http_method VARCHAR(16) DEFAULT NULL COMMENT 'Http method',
    error_type VARCHAR(128) NOT NULL COMMENT 'Error type',
    error_message VARCHAR(1000) NOT NULL COMMENT 'Error message',
    stack_trace TEXT DEFAULT NULL COMMENT 'Stack trace',
    trace_id VARCHAR(64) DEFAULT NULL COMMENT 'Trace id',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Created time',
    PRIMARY KEY (id),
    KEY idx_sys_error_log_trace (trace_id),
    KEY idx_sys_error_log_time (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Error log';
