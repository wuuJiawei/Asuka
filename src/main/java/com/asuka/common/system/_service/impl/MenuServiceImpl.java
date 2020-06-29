package com.asuka.common.system._service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.asuka.common.core.web.PageParam;
import com.asuka.common.core.web.PageResult;
import com.asuka.common.system.dao.MenuDao;
import com.asuka.common.system.entity.Menu;
import com.asuka.common.system._service.MenuService;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * 菜单服务实现类
 * Created by wangfan on 2018-12-24 16:10
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuDao, Menu> implements MenuService {
    @Override
    public PageResult<Menu> listPage(PageParam<Menu> pageParam) {
        return new PageResult<>(baseMapper.listPage(pageParam), pageParam.getTotal());
    }

    @Override
    public List<Menu> getUserMenu(Integer userId, Integer menuType) {
        return baseMapper.listByUserId(userId, menuType);
    }

    @Override
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

}
