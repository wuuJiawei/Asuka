package com.asuka.plugin.job.quartz.web;

import com.asuka.common.annotation.OperLog;
import com.asuka.common.web.BaseQueryController;
import com.asuka.common.web.JsonResult;
import com.asuka.common.web.PageResult;
import com.asuka.plugin.job.core.JobConstants;
import org.beetl.sql.core.engine.PageQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 定时任务
 *
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/5/11
 */
@Controller
@RequestMapping("/sys/QrtzJobs")
public class QuartzJobController extends BaseQueryController<QuartzJob, QuartzJobService> {

    private static final Logger log = LoggerFactory.getLogger(QuartzJobController.class);

    private final QuartzJobService quartzJobService;

    public QuartzJobController(QuartzJobService quartzJobService) {
        this.quartzJobService = quartzJobService;
    }


    @PostConstruct
    public void initJobs() {
        quartzJobService.initProcessingJob();
        log.info("所有任务初始化完成");
    }

    @GetMapping
    public String index() {
        return "system/quartz.html";
    }

    /**
     * 分页列表查询
     *
     * @param request
     * @return
     */
    @OperLog(value = "字典管理", desc = "分页查询")
    @ResponseBody
    @RequestMapping("page")
    public PageResult<QuartzJob> page(HttpServletRequest request) {
        PageQuery<QuartzJob> query = createPageQuery(request);
        return new PageResult<>(query.getList(), query.getTotalRow());
    }

    /**
     * 添加定时任务
     *
     * @param quartzJob
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public JsonResult add(QuartzJob quartzJob) {
        List<QuartzJob> list = quartzJobService.findByJobClassName(quartzJob.getJobClassName());
        if (list != null && list.size() > 0) {
            return JsonResult.error("该定时任务类名已存在");
        }
        if (!StringUtils.hasText(quartzJob.getMethod())) {
            quartzJob.setMethod(JobConstants.DEFAULT_METHOD);
        }
        quartzJob.setCreateTime(new Date());
        quartzJobService.saveAndScheduleJob(quartzJob);
        return JsonResult.ok("创建定时任务成功");
    }

    /**
     * 更新定时任务
     *
     * @param quartzJob
     * @return
     */
    @ResponseBody
    @PostMapping(value = "/edit")
    public JsonResult edit(QuartzJob quartzJob, Byte statusEdit) {
        QuartzJob job;
        if (statusEdit != null && statusEdit == 0) {
            job = service.queryById(quartzJob.getId());
            job.setStatus(quartzJob.getStatus());
        } else {
            job = quartzJob;
        }
        if (!StringUtils.hasText(job.getMethod())) {
            job.setMethod(JobConstants.DEFAULT_METHOD);
        }
        quartzJobService.editAndScheduleJob(job);
        return JsonResult.ok("更新定时任务成功!");
    }

    /**
     * 通过id删除
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/delete")
    public JsonResult delete(@RequestParam(name = "id", required = true) String id) {
        QuartzJob quartzJob = quartzJobService.queryById(id);
        if (quartzJob == null) {
            return JsonResult.error("未找到对应实体");
        }
        quartzJobService.deleteAndStopJob(quartzJob);
        return JsonResult.ok("删除成功!");

    }

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/deleteBatch")
    public JsonResult deleteBatch(@RequestParam(name = "ids", required = true) String ids) {
        if (ids == null || "".equals(ids.trim())) {
            return JsonResult.error("参数不识别！");
        }
        for (String id : ids.split(",")) {
            QuartzJob job = quartzJobService.queryById(id);
            quartzJobService.deleteAndStopJob(job);
        }
        return JsonResult.ok("删除定时任务成功!");
    }

    /**
     * 暂停定时任务
     *
     * @param jobClassName
     * @return
     */
    @ResponseBody
    @GetMapping(value = "/pause")
    public JsonResult pauseJob(@RequestParam(name = "jobClassName", required = true) String jobClassName) {
        QuartzJob job = quartzJobService.lambdaQuery().andEq(QuartzJob::getJobClassName, jobClassName).singleSimple();
        if (job == null) {
            return JsonResult.error("定时任务不存在！");
        }
        quartzJobService.pauseJob(job);
        return JsonResult.ok("暂停定时任务成功");
    }

    /**
     * 启动定时任务
     *
     * @param jobClassName
     * @return
     */
    @ResponseBody
    @GetMapping(value = "/resume")
    public JsonResult resumeJob(@RequestParam(name = "jobClassName", required = true) String jobClassName) {
        QuartzJob job = quartzJobService.lambdaQuery().andEq(QuartzJob::getJobClassName, jobClassName).singleSimple();
        if (job == null) {
            return JsonResult.error("定时任务不存在！");
        }
        quartzJobService.resumeJob(job);
        return JsonResult.ok("恢复定时任务成功");
    }

    /**
     * 通过id查询
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/queryById", method = RequestMethod.GET)
    public JsonResult queryById(@RequestParam(name = "id", required = true) String id) {
        QuartzJob quartzJob = quartzJobService.queryById(id);
        return JsonResult.ok().setData(quartzJob);
    }


}
