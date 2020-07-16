package com.asuka.module.system.controller;

import com.asuka.common.annotation.OperLog;
import com.asuka.common.web.BaseQueryController;
import com.asuka.common.web.JsonResult;
import com.asuka.common.web.PageResult;
import com.asuka.module.system.entity.Option;
import com.asuka.module.system.service.OptionService;
import org.beetl.sql.core.engine.PageQuery;
import org.beetl.sql.core.query.Query;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 系统全局配置 控制器
 * @author wujiawei
 * @see
 * @since 2020/7/16 1:41 下午
 */
@RequestMapping("/sys/option")
@Controller
public class OptionController extends BaseQueryController<Option, OptionService> {

    @PreAuthorize("@$.hp('sys:option:view')")
    @RequestMapping()
    public String view() {
        return "system/option.html";
    }

    /**
     * 分页查询系统配置
     */
    @OperLog(value = "系统配置管理", desc = "分页查询")
    @PreAuthorize("@$.hp('sys:option:view')")
    @ResponseBody
    @RequestMapping("/page")
    public PageResult<Option> page(HttpServletRequest request) {
        PageQuery<Option> query = createPageQuery(request);
        return new PageResult<Option>(query.getList(), query.getTotalRow());
    }

    /**
     * 查询全部系统配置
     */
    @OperLog(value = "系统配置管理", desc = "查询全部")
    @ResponseBody
    @RequestMapping("/list")
    public JsonResult list(HttpServletRequest request) {
        Query<Option> query = createQuery(request);
        List<Option> records = service.queryAll(query);
        return JsonResult.ok().setData(records);
    }

    /**
     * 根据id查询系统配置
     */
    @OperLog(value = "系统配置管理", desc = "根据id查询")
    @ResponseBody
    @RequestMapping("/get")
    public JsonResult get(Integer id) {
        return JsonResult.ok().setData(service.queryById(id));
    }

    /**
     * 添加系统配置
     */
    @OperLog(value = "系统配置管理", desc = "添加", param = false, result = true)
    @ResponseBody
    @RequestMapping("/save")
    public JsonResult save(Option record) {
        long codeCnt = service.lambdaQuery().andEq(Option::getOptionKey, record.getOptionKey()).count();
        if (codeCnt > 0) {
            return JsonResult.error("Key已存在");
        }
        record.setCreateTime(new Date());
        if (service.save(record)) {
            return JsonResult.ok("添加成功");
        }
        return JsonResult.error("添加失败");
    }

    /**
     * 修改系统配置
     */
    @OperLog(value = "系统配置管理", desc = "修改", param = false, result = true)
    @ResponseBody
    @RequestMapping("/update")
    public JsonResult update(Option record) {
        long codeCnt = service.lambdaQuery()
                .andEq(Option::getOptionKey, record.getOptionKey())
                .andNotEq(Option::getId, record.getId())
                .count();
        if (codeCnt > 0) {
            return JsonResult.error("Key已存在");
        }
        if (service.updateTemplate(record)) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 删除系统配置
     */
    @OperLog(value = "系统配置管理", desc = "删除", result = true)
    @ResponseBody
    @RequestMapping("/remove")
    public JsonResult remove(Integer id) {
        if (service.deleteById(id)) {
            return JsonResult.ok("删除成功");
        }
        return JsonResult.error("删除失败");
    }

    /**
     * 批量删除系统配置
     */
    @OperLog(value = "系统配置管理", desc = "批量删除", result = true)
    @ResponseBody
    @RequestMapping("/removeBatch")
    public JsonResult removeBatch(@RequestBody List<Long> ids) {
        if (service.deleteBatchById(ids)) {
            return JsonResult.ok("删除成功");
        }
        return JsonResult.error("删除失败");
    }
    
    
    
    
}
