package com.asuka.plugin.file;

import java.io.Serializable;

/**
 * 文件上传结果
 * @author wujiawei
 * @see
 * @since 2020/7/12 7:22 下午
 */
public class FileUploadResult implements Serializable {

    private String fileName;

    private String filePath;

    private String key;

    private String thumbPath;

    private String suffix;

    private Long size;

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getThumbPath() {
        return thumbPath;
    }

    public void setThumbPath(String thumbPath) {
        this.thumbPath = thumbPath;
    }

    public String getSuffix() {
        return suffix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }

    public Long getSize() {
        return size;
    }

    public void setSize(Long size) {
        this.size = size;
    }
}
