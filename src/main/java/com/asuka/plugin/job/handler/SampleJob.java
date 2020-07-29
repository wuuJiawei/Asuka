package com.asuka.plugin.job.handler;

import cn.hutool.core.date.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 示例不带参定时任务
 *
 * @Author Scott
 */
public class SampleJob {

    private static final Logger log = LoggerFactory.getLogger(SampleJob.class);

    public void execute() {

        log.info(" Asuka 普通定时任务 SampleJob !  时间: {}", DateUtil.now());
    }
}
