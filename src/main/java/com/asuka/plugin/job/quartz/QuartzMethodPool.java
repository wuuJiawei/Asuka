package com.asuka.plugin.job.quartz;

import org.springframework.util.StringUtils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/5/11
 */
public class QuartzMethodPool {

    private static ConcurrentHashMap<String, PoolObject> methodMap = new ConcurrentHashMap<>();

    public static PoolObject get(String jobUniqueId) {
        return methodMap.get(jobUniqueId);
    }

    public static synchronized void put(String jobUniqueId, String parameter, Method method, Object object) {
        PoolObject poolObject = new PoolObject();
        poolObject.setMethod(method);
        poolObject.setObject(object);
        poolObject.setParameter(parameter);
        methodMap.put(jobUniqueId, poolObject);
    }

    public static synchronized boolean invoke(String jobUniqueId) throws InvocationTargetException, IllegalAccessException {
        PoolObject poolObject = get(jobUniqueId);
        if (poolObject == null) {
            return false;
        }
        invoke(poolObject.getObject(), poolObject.getMethod(), poolObject.getParameter());
        return true;
    }

    public static synchronized void invoke(Object object, Method method, String parameter) throws InvocationTargetException, IllegalAccessException {
        if (StringUtils.isEmpty(parameter)) {
            method.invoke(object);
        } else {
            method.invoke(object, parameter);
        }
    }

    private static class PoolObject {
        Method method;
        Object object;
        String parameter;

        public Method getMethod() {
            return method;
        }

        public void setMethod(Method method) {
            this.method = method;
        }

        public Object getObject() {
            return object;
        }

        public void setObject(Object object) {
            this.object = object;
        }

        public String getParameter() {
            return parameter;
        }

        public void setParameter(String parameter) {
            this.parameter = parameter;
        }
    }


}
