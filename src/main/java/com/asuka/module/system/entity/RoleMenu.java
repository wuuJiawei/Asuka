package com.asuka.module.system.entity;

import org.beetl.sql.core.TailBean;
import org.beetl.sql.core.annotatoin.AutoID;
import org.beetl.sql.core.annotatoin.Table;
import org.beetl.sql.core.annotatoin.UpdateTime;

import java.io.Serializable;
import java.util.Date;

/**
 * 角色权限
 * Created by AutoGenerator on 2018-12-24 16:10
 */
@Table(name = "sys_role_menu")
public class RoleMenu extends TailBean implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 主键id
     */
    @AutoID
    private Integer id;
    /**
     * 角色id
     */
    private Integer roleId;
    /**
     * 菜单id
     */
    private Integer menuId;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 修改时间
     */
    @UpdateTime
    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "RoleAuthorities{" +
                ", id=" + id +
                ", roleId=" + roleId +
                ", menuId=" + menuId +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                "}";
    }

}
