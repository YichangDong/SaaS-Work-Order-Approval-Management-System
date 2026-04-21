package com.saas.system.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@TableName("sys_error_log")
public class SysErrorLog {

    @TableId
    private Long id;
    private Long tenantId;
    private Long userId;
    private String requestUri;
    private String httpMethod;
    private String errorType;
    private String errorMessage;
    private String stackTrace;
    private String traceId;
    private LocalDateTime createdAt;
}
