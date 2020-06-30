package com.asuka.common.system.controller;

import com.asuka.common.system.service.DictionaryDataService;
import com.asuka.common.core.annotation.OperLog;
import com.asuka.common.core.web.*;
import com.asuka.common.system.entity.DictionaryData;
import org.beetl.sql.core.engine.PageQuery;
import org.beetl.sql.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 字典项管理
 * Created by wangfan on 2020-03-14 11:29:04
 */
@Controller
@RequestMapping("/sys/dictdata")
public class DictionaryDataController extends BaseQueryController<DictionaryData, DictionaryDataService> {

    /**
     * 分页查询字典项
     */
    @OperLog(value = "字典项管理", desc = "分页查询")
    @ResponseBody
    @RequestMapping("/page")
    public PageResult<DictionaryData> page(HttpServletRequest request) {
        PageQuery<DictionaryData> query = createPageQuery(request);
        return new PageResult<>(query.getList(), query.getTotalRow());
    }

    /**
     * 查询全部字典项
     */
    @OperLog(value = "字典项管理", desc = "查询全部")
    @ResponseBody
    @RequestMapping("/list")
    public JsonResult list(HttpServletRequest request) {
        Query<DictionaryData> query = createQuery(request);
        List<DictionaryData> records = service.queryAll(query);
        return JsonResult.ok().setData(records);
    }

    /**
     * 根据id查询字典项
     */
    @OperLog(value = "字典项管理", desc = "根据id查询")
    @ResponseBody
    @RequestMapping("/get")
    public JsonResult get(Integer id) {
        return JsonResult.ok().setData(service.queryById(id));
    }

    /**
     * 添加字典项
     */
    @OperLog(value = "字典项管理", desc = "添加", param = false, result = true)
    @ResponseBody
    @RequestMapping("/save")
    public JsonResult add(DictionaryData dictionaryData) {
        long nameCnt = service.lambdaQuery().andEq(DictionaryData::getDictId, dictionaryData.getDictId()).andEq(DictionaryData::getDictDataName, dictionaryData.getDictDataName()).count();
        if (nameCnt > 0) {
            return JsonResult.error("字典项名称已存在");
        }
        long codeCnt = service.lambdaQuery().andEq(DictionaryData::getDictId, dictionaryData.getDictId()).andEq(DictionaryData::getDictDataCode, dictionaryData.getDictDataCode()).count();
        if (codeCnt > 0) {
            return JsonResult.error("字典项标识已存在");
        }
        if (service.save(dictionaryData)) {
            return JsonResult.ok("添加成功");
        }
        return JsonResult.error("添加失败");
    }

    /**
     * 修改字典项
     */
    @OperLog(value = "字典项管理", desc = "修改", param = false, result = true)
    @ResponseBody
    @RequestMapping("/update")
    public JsonResult update(DictionaryData dictionaryData) {
        long nameCnt = service.lambdaQuery()
                .andEq(DictionaryData::getDictId, dictionaryData.getDictId())
                .andEq(DictionaryData::getDictDataName, dictionaryData.getDictDataName())
                .andNotEq(DictionaryData::getDictDataId, dictionaryData.getDictDataId())
                .count();
        if (nameCnt > 0) {
            return JsonResult.error("字典项名称已存在");
        }
        long codeCnt = service.lambdaQuery()
                .andEq(DictionaryData::getDictId, dictionaryData.getDictId())
                .andEq(DictionaryData::getDictDataCode, dictionaryData.getDictDataCode())
                .andNotEq(DictionaryData::getDictDataId, dictionaryData.getDictDataId())
                .count();
        if (codeCnt > 0) {
            return JsonResult.error("字典项标识已存在");
        }
        if (service.update(dictionaryData)) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 删除字典项
     */
    @OperLog(value = "字典项管理", desc = "删除", result = true)
    @ResponseBody
    @RequestMapping("/remove")
    public JsonResult remove(Integer id) {
        if (service.deleteById(id)) {
            return JsonResult.ok("删除成功");
        }
        return JsonResult.error("删除失败");
    }

    /**
     * 批量添加字典项
     */
    @OperLog(value = "字典项管理", desc = "批量添加", param = false, result = true)
    @ResponseBody
    @RequestMapping("/saveBatch")
    public JsonResult saveBatch(@RequestBody List<DictionaryData> dictDataList) {
        if (service.saveBatch(dictDataList)) {
            return JsonResult.ok("添加成功");
        }
        return JsonResult.error("添加失败");
    }

    /**
     * 批量删除字典项
     */
    @OperLog(value = "字典项管理", desc = "批量删除", result = true)
    @ResponseBody
    @RequestMapping("/removeBatch")
    public JsonResult removeBatch(@RequestBody List<Long> ids) {
        if (service.deleteBatchById(ids)) {
            return JsonResult.ok("删除成功");
        }
        return JsonResult.error("删除失败");
    }

}
