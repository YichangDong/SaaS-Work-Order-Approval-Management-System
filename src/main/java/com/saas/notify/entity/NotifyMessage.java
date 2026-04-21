package com.saas.notify.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@TableName("notify_message")
public class NotifyMessage {

    @TableId
    private Long id;
    private Long tenantId;
    private Long receiverId;
    private String title;
    private String content;
    private String status;
    private String messageType;
    private String bizType;
    private Long bizId;
    private LocalDateTime readAt;
    private LocalDateTime createdAt;
}
