package com.asuka.common.web;

import com.asuka.common.security.SecurityUtils;
import com.asuka.module.system.entity.User;
import com.asuka.module.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;

/**
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/6/29
 */
public class BaseConsoleController extends BaseController {

    @Autowired
    private UserService userService;

    /**
     * 获取当前登录的user
     */
    public User getLoginUser() {
        String username = SecurityUtils.getUsername();
        return userService.getByUsername(username);
    }

    /**
     * 获取当前登录的userId
     */
    public Integer getLoginUserId() {
        User loginUser = getLoginUser();
        return loginUser == null ? null : loginUser.getUserId();
    }

    /**
     * 根据ID查询系统用户
     * @param id
     * @return
     */
    public User getSysUserById(Serializable id) {
        User user = userService.queryById(id);
        if (user == null) {
            user = new User();
            user.setUsername("未知");
            user.setNickName("未知");
        }
        return user;
    }
}
