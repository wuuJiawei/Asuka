package com.asuka.common.security;

import com.asuka.module.system.entity.User;
import org.springframework.security.core.Authentication;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;

/**
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/6/30
 */
public class SecurityExt {

    /**
     * 是否是游客访问(用户没有登录)
     */
    public boolean isGuest() {
        return getSubject() == null || getSubject().getPrincipal() == null;
    }

    /**
     * 是否已经认证(包含登录和记住密码)
     */
    public boolean isUser() {
        return getSubject() != null && getSubject().getPrincipal() != null;
    }

    /**
     * 是否是登录通过认证的
     */
    public boolean isAuthenticated() {
        return getSubject() != null && getSubject().isAuthenticated();
    }

    /**
     * 是否是没有进行登录通过认证(记住密码)
     */
    public boolean isNotAuthenticated() {
        return !isAuthenticated();
    }

    /**
     * 获取当前用户信息
     */
    public String principal() {
        return principal(null);
    }

    /**
     * 获取当前用户信息
     *
     * @param property 用户属性名
     */
    public String principal(String property) {
        SecurityUser securityUser = getSecurityUser();
        if (securityUser == null) {
            return "";
        }
        User user = securityUser.getUser();
        if (user == null) {
            return "";
        }
        return getPrincipalProperty(user, property);
    }
    /**
     * 获取当前用户的某个属性
     */
    private String getPrincipalProperty(Object principal, String property) {
        String strValue = null;
        try {
            BeanInfo bi = Introspector.getBeanInfo(principal.getClass());
            boolean foundProperty = false;
            for (PropertyDescriptor pd : bi.getPropertyDescriptors()) {
                if (pd.getName().equals(property)) {
                    Object value = pd.getReadMethod().invoke(principal, (Object[]) null);
                    if (value != null) strValue = value.toString();
                    foundProperty = true;
                    break;
                }
            }
            if (!foundProperty) {
                String message = "Property [" + property + "] not found in principal of type [" + principal.getClass().getName() + "]";
                throw new RuntimeException(message);
            }
        } catch (Exception e) {
            String message = "Error reading property [" + property + "] from principal of type [" + principal.getClass().getName() + "]";
            throw new RuntimeException(message, e);
        }
        return strValue;
    }

    /**
     * 是否具有某个角色
     *
     * @param role 角色标识
     */
    public boolean hasRole(String role) {
        SecurityUser user = getSecurityUser();
        if (user == null) {
            return false;
        }
        return user.getRoles().contains(role);
    }

    /**
     * 是否没有有某个角色
     *
     * @param role 角色标识
     */
    public boolean lacksRole(String role) {
        return !hasRole(role);
    }

    /**
     * 是否具有任意一个角色
     *
     * @param roles 角色标识
     */
    public boolean hasAnyRole(String roles) {
        boolean hasAnyRole = false;
        for (String role : roles.split(",")) {
            if (hasRole(role)) {
                hasAnyRole = true;
                break;
            }
        }
        return hasAnyRole;
    }

    /**
     * 是否具有某个权限
     *
     * @param p 权限标识
     */
    public boolean hasPermission(String p) {
        SecurityUser user = getSecurityUser();
        if (user == null) {
            return false;
        }
        return user.getPermissions().contains(p);
    }

    /**
     * 是否没有某个权限
     *
     * @param p 权限标识
     */
    public boolean lacksPermission(String p) {
        return !hasPermission(p);
    }

    /**
     * 获取授权用户信息
     * @return
     */
    protected SecurityUser getSecurityUser() {
        return (SecurityUser) getSubject().getPrincipal();
    }

    /**
     * 获取当前登录的用户
     */
    protected Authentication getSubject() {
        return SecurityUtils.getAuthentication();
    }

}
