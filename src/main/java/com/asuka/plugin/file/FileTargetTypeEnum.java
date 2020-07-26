package com.asuka.plugin.file;

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

    public static FileTargetTypeEnum get(String targetType) {
        for (FileTargetTypeEnum targetTypeEnum : FileTargetTypeEnum.values()) {
            if (targetType.equalsIgnoreCase(targetTypeEnum.toString())) {
                return targetTypeEnum;
            }
        }
        return null;
    }

}
