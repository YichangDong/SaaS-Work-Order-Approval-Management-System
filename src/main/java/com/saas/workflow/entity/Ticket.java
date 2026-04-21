package com.saas.workflow.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.saas.common.model.BaseEntity;
import java.time.LocalDateTime;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@TableName("ticket")
public class Ticket extends BaseEntity {

    private String ticketNo;
    private String title;
    private String description;
    private String type;
    private String priority;
    private String status;
    private Long submitterId;
    private Long currentApproverId;
    private Long currentHandlerId;
    private LocalDateTime expectedCompleteTime;
    private LocalDateTime approvedAt;
    private LocalDateTime completedAt;
}
