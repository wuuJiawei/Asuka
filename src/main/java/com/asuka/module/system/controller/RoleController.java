package com.asuka.module.system.controller;

import com.asuka.common.Constants;
import com.asuka.common.annotation.OperLog;
import com.asuka.common.web.*;
import com.asuka.common.utils.CoreUtil;
import com.asuka.module.system.entity.Role;
import com.asuka.module.system.service.RoleService;
import org.beetl.sql.core.engine.PageQuery;
import org.beetl.sql.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 角色管理
 * Created by wangfan on 2018-12-24 16:10
 */
@Controller
@RequestMapping("/sys/role")
public class RoleController extends BaseQueryController<Role, RoleService> {

    @RequestMapping()
    public String view() {
        return "system/role.html";
    }

    /**
     * 分页查询角色
     */
    @OperLog(value = "角色管理", desc = "分页查询")
    @ResponseBody
    @RequestMapping("/page")
    public PageResult<Role> page(HttpServletRequest request) {
        PageQuery<Role> query = createPageQuery(request);
        return new PageResult<Role>(query.getList(), query.getTotalRow());
    }

    /**
     * 查询全部角色
     */
    @OperLog(value = "角色管理", desc = "查询全部")
    @ResponseBody
    @RequestMapping("/list")
    public JsonResult list(HttpServletRequest request) {
        Query<Role> query = createQuery(request);
        List<Role> records = service.queryAll(query);
        return JsonResult.ok().setData(records);
    }

    /**
     * 根据id查询角色
     */
    @OperLog(value = "角色管理", desc = "根据id查询")
    @ResponseBody
    @RequestMapping("/get")
    public JsonResult get(Integer id) {
        return JsonResult.ok().setData(service.queryById(id));
    }

    /**
     * 添加角色
     */
    @OperLog(value = "角色管理", desc = "添加", param = false, result = true)
    @ResponseBody
    @RequestMapping("/save")
    public JsonResult save(Role role) {
        long codeCnt = service.lambdaQuery().andEq(Role::getRoleCode, role.getRoleCode()).count();
        if (codeCnt > 0) {
            return JsonResult.error("角色标识已存在");
        }
        long nameCnt = service.lambdaQuery().andEq(Role::getRoleName, role.getRoleName()).count();
        if (nameCnt > 0) {
            return JsonResult.error("角色名称已存在");
        }
        role.setCreateTime(new Date());
        role.setDeleted(Constants.NO);
        if (service.save(role)) {
            return JsonResult.ok("添加成功");
        }
        return JsonResult.error("添加失败");
    }

    /**
     * 修改角色
     */
    @OperLog(value = "角色管理", desc = "修改", param = false, result = true)
    @ResponseBody
    @RequestMapping("/update")
    public JsonResult update(Role role) {
        long codeCnt = service.lambdaQuery()
                .andEq(Role::getRoleCode, role.getRoleCode())
                .andNotEq(Role::getRoleId, role.getRoleId())
                .count();
        if (codeCnt > 0) {
            return JsonResult.error("角色标识已存在");
        }
        long nameCnt = service.lambdaQuery()
                .andEq(Role::getRoleName, role.getRoleName())
                .andNotEq(Role::getRoleId, role.getRoleId())
                .count();
        if (nameCnt > 0) {
            return JsonResult.error("角色名称已存在");
        }
        if (service.updateTemplate(role)) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 删除角色
     */
    @OperLog(value = "角色管理", desc = "删除", result = true)
    @ResponseBody
    @RequestMapping("/remove")
    public JsonResult remove(Integer id) {
        if (service.deleteById(id)) {
            return JsonResult.ok("删除成功");
        }
        return JsonResult.error("删除失败");
    }

    /**
     * 批量添加角色
     */
    @OperLog(value = "角色管理", desc = "批量添加", param = false, result = true)
    @ResponseBody
    @RequestMapping("/saveBatch")
    public JsonResult saveBatch(@RequestBody List<Role> list) {
        // 对集合本身进行非空和重复校验
        StringBuilder sb = new StringBuilder();
        sb.append(CoreUtil.listCheckBlank(list, "roleCode", "角色标识"));
        sb.append(CoreUtil.listCheckBlank(list, "roleName", "角色名称"));
        sb.append(CoreUtil.listCheckRepeat(list, "roleCode", "角色标识"));
        sb.append(CoreUtil.listCheckRepeat(list, "roleName", "角色名称"));
        if (sb.length() != 0) return JsonResult.error(sb.toString());
        // 数据库层面校验
        long codeCnt = service.lambdaQuery().andIn(Role::getRoleCode, list.stream().map(Role::getRoleCode).collect(Collectors.toList())).count();
        if (codeCnt > 0) {
            return JsonResult.error("角色标识已存在");
        }
        long nameCnt = service.lambdaQuery().andIn(Role::getRoleName, list.stream().map(Role::getRoleName).collect(Collectors.toList())).count();
        if (nameCnt > 0) {
            return JsonResult.error("角色名称已存在");
        }
        if (service.saveBatch(list)) {
            return JsonResult.ok("添加成功");
        }
        return JsonResult.error("添加失败");
    }

    /**
     * 批量删除角色
     */
    @OperLog(value = "角色管理", desc = "批量删除", result = true)
    @ResponseBody
    @RequestMapping("/removeBatch")
    public JsonResult removeBatch(@RequestBody List<Long> ids) {
        if (service.deleteBatchById(ids)) {
            return JsonResult.ok("删除成功");
        }
        return JsonResult.error("删除失败");
    }

}
