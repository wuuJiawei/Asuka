package com.asuka.common.security;

/**
 * 鉴权专用的常量类
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/6/30
 */
public class SecurityConstant {

    // 登录页面地址
    public static final String LOGIN_PAGE = "/login";

    // 登录请求接口地址
    public static final String LOGIN_PROCESSING_URL = "/login/processing";

    // 退出登录地址
    public static final String LOGOUT_URL = "/logout";

    // 没有权限的提示页面
    public static final String FORBIDDEN_PAGE = "/403";

    public static final String USERNAME_PARAMETER = "username";
    public static final String PASSWORD_PARAMETER = "password";

}
