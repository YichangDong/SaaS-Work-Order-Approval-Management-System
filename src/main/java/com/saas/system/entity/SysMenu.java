package com.saas.system.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.saas.common.model.BaseEntity;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@TableName("sys_menu")
public class SysMenu extends BaseEntity {

    private Long parentId;
    private String menuName;
    private String menuType;
    private String routePath;
    private String componentPath;
    private String permissionCode;
    private String icon;
    private Integer sortOrder;
    private Boolean visible;
    private Boolean cacheable;
    private String status;
}
