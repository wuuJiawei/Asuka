package com.asuka.plugin.generator.dto.enums;

/**
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/7/7
 */
public enum TemplateTypeEnum {

    ENTITY,

    DAO,

    SERVICE,

    CONTROLLER,

    HTML,

    DAOMD,

    SQL
    ;

    public static TemplateTypeEnum getValue(String type) {
        for (TemplateTypeEnum typeEnum : TemplateTypeEnum.values()) {
            if (type.trim().toUpperCase().equals(typeEnum.name())) {
                return typeEnum;
            }
        }
        return null;
    }
}
