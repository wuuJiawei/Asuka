package com.asuka.common.system.controller;

import com.asuka.common.core.annotation.OperLog;
import com.asuka.common.core.web.*;
import com.asuka.common.system.entity.DictionaryData;
import com.asuka.common.system.entity.Menu;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.beetl.sql.core.engine.PageQuery;
import org.beetl.sql.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 菜单管理
 * Created by wangfan on 2018-12-24 16:10
 */
@Controller
@RequestMapping("/sys/menu")
public class MenuController extends BaseQueryController<Menu, com.asuka.common.system.service.MenuService> {

    @RequiresPermissions("sys:menu:view")
    @RequestMapping()
    public String view() {
        return "system/menu.html";
    }

    /**
     * 分页查询菜单
     */
    @OperLog(value = "菜单管理", desc = "分页查询")
    @RequiresPermissions("sys:menu:list")
    @ResponseBody
    @RequestMapping("/page")
    public PageResult<Menu> page(HttpServletRequest request) {
        PageQuery<Menu> query = createPageQuery(request);
        return new PageResult<>(query.getList(), query.getTotalRow());
    }

    /**
     * 查询全部菜单
     */
    @OperLog(value = "菜单管理", desc = "查询全部")
    @RequiresPermissions("sys:menu:list")
    @ResponseBody
    @RequestMapping("/list")
    public JsonResult list(HttpServletRequest request) {
        Query<Menu> query = createQuery(request);
        List<Menu> records = service.queryAll(query);
        return JsonResult.ok().setData(records);
    }

    /**
     * 根据id查询菜单
     */
    @OperLog(value = "菜单管理", desc = "根据id查询")
    @RequiresPermissions("sys:menu:list")
    @ResponseBody
    @RequestMapping("/get")
    public JsonResult get(Integer id) {
        return JsonResult.ok().setData(service.queryById(id));
    }

    /**
     * 添加菜单
     */
    @OperLog(value = "菜单管理", desc = "添加", param = false, result = true)
    @RequiresPermissions("sys:menu:save")
    @ResponseBody
    @RequestMapping("/save")
    public JsonResult save(Menu menu) {
        if (service.save(menu)) {
            return JsonResult.ok("添加成功");
        }
        return JsonResult.error("添加失败");
    }

    /**
     * 修改菜单
     */
    @OperLog(value = "菜单管理", desc = "修改", param = false, result = true)
    @RequiresPermissions("sys:menu:update")
    @ResponseBody
    @RequestMapping("/update")
    public JsonResult update(Menu menu) {
        if (service.update(menu)) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 删除菜单
     */
    @OperLog(value = "菜单管理", desc = "删除", result = true)
    @RequiresPermissions("sys:menu:remove")
    @ResponseBody
    @RequestMapping("/remove")
    public JsonResult remove(Integer id) {
        if (service.deleteById(id)) {
            return JsonResult.ok("删除成功");
        }
        return JsonResult.error("删除失败");
    }

    /**
     * 批量添加菜单
     */
    @OperLog(value = "菜单管理", desc = "批量添加", param = false, result = true)
    @RequiresPermissions("sys:menu:save")
    @ResponseBody
    @RequestMapping("/saveBatch")
    public JsonResult saveBatch(@RequestBody List<Menu> menuList) {
        if (service.saveBatch(menuList)) {
            return JsonResult.ok("添加成功");
        }
        return JsonResult.error("添加失败");
    }

    /**
     * 批量修改菜单
     */
    @OperLog(value = "菜单管理", desc = "批量修改", result = true)
    @RequiresPermissions("sys:menu:update")
    @ResponseBody
    @RequestMapping("/updateBatch")
    public JsonResult updateBatch(@RequestBody List<Menu> list) {
        if (service.updateTemplateBatch(list)) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 批量删除菜单
     */
    @OperLog(value = "菜单管理", desc = "批量删除", result = true)
    @RequiresPermissions("sys:menu:remove")
    @ResponseBody
    @RequestMapping("/removeBatch")
    public JsonResult removeBatch(@RequestBody List<Long> ids) {
        if (service.deleteBatchById(ids)) {
            return JsonResult.ok("删除成功");
        }
        return JsonResult.error("删除失败");
    }

}
