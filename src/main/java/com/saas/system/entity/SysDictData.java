package com.saas.system.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.saas.common.model.BaseEntity;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@TableName("sys_dict_data")
public class SysDictData extends BaseEntity {

    private String dictType;
    private String label;
    private String value;
    private Integer sortOrder;
    private String status;
    private String cssClass;
    private String tagType;
    private String remark;
}
