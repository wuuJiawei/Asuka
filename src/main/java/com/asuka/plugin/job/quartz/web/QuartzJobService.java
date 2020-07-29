package com.asuka.plugin.job.quartz.web;

import com.asuka.common.Constants;
import com.asuka.common.web.BaseService;
import com.asuka.plugin.job.quartz.JobService;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 定时任务
 *
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/5/11
 */
@Service
public class QuartzJobService extends BaseService<QuartzJob, QuartzJobDao> {

    private JobService jobService;

    @Autowired
    @Lazy
    public void setJobService(JobService jobService) {
        this.jobService = jobService;
    }

    public List<QuartzJob> findByJobClassName(String jobClassName) {
        return lambdaQuery().andEq(QuartzJob::getJobClassName, jobClassName).selectSimple();
    }

    /**
     * 保存&启动定时任务
     */
    @Transactional
    public boolean saveAndScheduleJob(QuartzJob quartzJob) {
        quartzJob.setDelFlag(Constants.NO);
        boolean s = save(quartzJob);

        if (s && Constants.STATUS_NORMAL.equals(quartzJob.getStatus())) {
            try {
                jobService.removeJob(quartzJob);
                jobService.addJob(quartzJob);
                jobService.startJob(quartzJob);
            } catch (SchedulerException e) {
                e.printStackTrace();
                throw new RuntimeException(e);
            }
        }

        return s;
    }

    /**
     * 恢复定时任务
     */
    public boolean resumeJob(QuartzJob quartzJob) {
        try {
            jobService.startJob(quartzJob);
        } catch (SchedulerException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        quartzJob.setStatus(Constants.STATUS_NORMAL);
        return updateTemplate(quartzJob);
    }

    public boolean pauseJob(QuartzJob quartzJob) {
        try {
            jobService.pauseJob(quartzJob);
        } catch (SchedulerException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        quartzJob.setStatus(Constants.STATUS_DISABLE);
        return updateTemplate(quartzJob);
    }

    public void initProcessingJob() {
        List<QuartzJob> jobs = lambdaQuery().andEq(QuartzJob::getStatus, Constants.STATUS_NORMAL).selectSimple();
        if (!jobs.isEmpty()) {
            jobs.forEach(jobService::addJob);
        }
    }

    /**
     * 编辑&启停定时任务
     *
     * @throws SchedulerException
     */
    public boolean editAndScheduleJob(QuartzJob quartzJob) {
        try {
            if (Constants.STATUS_NORMAL.equals(quartzJob.getStatus())) {
                jobService.removeJob(quartzJob);
                jobService.addJob(quartzJob);
                jobService.startJob(quartzJob);
            } else {
                jobService.pauseJob(quartzJob);
            }
        } catch (SchedulerException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

        return updateTemplate(quartzJob);
    }

    /**
     * 删除&停止删除定时任务
     */
    public boolean deleteAndStopJob(QuartzJob job) {
        try {
            jobService.removeJob(job);
        } catch (SchedulerException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return deleteById(job.getId());
    }


}
