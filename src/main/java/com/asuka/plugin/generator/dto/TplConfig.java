package com.asuka.plugin.generator.dto;

import java.io.Serializable;
import java.util.List;

/**
 * 项目生成模板配置
 * Created by wangfan on 2020-01-24 16:14
 */
public class TplConfig implements Serializable {
    /**
     * 模板的包名
     */
    private String packageName;
    /**
     * 页面生成的模板
     */
    private List<TplPage> pages;
    /**
     * 项目模板需要替换的内容
     */
    private List<TplReplace> replaces;

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public List<TplPage> getPages() {
        return pages;
    }

    public void setPages(List<TplPage> pages) {
        this.pages = pages;
    }

    public List<TplReplace> getReplaces() {
        return replaces;
    }

    public void setReplaces(List<TplReplace> replaces) {
        this.replaces = replaces;
    }

}
