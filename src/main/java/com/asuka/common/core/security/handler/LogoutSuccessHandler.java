package com.asuka.common.core.security.handler;

import com.asuka.common.core.security.SecurityConstant;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 自定义退出登录处理器
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/6/30
 */
@Component
public class LogoutSuccessHandler implements org.springframework.security.web.authentication.logout.LogoutSuccessHandler {
    @Override
    public void onLogoutSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        // 跳转到登录
        httpServletResponse.sendRedirect(SecurityConstant.LOGIN_PAGE);
    }
}
