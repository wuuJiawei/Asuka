package com.asuka.common.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 标识字段为字典值
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/7/1
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Dict {

    /**
     * 字典标识，值来源于{@link com.asuka.module.system.entity.Dictionary#dictCode}
     * @return
     */
    String value();

}
