package com.asuka.plugin.job.handler;

import com.asuka.module.system.entity.User;
import com.asuka.module.system.service.UserService;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/5/9
 */
@Component("QuartzTest")
public class SampleBeanParamJob {

    private static final Logger log = LoggerFactory.getLogger(SampleBeanParamJob.class);

    private final UserService userService;

    public SampleBeanParamJob(UserService userService) {
        this.userService = userService;
    }


    public void run(String name) throws JobExecutionException {
        log.info("======== test job ==========");
        log.info("接收到参数 name = {}", name);
        User user = userService.getByUsername("admin");
        log.info("自动注入成功 user.getName = {}", user.getUsername());
    }

}
