package com.asuka.common.exception;

import com.alibaba.fastjson.JSON;
import com.asuka.common.Constants;
import com.asuka.common.web.JsonResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 全局异常处理器
 */
@ControllerAdvice(basePackages = "com.asuka")
public class GlobalExceptionHandler {
    private Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ExceptionHandler(BusinessException.class)
    public String businessExceptionHandler(BusinessException ex, HttpServletRequest request, HttpServletResponse response){
        logger.error(ex.getMessage(), ex);
        return doHandler("error/500.html", 500, ex.getMessage(), ex.toString(), request, response);
    }

    @ExceptionHandler(AccessDeniedException.class)
    public String AccessDeniedException(AccessDeniedException ex, HttpServletRequest request, HttpServletResponse response) {
        return doHandler("error/403.html", 403, ex.getMessage(), ex.toString(), request, response);
    }

    @ExceptionHandler(AuthenticationException.class)
    public String AuthenticationException(AuthenticationException ex, HttpServletRequest request, HttpServletResponse response) {
        return doHandler("error/403.html", 403, ex.getMessage(), ex.toString(), request, response);
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public String IllegalArgumentException(IllegalArgumentException ex, HttpServletRequest request, HttpServletResponse response) {
        return doHandler("error/500.html", Constants.RESULT_ERROR_CODE, ex.getMessage(), ex.toString(), request, response);
    }

    @ExceptionHandler(NullPointerException.class)
    public String NullPointerException(NullPointerException ex, HttpServletRequest request, HttpServletResponse response) {
        logger.error(ex.getMessage(), ex);
        return doHandler("error/500.html", Constants.RESULT_ERROR_CODE, ex.getMessage(), ex.toString(), request, response);
    }

    @ExceptionHandler(Exception.class)
    public String errorHandler(Exception ex, HttpServletRequest request, HttpServletResponse response) {
        logger.error(ex.getMessage(), ex);
        if (ex instanceof IException) {
            return doHandler("error/500.html", ((IException) ex).getCode(), ex.getMessage(), ex.toString(), request, response);
        }
        return doHandler("error/500.html", Constants.RESULT_ERROR_CODE, ex.getMessage(), ex.toString(), request, response);
    }

    /**
     * 处理错误,ajax返回json，非ajax跳转页面
     */
    private String doHandler(String url, Integer code, String msg, String error, HttpServletRequest request, HttpServletResponse response) {
        if (isAjax(request)) {
            cross(response);  // 支持跨域
            response.setContentType("application/json;charset=utf-8");
            try {
                PrintWriter out = response.getWriter();
                out.write(JSON.toJSONString(JsonResult.error(code, msg).put("error", error)));
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        }
        return url;
    }

    /**
     * 判断是不是ajax请求
     */
    private boolean isAjax(HttpServletRequest request) {
        String xHeader = request.getHeader("X-Requested-With");
        return (xHeader != null && xHeader.contains("XMLHttpRequest"));
    }

    /**
     * 支持跨域请求
     */
    private void cross(HttpServletResponse response) {
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type, x-requested-with, X-Custom-Header, Authorization");
    }

}
