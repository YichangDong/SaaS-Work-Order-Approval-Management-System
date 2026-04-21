package com.saas.system.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@TableName("sys_user_role")
public class SysUserRole {

    @TableId
    private Long id;
    private Long tenantId;
    private Long userId;
    private Long roleId;
    private Long createdBy;
    private LocalDateTime createdAt;
}
