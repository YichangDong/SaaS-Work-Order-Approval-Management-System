package com.saas.system.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@TableName("sys_tenant")
public class SysTenant {

    @TableId
    private Long id;
    private String tenantName;
    private String tenantCode;
    private String contactName;
    private String contactPhone;
    private String packageType;
    private LocalDateTime expireTime;
    private String status;
    private String remark;
    private Long createdBy;
    private Long updatedBy;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
