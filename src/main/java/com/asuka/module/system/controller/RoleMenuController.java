package com.asuka.module.system.controller;

import com.asuka.common.annotation.OperLog;
import com.asuka.common.exception.BusinessException;
import com.asuka.common.web.BaseQueryController;
import com.asuka.common.web.JsonResult;
import com.asuka.module.system.entity.Menu;
import com.asuka.module.system.entity.RoleMenu;
import com.asuka.module.system.service.MenuService;
import com.asuka.module.system.service.RoleMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 角色菜单管理
 * Created by wangfan on 2018-12-24 16:10
 */
@Controller
@RequestMapping("/sys/role/menu")
public class RoleMenuController extends BaseQueryController<RoleMenu, RoleMenuService> {

    @Autowired
    private MenuService menuService;

    /**
     * 查询角色菜单
     */
    @OperLog(value = "角色管理", desc = "查询角色菜单")
    @ResponseBody
    @RequestMapping("/list")
    public JsonResult list(Integer roleId) {
        List<Menu> menus = menuService.lambdaQuery().asc(Menu::getSortNumber).select();
        List<RoleMenu> roleMenus = service.lambdaQuery().andEq(RoleMenu::getRoleId, roleId).select();
        for (Menu menu : menus) {
            menu.setOpen(true);
            menu.setChecked(false);
            for (RoleMenu roleMenu : roleMenus) {
                if (menu.getMenuId().equals(roleMenu.getMenuId())) {
                    menu.setChecked(true);
                    break;
                }
            }
        }
        return JsonResult.ok().setData(menus);
    }

    /**
     * 添加角色菜单
     */
    @OperLog(value = "角色管理", desc = "添加角色菜单")
    @ResponseBody
    @RequestMapping("/save")
    public JsonResult addRoleAuth(Integer roleId, Integer menuId) {
        RoleMenu roleMenu = new RoleMenu();
        roleMenu.setRoleId(roleId);
        roleMenu.setMenuId(menuId);
        if (service.save(roleMenu)) {
            return JsonResult.ok();
        }
        return JsonResult.error();
    }

    /**
     * 移除角色菜单
     */
    @OperLog(value = "角色管理", desc = "移除角色菜单")
    @ResponseBody
    @RequestMapping("/remove")
    public JsonResult removeRoleAuth(Integer roleId, Integer menuId) {
        int cnt = service.lambdaQuery()
                .andEq(RoleMenu::getRoleId, roleId)
                .andEq(RoleMenu::getMenuId, menuId)
                .delete();
        if (cnt > 0) {
            return JsonResult.ok();
        }
        return JsonResult.error();
    }

    /**
     * 批量修改角色菜单
     */
    @OperLog(value = "角色管理", desc = "修改角色菜单")
    @Transactional
    @ResponseBody
    @RequestMapping("/update/{id}")
    public JsonResult setRoleAuth(@PathVariable("id") Integer roleId, @RequestBody List<Integer> menuIds) {
        service.lambdaQuery().andEq(RoleMenu::getRoleId, roleId).delete();
        if (menuIds.size() > 0) {
            List<RoleMenu> roleMenuList = new ArrayList<>();
            for (Integer menuId : menuIds) {
                RoleMenu roleMenu = new RoleMenu();
                roleMenu.setRoleId(roleId);
                roleMenu.setMenuId(menuId);
                roleMenu.setCreateTime(new Date());
                roleMenuList.add(roleMenu);
            }
            if (service.saveBatch(roleMenuList)) {
                return JsonResult.ok("保存成功");
            } else {
                throw new BusinessException("操作失败");
            }
        }
        return JsonResult.ok("保存成功");
    }

}
