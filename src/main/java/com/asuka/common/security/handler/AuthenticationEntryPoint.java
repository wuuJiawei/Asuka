package com.asuka.common.security.handler;

import com.asuka.common.security.SecurityConstant;
import org.springframework.security.core.AuthenticationException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 自定义认证失败的处理器
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/6/30
 */
public class AuthenticationEntryPoint implements org.springframework.security.web.AuthenticationEntryPoint {
    @Override
    public void commence(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AuthenticationException e) throws IOException, ServletException {
        httpServletResponse.sendRedirect(SecurityConstant.FORBIDDEN_PAGE);
    }
}
