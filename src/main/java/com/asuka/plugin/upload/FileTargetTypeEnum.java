package com.asuka.plugin.upload;

/**
 * 文件上传目标类型
 */
public enum FileTargetTypeEnum {
    /** 本地磁盘 */
    LOCAL,

    /** 七牛云oss */
    QINIUOSS,

    /** 阿里云oss */
    ALIOSS,

    /** 腾讯云cos */
    TENCENTCOS,

    ;
}
