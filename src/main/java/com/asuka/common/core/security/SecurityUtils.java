package com.asuka.common.core.security;

import com.asuka.common.core.exception.BusinessException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/6/29
 */
public class SecurityUtils {

    /**
     * 获取用户账户
     **/
    public static String getUsername() {
        try {
            return getLoginUser().getUsername();
        } catch (Exception e) {
            return "";
        }
    }

    /**
     * 获取用户
     **/
    public static SecurityUser getLoginUser() {
        try {
            return (SecurityUser) getAuthentication().getPrincipal();
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 获取Authentication
     */
    public static Authentication getAuthentication() {
        return SecurityContextHolder.getContext().getAuthentication();
    }


}
