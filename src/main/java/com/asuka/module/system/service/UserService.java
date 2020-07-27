package com.asuka.module.system.service;

import com.asuka.common.exception.BusinessException;
import com.asuka.common.web.BaseService;
import com.asuka.module.system.dao.UserDao;
import com.asuka.module.system.entity.Menu;
import com.asuka.module.system.entity.Role;
import com.asuka.module.system.entity.User;
import com.asuka.module.system.entity.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 用户服务实现类
 * Created by wangfan on 2018-12-24 16:10
 */
@Service
public class UserService extends BaseService<User, UserDao> {

    @Autowired
    private UserRoleService userRoleService;
    @Autowired
    private MenuService menuService;

    public User getByUsername(String username) {
        return lambdaQuery().andEq(User::getUsername, username).single();
    }

    public User getFullById(Integer userId) {
        List<User> userList = lambdaQuery().andEq(User::getUserId, userId).select();
        if (userList == null || userList.size() == 0) {
            return null;
        }
        return selectRoleAndAuth(userList.get(0));
    }

    public User selectRoleAndAuth(User user) {
        user.setRoles(userRoleService.listByUserId(user.getUserId()));
        List<Menu> menus = menuService.listByUserId(user.getUserId(), null);
        List<String> auths = new ArrayList<>();
        for (Menu menu : menus) {
            auths.add(menu.getAuthority());
        }
        user.setAuthorities(auths);
        return user;
    }

    @Transactional
    public boolean saveUser(User user) {
        if (user.getUsername() != null && lambdaQuery().andEq(User::getUsername, user.getUsername()).count() > 0) {
            throw new BusinessException("账号已存在");
        }
        if (user.getPhone() != null && lambdaQuery().andEq(User::getPhone, user.getPhone()).count() > 0) {
            throw new BusinessException("手机号已存在");
        }
        if (user.getEmail() != null && lambdaQuery().andEq(User::getEmail, user.getEmail()).count() > 0) {
            throw new BusinessException("邮箱已存在");
        }
        user.setCreateTime(new Date());
        dao().insert(user, true);
        if (user.getRoleIds() != null) {
            addUserRoles(user.getUserId(), user.getRoleIds(), false);
        }
        return true;
    }

    @Transactional
    public boolean updateUser(User user) {
        if (!StringUtils.isEmpty(user.getUsername())) {
            long usernameCnt = lambdaQuery().andEq(User::getUsername, user.getUsername()).andNotEq(User::getUserId, user.getUserId()).count();
            if (usernameCnt > 0) {
                throw new BusinessException("账号已存在");
            }
        }

        if (!StringUtils.isEmpty(user.getPhone())) {
            long phoneCnt = lambdaQuery().andEq(User::getPhone, user.getPhone()).andNotEq(User::getUserId, user.getUserId()).count();
            if (phoneCnt > 0) {
                throw new BusinessException("手机号已存在");
            }
        }

        if (!StringUtils.isEmpty(user.getEmail())) {
            long emailCnt = lambdaQuery().andEq(User::getEmail, user.getEmail()).andNotEq(User::getUserId, user.getUserId()).count();
            if (emailCnt > 0) {
                throw new BusinessException("邮箱已存在");
            }
        }

        updateTemplate(user);
        if (user.getRoleIds() != null) {
            addUserRoles(user.getUserId(), user.getRoleIds(), true);
        }
        return true;
    }

    public boolean comparePsw(String dbPsw, String inputPsw) {
        return dbPsw != null && dbPsw.equals(encodePsw(inputPsw));
    }

    public String encodePsw(String psw) {
        if (psw == null) {
            return null;
        }
        ;
        return DigestUtils.md5DigestAsHex(psw.getBytes());
    }

    /**
     * 查询用户的角色
     */
    public void selectUserRoles(List<User> users) {
        if (users != null && users.size() > 0) {
            List<Integer> userIds = new ArrayList<>();
            for (User one : users) {
                userIds.add(one.getUserId());
            }
            List<Role> userRoles = userRoleService.listByUserIds(userIds);
            for (User user : users) {
                List<Role> roles = new ArrayList<>();
                for (Role userRole : userRoles) {
                    if (user.getUserId().equals(userRole.getUserId())) {
                        roles.add(userRole);
                    }
                }
                user.setRoles(roles);
            }
        }
    }

    /**
     * 添加用户角色
     */
    private void addUserRoles(Integer userId, List<Integer> roleIds, boolean deleteOld) {
        if (deleteOld) {
            userRoleService.lambdaQuery().andEq(UserRole::getUserId, userId).delete();
        }
        if (roleIds.size() > 0) {
            if (!userRoleService.insertBatch(userId, roleIds)) {
                throw new BusinessException("操作失败");
            }
        }
    }

}
