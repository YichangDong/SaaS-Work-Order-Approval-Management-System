package com.saas.workflow.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@TableName("ticket_comment")
public class TicketComment {

    @TableId
    private Long id;
    private Long ticketId;
    private Long userId;
    private String content;
    private Long replyToCommentId;
    private Long tenantId;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
