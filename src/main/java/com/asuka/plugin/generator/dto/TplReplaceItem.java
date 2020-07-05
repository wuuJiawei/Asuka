package com.asuka.plugin.generator.dto;

import java.io.Serializable;

/**
 * 自定义文件修改内容
 * Created by wangfan on 2020-01-17 15:22
 */
public class TplReplaceItem implements Serializable {
    /**
     * 原始内容
     */
    private String orgStr;
    /**
     * 替换后的内容
     */
    private String newStr;

    public TplReplaceItem() {
    }

    public TplReplaceItem(String orgStr, String newStr) {
        this.orgStr = orgStr;
        this.newStr = newStr;
    }

    public String getOrgStr() {
        return orgStr;
    }

    public void setOrgStr(String orgStr) {
        this.orgStr = orgStr;
    }

    public String getNewStr() {
        return newStr;
    }

    public void setNewStr(String newStr) {
        this.newStr = newStr;
    }
}
