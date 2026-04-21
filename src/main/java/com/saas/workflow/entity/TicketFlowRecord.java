package com.saas.workflow.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@TableName("ticket_flow_record")
public class TicketFlowRecord {

    @TableId
    private Long id;
    private Long ticketId;
    private String operateType;
    private String beforeStatus;
    private String afterStatus;
    private Long operatorId;
    private String operatorName;
    private String comment;
    private Long tenantId;
    private LocalDateTime createdAt;
}
