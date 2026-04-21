package com.saas.workflow.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@TableName("ticket_approval")
public class TicketApproval {

    @TableId
    private Long id;
    private Long ticketId;
    private Long approverId;
    private String actionType;
    private Long fromApproverId;
    private Long targetApproverId;
    private String comment;
    private Long tenantId;
    private LocalDateTime createdAt;
}
