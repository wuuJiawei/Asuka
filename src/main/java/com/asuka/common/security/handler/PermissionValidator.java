package com.asuka.common.security.handler;

import com.asuka.common.security.SecurityUser;
import com.asuka.common.security.SecurityUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.Set;

/**
 * 权限校验器
 * 参考RuoYi
 */
@Service("$")
public class PermissionValidator {


    //=================以下都是权限校验的简写===============


    /**
     * 是否存在某权限
     * @param permission 权限标识
     * @return
     */
    public boolean hp(String permission) {
        return hasPermission(permission);
    }

    /**
     * 是否是某角色
     * @param role
     * @return
     */
    public boolean hr(String role) {
        return hasRole(role);
    }


    //===============以上都是权限校验的简写================

    /**
     * 是否拥有某权限
     * @param permission 权限标识
     * @return
     */
    public boolean hasPermission(String permission) {
        SecurityUser securityUser = SecurityUtils.getLoginUser();
        if (securityUser == null || CollectionUtils.isEmpty(securityUser.getPermissions())) {
            return false;
        }
        return hasPermission(securityUser.getPermissions(), permission);
    }

    /**
     * 遍历权限列表，校验是否存在某权限
     * @param permissionList 权限列表
     * @param permission 权限标识
     * @return true 存在权限标识
     * @return false 不存在权限标识，校验失败
     */
    public boolean hasPermission(Set<String> permissionList, String permission) {
        if (CollectionUtils.isEmpty(permissionList) || StringUtils.isEmpty(permission)) {
            return false;
        }
        for (String x : permissionList) {
            if (permission.equals(x)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 是否是某角色
     * @param role
     * @return
     */
    public boolean hasRole(String role){
        SecurityUser user = SecurityUtils.getLoginUser();
        if (user == null || CollectionUtils.isEmpty(user.getRoles())) {
            return false;
        }
        return hasPermission(user.getRoles(), role);
    }

    /**
     * 遍历角色列表，校验是否存在某角色
     * @param roleList
     * @param role
     * @return
     */
    public boolean hasRole(Set<String> roleList, String role) {
        if (CollectionUtils.isEmpty(roleList) || StringUtils.isEmpty(role)) {
            return false;
        }
        for (String x : roleList) {
            if (role.equals(x)) {
                return true;
            }
        }
        return false;
    }

}
