package com.asuka.plugin.generator.dto;

import java.io.Serializable;

/**
 * 页面生成配置
 * Created by wangfan on 2020-01-18 0:41
 */
public class TplPage implements Serializable {
    /**
     * 页面生成模板的路径
     */
    private String tpl;
    /**
     * 页面生成后输出的路径
     */
    private String output;
    /**
     * 名称加后缀
     */
    private String nameSuffix;

    public String getTpl() {
        return tpl;
    }

    public void setTpl(String tpl) {
        this.tpl = tpl;
    }

    public String getOutput() {
        return output;
    }

    public void setOutput(String output) {
        this.output = output;
    }

    public String getNameSuffix() {
        return nameSuffix;
    }

    public void setNameSuffix(String nameSuffix) {
        this.nameSuffix = nameSuffix;
    }
}
