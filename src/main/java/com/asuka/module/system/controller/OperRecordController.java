package com.asuka.module.system.controller;

import com.asuka.common.annotation.OperLog;
import com.asuka.common.web.*;
import com.asuka.module.system.entity.OperRecord;
import com.asuka.module.system.entity.User;
import com.asuka.module.system.service.OperRecordService;
import org.beetl.sql.core.engine.PageQuery;
import org.beetl.sql.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 操作日志
 * Created by wangfan on 2018-12-24 16:10
 */
@Controller
@RequestMapping("/sys/operRecord")
public class OperRecordController extends BaseQueryController<OperRecord, OperRecordService> {

    @RequestMapping()
    public String view() {
        return "system/oper-record.html";
    }

    /**
     * 分页查询操作日志
     */
    @OperLog(value = "操作日志", desc = "分页查询")
    @ResponseBody
    @RequestMapping("/page")
    public PageResult<OperRecord> page(HttpServletRequest request) {
        PageQuery<OperRecord> query = createPageQuery(request);
        query.getList().forEach(x->{
            User user = getSysUserById(x.getUserId());
            x.setUsername(user.getUsername());
            x.setNickName(user.getNickName());
        });
        return new PageResult<>(query.getList(), query.getTotalRow());
    }

    /**
     * 查询全部操作日志
     */
    @OperLog(value = "操作日志", desc = "查询全部")
    @ResponseBody
    @RequestMapping("/list")
    public JsonResult list(HttpServletRequest request) {
        Query<OperRecord> query = createQuery(request);
        List<OperRecord> records = service.queryAll(query);
        return JsonResult.ok().setData(records);
    }

    /**
     * 根据id查询操作日志
     */
    @OperLog(value = "操作日志", desc = "根据id查询")
    @ResponseBody
    @RequestMapping("/get")
    public JsonResult get(Integer id) {
        return JsonResult.ok().setData(service.queryById(id));
    }

}
