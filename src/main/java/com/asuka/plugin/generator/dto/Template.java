package com.asuka.plugin.generator.dto;

import java.util.List;

/**
 * 模版
 */
public class Template {

    private String name;

    private long lineLength;

    private long fileLength;

    private String content;

    private List<String> lineContent;

    public List<String> getLineContent() {
        return lineContent;
    }

    public void setLineContent(List<String> lineContent) {
        this.lineContent = lineContent;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getLineLength() {
        return lineLength;
    }

    public void setLineLength(long lineLength) {
        this.lineLength = lineLength;
    }

    public long getFileLength() {
        return fileLength;
    }

    public void setFileLength(long fileLength) {
        this.fileLength = fileLength;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
