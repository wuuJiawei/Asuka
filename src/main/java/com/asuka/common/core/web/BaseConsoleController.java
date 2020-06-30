package com.asuka.common.core.web;

import com.asuka.common.core.security.SecurityUtils;
import com.asuka.common.system.entity.User;
import com.asuka.common.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

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

}
