package com.asuka.common.core.web;

import com.asuka.common.system.entity.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

/**
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/6/29
 */
public class BaseConsoleController extends BaseController {

    /**
     * 获取当前登录的user
     */
    public User getLoginUser() {
        Subject subject = SecurityUtils.getSubject();
        if (subject == null) return null;
        Object object = subject.getPrincipal();
        if (object != null) return (User) object;
        return null;
    }

    /**
     * 获取当前登录的userId
     */
    public Integer getLoginUserId() {
        User loginUser = getLoginUser();
        return loginUser == null ? null : loginUser.getUserId();
    }

}
