package com.asuka.common.advice;

import cn.hutool.crypto.SecureUtil;
import com.alibaba.fastjson.JSON;
import com.asuka.module.system.service.OptionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

/**
 * Api模块返回值加密
 * @author wujiawei
 * @see
 * @since 2020/7/20 2:58 下午
 */
@ControllerAdvice(basePackages = "com.asuka.module.api")
public class ApiEncryptResponseBodyAdvice implements ResponseBodyAdvice<Object> {

    // 切记修改密钥
    private final String SECRET = "QiXX#kEg^0A7XXsP";

    private static final Logger log = LoggerFactory.getLogger(ApiEncryptResponseBodyAdvice.class);
    private final OptionService optionService;
    public ApiEncryptResponseBodyAdvice(OptionService optionService) {
        this.optionService = optionService;
    }

    @Override
    public boolean supports(MethodParameter methodParameter, Class<? extends HttpMessageConverter<?>> aClass) {
        return optionService.getByKeyAsBoolean("response_body_encrypt");
    }

    @Override
    public Object beforeBodyWrite(Object o, MethodParameter methodParameter, MediaType mediaType, Class<? extends HttpMessageConverter<?>> aClass, ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse) {
        if (o != null) {
            String json;

            if (o instanceof String) {
                json = String.valueOf(o);
            } else {
                json = JSON.toJSONString(o);
            }

            log.info("============ api response body : {} ==========", json);

            String encryptBase64 = SecureUtil.aes(SECRET.getBytes()).encryptBase64(json);
            log.info("============ api response body when encrypted and base64: {} ==========", encryptBase64);
            o = encryptBase64;
        }
        return o;
    }
}
