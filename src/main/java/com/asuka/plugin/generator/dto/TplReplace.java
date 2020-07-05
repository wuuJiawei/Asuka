package com.asuka.plugin.generator.dto;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

/**
 * 自定义文件修改配置
 * Created by wangfan on 2020-01-24 23:02
 */
public class TplReplace implements Serializable {
    /**
     * 需要替换的文件路径
     */
    private String[] files;
    /**
     * 需要替换的内容
     */
    private List<TplReplaceItem> items;

    public TplReplace() {
    }

    public TplReplace(String[] files, TplReplaceItem... items) {
        this.files = files;
        this.items = Arrays.asList(items);
    }

    public TplReplace(String file, TplReplaceItem... items) {
        this(new String[]{file}, items);
    }

    public String[] getFiles() {
        return files;
    }

    public void setFiles(String[] files) {
        this.files = files;
    }

    public List<TplReplaceItem> getItems() {
        return items;
    }

    public void setItems(List<TplReplaceItem> items) {
        this.items = items;
    }
}
