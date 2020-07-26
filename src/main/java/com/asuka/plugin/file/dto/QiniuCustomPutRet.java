package com.asuka.plugin.file.dto;

import java.io.Serializable;

/**
 * 七牛自定义上传
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/5/21
 */
public class QiniuCustomPutRet implements Serializable {

    private String key;

    private String hash;

    private Long size;

    private Integer width;

    private Integer height;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }

    public Long getSize() {
        return size;
    }

    public void setSize(Long size) {
        this.size = size;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }
}
