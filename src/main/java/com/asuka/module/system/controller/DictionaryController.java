package com.asuka.module.system.controller;

import com.asuka.common.Constants;
import com.asuka.module.system.service.DictionaryService;
import com.asuka.common.annotation.OperLog;
import com.asuka.common.web.*;
import com.asuka.common.utils.CoreUtil;
import com.asuka.module.system.entity.Dictionary;
import org.beetl.sql.core.engine.PageQuery;
import org.beetl.sql.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 字典管理
 * Created by wangfan on 2020-03-14 11:29:03
 */
@Controller
@RequestMapping("/sys/dict")
public class DictionaryController extends BaseQueryController<Dictionary, DictionaryService> {

    @RequestMapping()
    public String view() {
        return "system/dictionary.html";
    }

    /**
     * 分页查询字典
     */
    @OperLog(value = "字典管理", desc = "分页查询")
    @ResponseBody
    @RequestMapping("/page")
    public PageResult<Dictionary> page(HttpServletRequest request) {
        PageQuery<Dictionary> query = createPageQuery(request);
        return new PageResult<Dictionary>(query.getList(), query.getTotalRow());
    }

    /**
     * 查询全部字典
     */
    @OperLog(value = "字典管理", desc = "查询全部")
    @ResponseBody
    @RequestMapping("/list")
    public JsonResult list(HttpServletRequest request) {
        Query<Dictionary> query = createQuery(request);
        List<Dictionary> records = service.queryAll(query);
        return JsonResult.ok().setData(records);
    }

    /**
     * 根据id查询字典
     */
    @OperLog(value = "字典管理", desc = "根据id查询")
    @ResponseBody
    @RequestMapping("/get")
    public JsonResult get(Integer id) {
        return JsonResult.ok().setData(service.queryById(id));
    }

    /**
     * 添加字典
     */
    @OperLog(value = "字典管理", desc = "添加", param = false, result = true)
    @ResponseBody
    @RequestMapping("/save")
    public JsonResult save(Dictionary dictionary) {
        if (service.lambdaQuery().andEq(Dictionary::getDictCode, dictionary.getDictCode()).count() > 0) {
            return JsonResult.error("字典标识已存在");
        }
        if (service.lambdaQuery().andEq(Dictionary::getDictName, dictionary.getDictName()).count() > 0) {
            return JsonResult.error("字典名称已存在");
        }
        dictionary.setDeleted(Constants.NO);
        dictionary.setCreateTime(new Date());
        if (service.save(dictionary)) {
            return JsonResult.ok("添加成功");
        }
        return JsonResult.error("添加失败");
    }

    /**
     * 修改字典
     */
    @OperLog(value = "字典管理", desc = "修改", param = false, result = true)
    @ResponseBody
    @RequestMapping("/update")
    public JsonResult update(Dictionary dictionary) {
        if (service.lambdaQuery().andEq(Dictionary::getDictCode, dictionary.getDictCode()).count() > 0) {
            return JsonResult.error("字典标识已存在");
        }
        if (service.lambdaQuery().andEq(Dictionary::getDictName, dictionary.getDictName()).count() > 0) {
            return JsonResult.error("字典名称已存在");
        }
        if (service.updateTemplate(dictionary)) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 删除字典
     */
    @OperLog(value = "字典管理", desc = "删除", result = true)
    @ResponseBody
    @RequestMapping("/remove")
    public JsonResult remove(Integer id) {
        if (service.deleteById(id)) {
            return JsonResult.ok("删除成功");
        }
        return JsonResult.error("删除失败");
    }

    /**
     * 批量添加字典
     */
    @OperLog(value = "字典管理", desc = "批量添加", param = false, result = true)
    @ResponseBody
    @RequestMapping("/saveBatch")
    public JsonResult saveBatch(@RequestBody List<Dictionary> list) {
        // 对集合本身进行非空和重复校验
        StringBuilder sb = new StringBuilder();
        sb.append(CoreUtil.listCheckBlank(list, "dictCode", "字典标识"));
        sb.append(CoreUtil.listCheckBlank(list, "dictName", "字典名称"));
        sb.append(CoreUtil.listCheckRepeat(list, "dictCode", "字典标识"));
        sb.append(CoreUtil.listCheckRepeat(list, "dictName", "字典名称"));
        if (sb.length() != 0) {
            return JsonResult.error(sb.toString());
        }
        // 数据库层面校验
        if (service.lambdaQuery().andIn(Dictionary::getDictCode, list.stream().map(Dictionary::getDictCode).collect(Collectors.toList())).count() > 0) {
            return JsonResult.error("字典标识已存在");
        }
        if (service.lambdaQuery().andIn(Dictionary::getDictName, list.stream().map(Dictionary::getDictName).collect(Collectors.toList())).count() > 0) {
            return JsonResult.error("字典名称已存在");
        }

        if (service.saveBatch(list)) {
            return JsonResult.ok("添加成功");
        }
        return JsonResult.error("添加失败");
    }

    /**
     * 批量删除字典
     */
    @OperLog(value = "字典管理", desc = "批量删除", result = true)
    @ResponseBody
    @RequestMapping("/removeBatch")
    public JsonResult removeBatch(@RequestBody List<Long> ids) {
        if (service.deleteBatchById(ids)) {
            return JsonResult.ok("删除成功");
        }
        return JsonResult.error("删除失败");
    }

}
