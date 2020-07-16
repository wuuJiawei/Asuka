package com.asuka.common.security;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import javax.management.relation.RoleList;
import java.util.Collection;
import java.util.Set;

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
        return getLoginUser().getUsername();
    }

    /**
     * 获取权限
     *
     * @return
     */
    public static Set<String> getPermissions() {
        return getLoginUser().getPermissions();
    }

    /**
     * 获取用户
     **/
    public static SecurityUser getLoginUser() {
        try {
            return (SecurityUser) getAuthentication().getPrincipal();
        } catch (Exception e) {
            return new SecurityUser();
        }
    }

    /**
     * 获取Authentication
     */
    public static Authentication getAuthentication() {
        return SecurityContextHolder.getContext().getAuthentication();
    }

    public static void reloadUsernameOfLoginUser(String username) {
        reloadLoginUser(username, null, null, null);
    }

    public static void reloadPasswordOfLoginUser(String password) {
        reloadLoginUser(null, password, null, null);
    }

    public static void reloadPermissionOfLoginUser(Set<String> permissions) {
        reloadLoginUser(null, null, null, permissions);
    }

    public static void reloadRoleOfLoginUser(Set<String> roles) {
        reloadLoginUser(null, null, roles, null);
    }

    public static void reloadLoginUser(String username, String password, Set<String> roleSet, Set<String> permissionSet) {
        SecurityUser securityUser = getLoginUser();
        if (securityUser == null) {
            return;
        }
        username = StringUtils.isEmpty(username) ? securityUser.getUsername() : username;
        password = StringUtils.isEmpty(password) ? securityUser.getPassword() : password;
        roleSet = CollectionUtils.isEmpty(roleSet) ? securityUser.getRoles() : roleSet;
        permissionSet = CollectionUtils.isEmpty(permissionSet) ? securityUser.getPermissions() : permissionSet;

        securityUser.setPermissions(permissionSet);
        securityUser.setRoles(roleSet);
        securityUser.setUsername(username);
        securityUser.setPassword(password);

        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);
        token.setDetails(securityUser);
        SecurityContextHolder.getContext().setAuthentication(token);
    }

}
