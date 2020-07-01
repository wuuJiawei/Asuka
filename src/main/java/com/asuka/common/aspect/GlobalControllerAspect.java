package com.asuka.common.aspect;

import com.asuka.common.web.JsonResult;
import com.asuka.common.web.PageResult;
import com.asuka.module.system.service.DictionaryDataService;
import com.asuka.module.system.service.DictionaryService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * 全局通用的Aspect
 *
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/7/1
 */
@Component
@Aspect
public class GlobalControllerAspect {

    private static Logger log = LoggerFactory.getLogger(GlobalControllerAspect.class);

    private final DictionaryDataService dictionaryDataService;

    public GlobalControllerAspect(DictionaryDataService dictionaryDataService) {
        this.dictionaryDataService = dictionaryDataService;
    }

    /**
     * 定义切点：所有以Controller为末尾的所有方法
     */
    @Pointcut("execution(public * com.asuka..*.*Controller.*(..))")
    public void aroundPointCut() {
    }

    @Around("aroundPointCut()")
    public Object around(ProceedingJoinPoint pjp) throws Throwable {
        long time1 = System.currentTimeMillis();

        Object result = pjp.proceed();

        long time2 = System.currentTimeMillis();
        log.debug("获取JSON数据 耗时：" + (time2 - time1) + "ms");

        long start = System.currentTimeMillis();

        this.parseResult(result);

        long end = System.currentTimeMillis();
        log.debug("解析注入JSON数据  耗时" + (end - start) + "ms");

        return result;
    }

    /**
     * 解析返回结果
     * @param result
     */
    private void parseResult(Object result) {
        if (result instanceof JsonResult) {

        } else if (result instanceof PageResult) {

        }
    }
}
