package com.saas.system.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@TableName("sys_login_log")
public class SysLoginLog {

    @TableId
    private Long id;
    private Long tenantId;
    private Long userId;
    private String username;
    private String loginIp;
    private String loginLocation;
    private String userAgent;
    private String loginStatus;
    private String failReason;
    private LocalDateTime loginAt;
}
