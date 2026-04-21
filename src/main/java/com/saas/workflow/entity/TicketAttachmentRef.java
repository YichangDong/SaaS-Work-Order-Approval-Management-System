package com.saas.workflow.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@TableName("ticket_attachment_ref")
public class TicketAttachmentRef {

    @TableId
    private Long id;
    private Long ticketId;
    private String bizType;
    private Long bizId;
    private Long fileId;
    private Long tenantId;
    private Long createdBy;
    private LocalDateTime createdAt;
}
