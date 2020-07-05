package com.asuka.plugin.generator.dto;

import java.io.Serializable;
import java.util.List;

/**
 * 项目生成模块划分配置
 * Created by wangfan on 2020-01-16 00:49
 */
public class GenModel implements Serializable {
    /**
     * 模块名称
     */
    private String modelName;
    /**
     * 模块所有表名
     */
    private List<String> tables;
    /**
     * 需要去掉的表前缀名
     */
    private List<String> prefix;

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    public List<String> getTables() {
        return tables;
    }

    public void setTables(List<String> tables) {
        this.tables = tables;
    }

    public List<String> getPrefix() {
        return prefix;
    }

    public void setPrefix(List<String> prefix) {
        this.prefix = prefix;
    }

    public String[] getTablesArray() {
        return tables.toArray(new String[0]);
    }

    public String[] getPrefixArray() {
        return prefix.toArray(new String[0]);
    }
}
