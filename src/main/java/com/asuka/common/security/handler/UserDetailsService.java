package com.asuka.common.security.handler;

import com.asuka.common.security.SecurityUser;
import com.asuka.module.system.entity.Role;
import com.asuka.module.system.entity.User;
import com.asuka.module.system.service.UserService;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;

/**
 * 登录认证信息查询
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/6/30
 */
@Component
public class UserDetailsService implements org.springframework.security.core.userdetails.UserDetailsService {

    private final UserService userService;

    public UserDetailsService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userService.getByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("用户不存在");
        }
        if (user.getState() != 0) {
            throw new LockedException("账号已锁定");
        }
        return createLoginUser(user);
    }

    public UserDetails createLoginUser(User user) {
        userService.selectRoleAndAuth(user);

        // 角色
        Set<String> roles = new HashSet<>();
        for (Role r : user.getRoles()) {
            if (r.getDeleted() == 0) roles.add(r.getRoleCode());
        }

        // 权限
        Set<String> permissions = new HashSet<>();
        for (String auth : user.getAuthorities()) {
            if (auth != null && !auth.trim().isEmpty()) {
                permissions.add(auth);
            }
        }

        return new SecurityUser(user, roles, permissions);
    }
}
