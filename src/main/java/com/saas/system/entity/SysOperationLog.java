package com.saas.system.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@TableName("sys_operation_log")
public class SysOperationLog {

    @TableId
    private Long id;
    private Long tenantId;
    private Long userId;
    private String moduleName;
    private String businessType;
    private String requestUri;
    private String httpMethod;
    private String requestBody;
    private String operationStatus;
    private String errorMessage;
    private String traceId;
    private Long costMs;
    private LocalDateTime createdAt;
}
