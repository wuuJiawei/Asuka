package com.asuka.common.system.controller;

import com.asuka.common.core.annotation.OperLog;
import com.asuka.common.core.web.*;
import com.asuka.common.system.entity.LoginRecord;
import com.asuka.common.system.service.LoginRecordService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.beetl.sql.core.engine.PageQuery;
import org.beetl.sql.core.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 登录日志
 * Created by wangfan on 2018-12-24 16:10
 */
@Controller
@RequestMapping("/sys/loginRecord")
public class LoginRecordController extends BaseQueryController<LoginRecord, LoginRecordService> {
    @Autowired
    private LoginRecordService loginRecordService;

    @RequiresPermissions("sys:login_record:view")
    @RequestMapping()
    public String view() {
        return "system/login-record.html";
    }

    /**
     * 分页查询登录日志
     */
    @OperLog(value = "登录日志", desc = "分页查询")
    @RequiresPermissions("sys:login_record:view")
    @ResponseBody
    @RequestMapping("/page")
    public PageResult<LoginRecord> page(HttpServletRequest request) {
        PageQuery<LoginRecord> pageQuery = createPageQuery(request);
        return new PageResult<LoginRecord>(pageQuery.getList(), pageQuery.getTotalRow());
    }

    /**
     * 查询全部登录日志
     */
    @OperLog(value = "登录日志", desc = "查询全部")
    @RequiresPermissions("sys:login_record:view")
    @ResponseBody
    @RequestMapping("/list")
    public JsonResult list(HttpServletRequest request) {
        Query<LoginRecord> query = createQuery(request);
        List<LoginRecord> records = service.queryAll(query);
        return JsonResult.ok().setData(records);
    }

    /**
     * 根据id查询登录日志
     */
    @OperLog(value = "登录日志", desc = "根据id查询")
    @RequiresPermissions("sys:login_record:view")
    @ResponseBody
    @RequestMapping("/get")
    public JsonResult get(Integer id, HttpServletRequest request) {
        LoginRecord loginRecord = service.queryById(id);
        return JsonResult.ok().setData(loginRecord);
    }

}
