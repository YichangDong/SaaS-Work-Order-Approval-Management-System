package com.saas.system.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.saas.common.model.BaseEntity;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@TableName("sys_dept")
public class SysDept extends BaseEntity {

    private Long parentId;
    private String deptName;
    private String deptCode;
    private String ancestorPath;
    private String leaderName;
    private String phone;
    private Integer sortOrder;
    private String status;
    private String remark;
}
