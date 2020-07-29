package com.asuka.plugin.job.handler;

import cn.hutool.core.date.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 示例带参定时任务
 *
 * @Author Scott
 */
public class SampleParamJob {

    private static final Logger log = LoggerFactory.getLogger(SampleParamJob.class);

    public void test(String param) {
        log.info("Asuka 带参数定时任务 SampleParamJob !    时间:{}    参数: {}", DateUtil.now(), param);
    }
}
