package com.asuka.plugin.job.quartz;

import com.asuka.plugin.job.core.JobConstants;
import org.quartz.Scheduler;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

/**
 * Quartz配置
 * @author wujiawei
 * @see
 * @since 2020/7/27 11:02 下午
 */
@Configuration
@ConditionalOnProperty(value = JobConstants.TYPE, havingValue = JobConstants.QUARTZ, matchIfMissing = true)
public class QuartzConfig {

    @Bean
    public SchedulerFactoryBean schedulerFactoryBean() {
        SchedulerFactoryBean schedulerFactoryBean = new SchedulerFactoryBean();
        schedulerFactoryBean.setOverwriteExistingJobs(true);
        return schedulerFactoryBean;
    }

    @Bean
    public Scheduler scheduler (){
        return schedulerFactoryBean().getScheduler();
    }

}
