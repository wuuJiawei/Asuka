package com.asuka.common.web;

import com.asuka.common.Constants;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * 接口返回结果对象
 * Created by wangfan on 2017-06-10 10:10
 */
public class JsonResult implements Serializable {
    private static final long serialVersionUID = 1L;

    private static final int DEFAULT_OK_CODE = Constants.RESULT_OK_CODE;  // 默认成功码
    private static final int DEFAULT_ERROR_CODE = Constants.RESULT_ERROR_CODE;  // 默认失败码
    private static final String DEFAULT_OK_MSG = "操作成功";  // 默认成功msg
    private static final String DEFAULT_ERROR_MSG = "操作失败";  // 默认失败msg
    private static Map<String, Object> DATA_MAP;
    private static JsonResult JSON_RESULT;

    private JsonResult() {

    }

    private int code;
    private String msg;
    private Object data;

    /**
     * 返回成功
     */
    public static JsonResult ok() {
        return ok(null);
    }

    /**
     * 返回成功
     */
    public static JsonResult ok(String message) {
        return ok(DEFAULT_OK_CODE, message);
    }

    /**
     * 返回成功
     * 支持链式调用put()方式
     *
     * @param code
     * @param message
     * @return
     */
    public static JsonResult ok(int code, String message) {
        return ok(code, message, null);
    }

    /**
     * 返回成功
     * 在该方法后链式调用put()方法，将会覆盖data，导致该方法中传入的data失效
     * 如果需要链式调用put()方式，请使用 {@link JsonResult#ok(int, String)}
     *
     * @param code
     * @param message
     * @param data
     * @return
     */
    public static JsonResult ok(int code, String message, Object data) {
        if (message == null) {
            message = DEFAULT_OK_MSG;
        }
        DATA_MAP = new HashMap<>();
        JSON_RESULT = new JsonResult();
        JSON_RESULT.setCode(code).setMsg(message);
        if (data != null) {
            JSON_RESULT.setData(data);
        }
        return JSON_RESULT;
    }

    /**
     * 添加自定义属性
     *
     * @param key
     * @param value
     * @return
     */
    public JsonResult put(String key, Object value) {
        DATA_MAP.put(key, value);
        JSON_RESULT.setData(DATA_MAP);
        return JSON_RESULT;
    }

    /**
     * 返回失败
     */
    public static JsonResult error() {
        return error(null);
    }

    /**
     * 返回失败
     */
    public static JsonResult error(String message) {
        return error(DEFAULT_ERROR_CODE, message);
    }

    /**
     * 返回失败
     */
    public static JsonResult error(int code, String message) {
        if (message == null) message = DEFAULT_ERROR_MSG;
        return ok(code, message);
    }

    public int getCode() {
        return code;
    }

    public JsonResult setCode(int code) {
        this.code = code;
        return this;
    }

    public String getMsg() {
        return msg;
    }

    public JsonResult setMsg(String msg) {
        this.msg = msg;
        return this;
    }

    public Object getData() {
        return data;
    }

    public JsonResult setData(Object data) {
        this.data = data;
        return this;
    }

}
