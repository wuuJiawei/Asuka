package com.asuka.module.system.service;

import com.asuka.common.Constants;
import com.asuka.common.security.SecurityUtils;
import com.asuka.common.web.BaseService;
import com.asuka.module.system.dao.MenuDao;
import com.asuka.module.system.entity.Menu;
import com.asuka.module.system.entity.Role;
import com.asuka.module.system.entity.RoleMenu;
import com.asuka.module.system.entity.UserRole;
import org.beetl.sql.core.query.Query;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 菜单服务实现类
 * Created by wangfan on 2018-12-24 16:10
 */
@Service
public class MenuService extends BaseService<Menu, MenuDao> {

    private final RoleMenuService roleMenuService;
    private final RoleService roleService;
    private final UserRoleService userRoleService;

    public MenuService(RoleMenuService roleMenuService, RoleService roleService, UserRoleService userRoleService) {
        this.roleMenuService = roleMenuService;
        this.roleService = roleService;
        this.userRoleService = userRoleService;
    }

    public List<Menu> getUserMenu(Integer userId, Integer menuType) {
        List<Menu> menuList = new ArrayList<>();

        List<UserRole> roleIdList = userRoleService.lambdaQuery().andEq(UserRole::getUserId, userId).select(UserRole::getRoleId);
        if (CollectionUtils.isEmpty(roleIdList)) {
            return menuList;
        }

        List<Role> roleIdList2 = roleService
                .lambdaQuery()
                .andIn(Role::getRoleId, roleIdList.stream().map(UserRole::getRoleId).collect(Collectors.toList()))
                .andEq(Role::getDeleted, Constants.NO)
                .select(Role::getRoleId);
        if (CollectionUtils.isEmpty(roleIdList2)) {
            return menuList;
        }

        List<RoleMenu> menuIdList = roleMenuService
                .lambdaQuery()
                .andIn(RoleMenu::getRoleId, roleIdList2.stream().map(Role::getRoleId).collect(Collectors.toList()))
                .select(RoleMenu::getMenuId);
        if (CollectionUtils.isEmpty(menuIdList)) {
            return menuList;
        }

        menuList = lambdaQuery()
                .andIn(Menu::getMenuId, menuIdList.stream().map(RoleMenu::getMenuId).collect(Collectors.toList()))
                .andEq(Menu::getDeleted, Constants.NO)
                .andEq(Menu::getMenuType, Query.filterEmpty(menuType))
                .asc(Menu::getSortNumber)
                .select();

        return menuList;
    }

    public List<Menu> toMenuTree(List<Menu> menus, Integer parentId) {
        List<Menu> list = new ArrayList<>();
        for (Menu menu : menus) {
            if (parentId.equals(menu.getParentId())) {
                menu.setChildren(toMenuTree(menus, menu.getMenuId()));
                list.add(menu);
            }
        }
        return list;
    }

    public List<Menu> listByUserId(Integer userId, Integer menuType) {
        return getUserMenu(userId, menuType);
    }

    /**
     * 更新Security中的权限列表
     * @param menu
     */
    public void updateMenuPermissionOfSecurity(Menu menu) {
        Set<String> permissions = SecurityUtils.getPermissions();
        permissions.add(menu.getAuthority());
        SecurityUtils.reloadPermissionOfLoginUser(permissions);
    }
}
