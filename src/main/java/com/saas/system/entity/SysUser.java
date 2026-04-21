package com.saas.system.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.saas.common.model.BaseEntity;
import java.time.LocalDateTime;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@TableName("sys_user")
public class SysUser extends BaseEntity {

    private Long deptId;
    private String username;
    private String nickname;
    private String passwordHash;
    private String phone;
    private String email;
    private String status;
    private LocalDateTime lastLoginAt;
    private String remark;
}
