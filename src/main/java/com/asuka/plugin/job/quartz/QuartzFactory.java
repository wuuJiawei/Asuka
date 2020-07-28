package com.asuka.plugin.job.quartz;

import com.asuka.common.utils.SpringContextUtils;
import com.asuka.plugin.job.core.JobConstants;
import com.asuka.plugin.job.quartz.web.QuartzJob;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * 定时任务调度工厂
 * <p>
 * 负责运行定时任务
 *
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/5/11
 */
public class QuartzFactory implements Job {

    private static final Logger log = LoggerFactory.getLogger(QuartzFactory.class);

    /**
     * <p>
     * Called by the <code>{@link Scheduler}</code> when a <code>{@link Trigger}</code>
     * fires that is associated with the <code>Job</code>.
     * </p>
     *
     * <p>
     * The implementation may wish to set a
     * {@link JobExecutionContext#setResult(Object) result} object on the
     * {@link JobExecutionContext} before this method exits.  The result itself
     * is meaningless to Quartz, but may be informative to
     * <code>{@link JobListener}s</code> or
     * <code>{@link TriggerListener}s</code> that are watching the job's
     * execution.
     * </p>
     *
     * @param context
     * @throws JobExecutionException if there is an exception while executing the job.
     */
    @Override
    public void execute(JobExecutionContext context) {
        // 要执行的任务
        QuartzJob job = (QuartzJob) context.getMergedJobDataMap().get(JobConstants.SCHEDULER_JOB);

        String className = job.getJobClassName();
        String methodName = StringUtils.hasText(job.getMethod()) ? job.getMethod() : JobConstants.DEFAULT_METHOD;
        String parameter = job.getParameter();
        Object object = null;

        // 通过缓存池优化反射性能
        boolean invokeFlag = false;
        try {
            invokeFlag = QuartzMethodPool.invoke(className);
        } catch (InvocationTargetException | IllegalAccessException e) {
            log.error(e.getMessage(), e);
        }

        if (invokeFlag) {
            return;
        }

        // 支持加载类或Bean
        if (className != null && className.contains(".")) {
            Class<?> aClass = null;
            try {
                aClass = Class.forName(className);
                object = aClass.newInstance();
            } catch (InstantiationException e2) {
                object = SpringContextUtils.getBean(aClass);
            } catch (ClassNotFoundException | IllegalAccessException e) {
                e.printStackTrace();
            }
        } else {
            object = SpringContextUtils.getBean(job.getJobClassName());
        }

        if (object != null) {
            // 反射调用方法
            try {
                Method[] methods = object.getClass().getMethods();
                for (Method method : methods) {
                    log.info(method.getName());
                    if (methodName.equals(method.getName())) {
                        QuartzMethodPool.invoke(object, method, parameter);
                        QuartzMethodPool.put(className, parameter, method, object);
                        break;
                    }
                }
            } catch (IllegalAccessException | InvocationTargetException e) {
                e.printStackTrace();
                log.error(e.getMessage());
            }
        }


    }


}
