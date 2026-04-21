package com.saas.system.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@TableName("sys_role_menu")
public class SysRoleMenu {

    @TableId
    private Long id;
    private Long tenantId;
    private Long roleId;
    private Long menuId;
    private Long createdBy;
    private LocalDateTime createdAt;
}
