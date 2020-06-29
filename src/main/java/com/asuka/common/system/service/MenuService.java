package com.asuka.common.system.service;

import com.asuka.common.core.web.BaseService;
import com.asuka.common.system.dao.MenuDao;
import com.asuka.common.system.entity.Menu;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 菜单服务实现类
 * Created by wangfan on 2018-12-24 16:10
 */
@Service
public class MenuService extends BaseService<Menu, MenuDao> {

    public List<Menu> getUserMenu(Integer userId, Integer menuType) {
        return dao().listByUserId(userId, menuType);
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
        return dao().listByUserId(userId, menuType);
    }
}
