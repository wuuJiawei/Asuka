package com.asuka.common.system.service;

import com.asuka.common.core.web.BaseService;
import com.asuka.common.system.dao.UserRoleDao;
import com.asuka.common.system.entity.Role;
import com.asuka.common.system.entity.UserRole;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 用户角色服务实现类
 * Created by wangfan on 2018-12-24 16:10
 */
@Service
public class UserRoleService extends BaseService<UserRole, UserRoleDao> {

    public Integer[] getRoleIds(String userId) {
        List<UserRole> userRoles = lambdaQuery().andEq(UserRole::getUserId, userId).select();
        Integer[] roleIds = new Integer[userRoles.size()];
        for (int i = 0; i < userRoles.size(); i++) {
            roleIds[i] = userRoles.get(i).getRoleId();
        }
        return roleIds;
    }

    public List<Role> listByUserId(Integer userId) {
        return dao().listByUserId(userId);
    }

    public List<Role> listByUserIds(List<Integer> userIds) {
        return dao().listByUserIds(userIds);
    }

    public boolean insertBatch(Integer userId, List<Integer> roleIds) {
        List<UserRole> userRoleList = roleIds.stream().map(x->{
            UserRole ur = new UserRole();
            ur.setCreateTime(new Date());
            ur.setRoleId(x);
            ur.setUserId(userId);
            return ur;
        }).collect(Collectors.toList());
        dao().insertBatch(userRoleList);
        return true;
    }
}
