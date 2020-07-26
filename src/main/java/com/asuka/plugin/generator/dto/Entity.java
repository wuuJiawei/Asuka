package com.asuka.plugin.generator.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 表
 */
public class Entity implements Serializable {

    /**
     * 生成的类名
     */
    private String className;

    /**
     * 首字母大写的类名
     */
    private String firstUpperClassName;

    /**
     * 表名
     */
    private String tableName;
    private String code;
    private String displayName;

    /**
     * 字段列表
     */
    private List<Attribute> colList = new ArrayList<Attribute>();

    /**
     * 主键字段
     */
    private Attribute idAttribute;
    private Attribute nameAttribute;

    /**
     * 注释
     */
    private String comment;

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public List<Attribute> getColList() {
        return colList;
    }

    public void setColList(List<Attribute> colList) {
        this.colList = colList;
    }

    public Attribute getIdAttribute() {
        return idAttribute;
    }

    public void setIdAttribute(Attribute idAttribute) {
        this.idAttribute = idAttribute;
    }

    public Attribute getNameAttribute() {
        return nameAttribute;
    }

    public void setNameAttribute(Attribute nameAttribute) {
        this.nameAttribute = nameAttribute;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getFirstUpperClassName() {
        return firstUpperClassName;
    }

    public void setFirstUpperClassName(String firstUpperClassName) {
        this.firstUpperClassName = firstUpperClassName;
    }
}
