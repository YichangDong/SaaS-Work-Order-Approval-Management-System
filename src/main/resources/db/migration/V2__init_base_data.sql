INSERT INTO sys_role (
    id, tenant_id, role_name, role_code, data_scope, status, remark, created_by, updated_by, created_at, updated_at
) VALUES
    (10001, 0, 'Platform Administrator', 'PLATFORM_ADMIN', 'ALL', 'ENABLED', 'Platform super admin role', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000');

INSERT INTO sys_user (
    id, tenant_id, dept_id, username, nickname, password_hash, phone, email, status, last_login_at, remark, created_by, updated_by, created_at, updated_at
) VALUES
    (10001, 0, NULL, 'platform_admin', 'Platform Admin', '$2a$10$hE1kexie9DXBhoJvIbVFteTCyBbxg9k6DPHgBd694ZOO5TAa7YooC', '13800000000', 'platform_admin@saas.local', 'ENABLED', NULL, 'Seed platform administrator', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000');

INSERT INTO sys_user_role (
    id, tenant_id, user_id, role_id, created_by, created_at
) VALUES
    (11001, 0, 10001, 10001, 10001, '2026-04-20 10:00:00.000');

INSERT INTO sys_menu (
    id, tenant_id, parent_id, menu_name, menu_type, route_path, component_path, permission_code, icon, sort_order, visible, cacheable, status, created_by, updated_by, created_at, updated_at
) VALUES
    (20000, 0, 0, 'System Management', 'DIR', '/system', NULL, NULL, 'setting', 10, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (20100, 0, 20000, 'Tenant Management', 'MENU', '/system/tenants', 'system/tenants/index', NULL, 'office-building', 10, 1, 1, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (20101, 0, 20100, 'Tenant List', 'BUTTON', NULL, NULL, 'tenant:list', NULL, 1, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (20102, 0, 20100, 'Tenant Create', 'BUTTON', NULL, NULL, 'tenant:create', NULL, 2, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (20103, 0, 20100, 'Tenant Update', 'BUTTON', NULL, NULL, 'tenant:update', NULL, 3, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (20104, 0, 20100, 'Tenant Status', 'BUTTON', NULL, NULL, 'tenant:status', NULL, 4, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (20200, 0, 20000, 'User Management', 'MENU', '/system/users', 'system/users/index', NULL, 'user', 20, 1, 1, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (20201, 0, 20200, 'User List', 'BUTTON', NULL, NULL, 'user:list', NULL, 1, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (20202, 0, 20200, 'User Create', 'BUTTON', NULL, NULL, 'user:create', NULL, 2, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (20203, 0, 20200, 'User Update', 'BUTTON', NULL, NULL, 'user:update', NULL, 3, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (20204, 0, 20200, 'User Reset Password', 'BUTTON', NULL, NULL, 'user:reset-password', NULL, 4, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (20300, 0, 20000, 'Role Management', 'MENU', '/system/roles', 'system/roles/index', NULL, 'avatar', 30, 1, 1, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (20301, 0, 20300, 'Role List', 'BUTTON', NULL, NULL, 'role:list', NULL, 1, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (20302, 0, 20300, 'Role Create', 'BUTTON', NULL, NULL, 'role:create', NULL, 2, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (20303, 0, 20300, 'Role Update', 'BUTTON', NULL, NULL, 'role:update', NULL, 3, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (20304, 0, 20300, 'Grant Menu', 'BUTTON', NULL, NULL, 'role:grant-menu', NULL, 4, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (30000, 0, 0, 'Workflow Management', 'DIR', '/workflow', NULL, NULL, 'tickets', 20, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (30100, 0, 30000, 'Ticket Center', 'MENU', '/workflow/tickets', 'workflow/tickets/index', NULL, 'document', 10, 1, 1, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (30101, 0, 30100, 'Ticket List', 'BUTTON', NULL, NULL, 'ticket:list', NULL, 1, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (30102, 0, 30100, 'Ticket Create', 'BUTTON', NULL, NULL, 'ticket:create', NULL, 2, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (30103, 0, 30100, 'Ticket Update', 'BUTTON', NULL, NULL, 'ticket:update', NULL, 3, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (30104, 0, 30100, 'Ticket Delete', 'BUTTON', NULL, NULL, 'ticket:delete', NULL, 4, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (30105, 0, 30100, 'Ticket Submit', 'BUTTON', NULL, NULL, 'ticket:submit', NULL, 5, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (30200, 0, 30000, 'Approval Center', 'MENU', '/workflow/approval', 'workflow/approval/index', NULL, 'checked', 20, 1, 1, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (30201, 0, 30200, 'Ticket Approve', 'BUTTON', NULL, NULL, 'ticket:approve', NULL, 1, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (30202, 0, 30200, 'Ticket Reject', 'BUTTON', NULL, NULL, 'ticket:reject', NULL, 2, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (30203, 0, 30200, 'Ticket Transfer', 'BUTTON', NULL, NULL, 'ticket:transfer', NULL, 3, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (30204, 0, 30200, 'Ticket Assign', 'BUTTON', NULL, NULL, 'ticket:assign', NULL, 4, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (30205, 0, 30200, 'Ticket Start Process', 'BUTTON', NULL, NULL, 'ticket:start-process', NULL, 5, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (30206, 0, 30200, 'Ticket Complete', 'BUTTON', NULL, NULL, 'ticket:complete', NULL, 6, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (30300, 0, 30000, 'Collaboration', 'MENU', '/workflow/collaboration', 'workflow/collaboration/index', NULL, 'chat-line-round', 30, 1, 1, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (30301, 0, 30300, 'Ticket Comment', 'BUTTON', NULL, NULL, 'ticket:comment', NULL, 1, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (30400, 0, 30000, 'Statistics', 'MENU', '/workflow/statistics', 'workflow/statistics/index', NULL, 'histogram', 40, 1, 1, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (30401, 0, 30400, 'Statistics View', 'BUTTON', NULL, NULL, 'statistics:view', NULL, 1, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (40000, 0, 0, 'File Management', 'DIR', '/files', NULL, NULL, 'folder', 30, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (40100, 0, 40000, 'File Center', 'MENU', '/files/index', 'file/index', NULL, 'folder-opened', 10, 1, 1, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (40101, 0, 40100, 'File Upload', 'BUTTON', NULL, NULL, 'file:upload', NULL, 1, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (40102, 0, 40100, 'File Download', 'BUTTON', NULL, NULL, 'file:download', NULL, 2, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (50000, 0, 0, 'Notification Center', 'DIR', '/notify', NULL, NULL, 'bell', 40, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (50100, 0, 50000, 'Inbox', 'MENU', '/notify/messages', 'notify/messages/index', NULL, 'message', 10, 1, 1, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (50101, 0, 50100, 'Notify List', 'BUTTON', NULL, NULL, 'notify:list', NULL, 1, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (50102, 0, 50100, 'Notify Read', 'BUTTON', NULL, NULL, 'notify:read', NULL, 2, 1, 0, 'ENABLED', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000');

INSERT INTO sys_role_menu (
    id, tenant_id, role_id, menu_id, created_by, created_at
)
SELECT
    30000 + ROW_NUMBER() OVER (ORDER BY id) AS id,
    0 AS tenant_id,
    10001 AS role_id,
    id AS menu_id,
    10001 AS created_by,
    '2026-04-20 10:00:00.000' AS created_at
FROM sys_menu
WHERE tenant_id = 0;

INSERT INTO sys_dict_type (
    id, tenant_id, dict_name, dict_type, status, remark, created_by, updated_by, created_at, updated_at
) VALUES
    (60001, 0, 'Ticket Status', 'ticket_status', 'ENABLED', 'Ticket status dictionary', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (60002, 0, 'Ticket Priority', 'ticket_priority', 'ENABLED', 'Ticket priority dictionary', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (60003, 0, 'Ticket Type', 'ticket_type', 'ENABLED', 'Ticket type dictionary', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (60004, 0, 'Message Status', 'message_status', 'ENABLED', 'Message status dictionary', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000');

INSERT INTO sys_dict_data (
    id, tenant_id, dict_type, label, value, sort_order, status, css_class, tag_type, remark, created_by, updated_by, created_at, updated_at
) VALUES
    (61001, 0, 'ticket_status', 'Draft', 'DRAFT', 1, 'ENABLED', NULL, 'info', NULL, 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (61002, 0, 'ticket_status', 'Pending Approval', 'PENDING_APPROVAL', 2, 'ENABLED', NULL, 'warning', NULL, 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (61003, 0, 'ticket_status', 'Approved', 'APPROVED', 3, 'ENABLED', NULL, 'success', NULL, 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (61004, 0, 'ticket_status', 'Wait Process', 'WAIT_PROCESS', 4, 'ENABLED', NULL, 'warning', NULL, 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (61005, 0, 'ticket_status', 'Processing', 'PROCESSING', 5, 'ENABLED', NULL, 'primary', NULL, 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (61006, 0, 'ticket_status', 'Completed', 'COMPLETED', 6, 'ENABLED', NULL, 'success', NULL, 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (61007, 0, 'ticket_status', 'Rejected', 'REJECTED', 7, 'ENABLED', NULL, 'danger', NULL, 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (61008, 0, 'ticket_status', 'Closed', 'CLOSED', 8, 'ENABLED', NULL, 'info', NULL, 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (62001, 0, 'ticket_priority', 'Low', 'LOW', 1, 'ENABLED', NULL, 'info', NULL, 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (62002, 0, 'ticket_priority', 'Medium', 'MEDIUM', 2, 'ENABLED', NULL, 'primary', NULL, 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (62003, 0, 'ticket_priority', 'High', 'HIGH', 3, 'ENABLED', NULL, 'warning', NULL, 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (62004, 0, 'ticket_priority', 'Urgent', 'URGENT', 4, 'ENABLED', NULL, 'danger', NULL, 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (63001, 0, 'ticket_type', 'Access Apply', 'ACCESS_APPLY', 1, 'ENABLED', NULL, 'primary', NULL, 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (63002, 0, 'ticket_type', 'Account Open', 'ACCOUNT_OPEN', 2, 'ENABLED', NULL, 'success', NULL, 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (63003, 0, 'ticket_type', 'Equipment Repair', 'EQUIPMENT_REPAIR', 3, 'ENABLED', NULL, 'warning', NULL, 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (64001, 0, 'message_status', 'Unread', 'UNREAD', 1, 'ENABLED', NULL, 'warning', NULL, 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (64002, 0, 'message_status', 'Read', 'READ', 2, 'ENABLED', NULL, 'success', NULL, 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000');

INSERT INTO sys_config (
    id, tenant_id, config_key, config_value, config_name, config_type, remark, created_by, updated_by, created_at, updated_at
) VALUES
    (70001, 0, 'system.default-password-policy', 'minLength=8;requireUpper=true;requireLower=true;requireNumber=true', 'Default Password Policy', 'SYSTEM', 'Used by user bootstrap and reset password', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (70002, 0, 'file.max-size-mb', '20', 'Attachment Max Size MB', 'BUSINESS', 'Maximum upload size for a single attachment', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (70003, 0, 'file.allowed-types', 'pdf,doc,docx,xls,xlsx,png,jpg,jpeg,txt,zip', 'Allowed Attachment Types', 'BUSINESS', 'Allowed upload suffix list', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000'),
    (70004, 0, 'workflow.default-sla-hours', '24', 'Default Ticket SLA Hours', 'BUSINESS', 'Fallback SLA threshold for reminder jobs', 10001, 10001, '2026-04-20 10:00:00.000', '2026-04-20 10:00:00.000');
