package com.asuka.common.utils;

import javax.servlet.http.HttpServletRequest;

/**
 * Servlet工具类
 *
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2019/3/29
 */
public class ServletUtils {

    /**
     * 获取项目根路径
     *
     * @param httpServletRequest
     * @return
     */
    public static String getBasePath(HttpServletRequest httpServletRequest) {
        String scheme = httpServletRequest.getScheme();
        String serverName = httpServletRequest.getServerName();
        int port = httpServletRequest.getServerPort();
        String path = httpServletRequest.getContextPath();
        String basePath = scheme + "://" + serverName + ":" + port + path + "/";
        return basePath;
    }


}
