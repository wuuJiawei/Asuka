package com.asuka.plugin.generator.dto;

import java.io.Serializable;
import java.util.List;

/**
 * 项目生成配置
 * Created by wangfan on 2020-01-16 00:49
 */
public class GenConfig implements Serializable {
    /**
     * 数据库连接地址
     */
    private String dbUrl;
    /**
     * 数据库连接账号
     */
    private String dbUserName;
    /**
     * 数据库连接密码
     */
    private String dbPassword;
    /**
     * 数据库连接驱动名
     */
    private String dbDriverName;
    /**
     * 项目名称
     */
    private String projectName;
    /**
     * Group Id
     */
    private String groupId;
    /**
     * 包名
     */
    private String packageName;
    /**
     * 项目模板名
     */
    private String tplName;
    /**
     * 作者名称
     */
    private String author;
    /**
     * 是否需要权限注解
     */
    private Boolean needPerm;
    /**
     * 是否需要日志注解
     */
    private Boolean needLog;
    /**
     * 菜单起始id
     */
    private Integer menuStartId;
    /**
     * 模块划分配置
     */
    private List<GenModel> models;

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getDbUrl() {
        return dbUrl;
    }

    public void setDbUrl(String dbUrl) {
        this.dbUrl = dbUrl;
    }

    public String getDbUserName() {
        return dbUserName;
    }

    public void setDbUserName(String dbUserName) {
        this.dbUserName = dbUserName;
    }

    public String getDbPassword() {
        return dbPassword;
    }

    public void setDbPassword(String dbPassword) {
        this.dbPassword = dbPassword;
    }

    public String getDbDriverName() {
        return dbDriverName;
    }

    public void setDbDriverName(String dbDriverName) {
        this.dbDriverName = dbDriverName;
    }

    public String getTplName() {
        return tplName;
    }

    public void setTplName(String tplName) {
        this.tplName = tplName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Boolean getNeedPerm() {
        return needPerm;
    }

    public void setNeedPerm(Boolean needPerm) {
        this.needPerm = needPerm;
    }

    public Boolean getNeedLog() {
        return needLog;
    }

    public void setNeedLog(Boolean needLog) {
        this.needLog = needLog;
    }

    public Integer getMenuStartId() {
        return menuStartId;
    }

    public void setMenuStartId(Integer menuStartId) {
        this.menuStartId = menuStartId;
    }

    public List<GenModel> getModels() {
        return models;
    }

    public void setModels(List<GenModel> models) {
        this.models = models;
    }
}
