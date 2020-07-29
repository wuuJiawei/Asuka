package com.asuka.plugin.job.quartz.web;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.beetl.sql.core.annotatoin.AutoID;
import org.beetl.sql.core.annotatoin.Table;
import org.beetl.sql.core.annotatoin.UpdateTime;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 定时任务实体类
 *
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/5/11
 */
@Table(name = "qrtz_jobs")
public class QuartzJob implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @AutoID
    private java.lang.String id;
    /**
     * 创建人
     */
    private java.lang.String createBy;
    /**
     * 创建时间
     */
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private java.util.Date createTime;
    /**
     * 删除状态
     */
    private java.lang.Integer delFlag;
    /**
     * 修改人
     */
    private java.lang.String updateBy;
    /**
     * 修改时间
     */
    @UpdateTime
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private java.util.Date updateTime;

    /**
     * 任务类名
     * 支持SpringBean名称，反射调用的方法名默认为{@link com.asuka.plugin.job.core.JobConstants.DEFAULT_METHOD}
     */
    private java.lang.String jobClassName;

    /**
     * 方法名，默认为{@link com.asuka.plugin.job.core.JobConstants.DEFAULT_METHOD}
     */
    private String method;

    /**
     * cron表达式
     */
    private java.lang.String cronExpression;
    /**
     * 参数
     */
    private java.lang.String parameter;
    /**
     * 描述
     */
    private java.lang.String description;
    /**
     * 状态 0正常 -1停止
     */
    private java.lang.Integer status;


    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getJobClassName() {
        return jobClassName;
    }

    public void setJobClassName(String jobClassName) {
        this.jobClassName = jobClassName;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getCronExpression() {
        return cronExpression;
    }

    public void setCronExpression(String cronExpression) {
        this.cronExpression = cronExpression;
    }

    public String getParameter() {
        return parameter;
    }

    public void setParameter(String parameter) {
        this.parameter = parameter;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
