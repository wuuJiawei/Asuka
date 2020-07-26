package com.asuka.plugin.generator.dto;

/**
 * 字段
 */
public class Attribute {

    // 类名
    private String className;
    // 首字母大写的类名
    private String firstUpperClassName;
    // 数据库中的名称
    private String sqlName;
    private String javaType;
    private String sqlType;
    // 页面上显示的名称，等同于comment
    private String displayName;
    // 是否主键
    private boolean isId;
    // 是否用于筛选
    private boolean showInQuery =false;
    //数据字典
    private String dictType;
    // 注释
    private String comment;
    // 是否范围
    private boolean isDateRange;
    private boolean isDateTimeRange;

    public String getFirstUpperClassName() {
        return firstUpperClassName;
    }

    public void setFirstUpperClassName(String firstUpperClassName) {
        this.firstUpperClassName = firstUpperClassName;
    }

    public String getSqlType() {
        return sqlType;
    }

    public void setSqlType(String sqlType) {
        this.sqlType = sqlType;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getSqlName() {
        return sqlName;
    }

    public void setSqlName(String sqlName) {
        this.sqlName = sqlName;
    }

    public String getJavaType() {
        return javaType;
    }

    public void setJavaType(String javaType) {
        this.javaType = javaType;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public boolean isId() {
        return isId;
    }

    public void setId(boolean id) {
        isId = id;
    }

    public boolean isShowInQuery() {
        return showInQuery;
    }

    public void setShowInQuery(boolean showInQuery) {
        this.showInQuery = showInQuery;
    }

    public String getDictType() {
        return dictType;
    }

    public void setDictType(String dictType) {
        this.dictType = dictType;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public boolean isDateRange() {
        return isDateRange;
    }

    public void setDateRange(boolean dateRange) {
        isDateRange = dateRange;
    }

    public boolean isDateTimeRange() {
        return isDateTimeRange;
    }

    public void setDateTimeRange(boolean dateTimeRange) {
        isDateTimeRange = dateTimeRange;
    }
}
