package com.asuka.plugin.job.quartz;

import com.asuka.plugin.job.core.JobConstants;
import com.asuka.plugin.job.quartz.web.QuartzJob;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

/**
 *
 * 定时任务维护管理
 *
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/5/11
 */
@Service
public class JobService {

    private Scheduler scheduler;

    @Autowired
    @Lazy
    public void setScheduler(Scheduler scheduler) {
        this.scheduler = scheduler;
    }

    /**
     * 新增定时任务
     *
     * @param job
     */
    public void addJob(QuartzJob job) {
        try {
            // 创建触发器
            Trigger trigger = TriggerBuilder.newTrigger()
                    .withIdentity(job.getId())
                    .withSchedule(CronScheduleBuilder.cronSchedule(job.getCronExpression()))
                    .startNow()
                    .build();

            // 创建任务
            JobDetail jobDetail = JobBuilder.newJob(QuartzFactory.class)
                    .withIdentity(job.getId())
                    .build();

            // 任务参数
            jobDetail.getJobDataMap().put(JobConstants.SCHEDULER_JOB, job);

            // 创建调度
            scheduler.scheduleJob(jobDetail, trigger);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 启动任务
     *
     * @param job
     */
    public void startJob(QuartzJob job) throws SchedulerException {
        JobKey jobKey = new JobKey(job.getId());

        JobDetail jobDetail = scheduler.getJobDetail(jobKey);
        if (jobDetail == null) {
            addJob(job);
        } else {
            scheduler.resumeJob(jobKey);
        }
    }

    /**
     * 暂停任务
     *
     * @param job
     * @throws SchedulerException
     */
    public void pauseJob(QuartzJob job) throws SchedulerException {
        scheduler.pauseJob(new JobKey(job.getId()));
    }

    /**
     * 删除任务
     *
     * @param job
     * @throws SchedulerException
     */
    public void removeJob(QuartzJob job) throws SchedulerException {
        scheduler.deleteJob(new JobKey(job.getId()));
    }

    /**
     * 启动所有任务
     */
    public void startAllJob() throws SchedulerException {
        scheduler.start();
    }

    /**
     * 暂停所有任务
     */
    public void pauseAllJob() throws SchedulerException {
        scheduler.standby();
    }
}
