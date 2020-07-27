package com.asuka.common.config;

import com.alibaba.fastjson.JSON;
import net.sf.jsqlparser.JSQLParserException;
import net.sf.jsqlparser.parser.CCJSqlParserUtil;
import net.sf.jsqlparser.statement.Statement;
import net.sf.jsqlparser.util.TablesNamesFinder;
import org.beetl.sql.core.Interceptor;
import org.beetl.sql.core.InterceptorContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * BeetlSql缓存
 * 使用Redis作为缓存
 *
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/7/12
 */
public class RedisCacheInterceptor implements Interceptor {

    public static final String CACHE_KEY = "beetlsql";

    private final RedisTemplate<String, Object> redisTemplate;

    public RedisCacheInterceptor(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    private static Logger log = LoggerFactory.getLogger(RedisCacheInterceptor.class);

    @Override
    public void before(InterceptorContext ctx) {
        boolean cacheHit = false;
        Object cacheHitResult = null;
        String tableName = getTableName(ctx.getSql());
        String tableCacheKey = CACHE_KEY + ":" + tableName;
        ctx.put("cache.key", tableCacheKey);

        if (ctx.isUpdate()) {
            return;
        }

        if (redisTemplate.hasKey(tableCacheKey) == Boolean.TRUE) {
            Object resultObj = redisTemplate.opsForHash().get(tableCacheKey, getSqlConcatParam(ctx));
            if (resultObj != null) {
//                List<Object> objects = JSON.parseArray((String)resultObj, Object.class);
//                cacheHitResult = objects.get(1);
                cacheHit = true;
                cacheHitResult = resultObj;
            }
        }

        // 命中缓存
        if (cacheHit) {
            log.debug("cache[{}] hit!", tableCacheKey);
            ctx.setResult(cacheHitResult);
        }
        ctx.put("cache.hit", cacheHit);
    }

    @Override
    public void after(InterceptorContext ctx) {
        String cacheKey = (String) ctx.get("cache.key");
        if (ctx.isUpdate()) {
            if (!StringUtils.isEmpty(cacheKey)) {
                redisTemplate.delete(cacheKey);
            }
        } else {
            boolean hit = (Boolean) ctx.get("cache.hit");
            if (!hit) {
                redisTemplate.opsForHash().put(cacheKey, getSqlConcatParam(ctx), ctx.getResult());
            }
        }
    }

    @Override
    public void exception(InterceptorContext ctx, Exception ex) {
        log.error(ctx.getSql());
    }

    private String getTableName(String sql) {
        String tableSql = "";
        try {
            Statement statement = CCJSqlParserUtil.parse(sql);
            TablesNamesFinder tablesNamesFinder = new TablesNamesFinder();
            List<String> tableList = tablesNamesFinder.getTableList(statement);
            if (tableList != null && tableList.size() > 0) {
                tableSql = tableList.get(0);
            }
        } catch (JSQLParserException e) {
            e.printStackTrace();
        }
        tableSql = tableSql.replaceAll("[`\\t\\n]*", "");
        return tableSql;
    }

    private String getSqlConcatParam(InterceptorContext ctx) {
        StringBuffer stringBuffer = new StringBuffer(ctx.getSql());
        ctx.getParas().forEach(x -> {
            stringBuffer.append(":").append(x.value);
        });
        return stringBuffer.toString();
    }

    private String getResult(Object result) {
        Object[] arr = new Object[2];
        arr[0] = result.getClass();
        arr[1] = result;
        return JSON.toJSONString(arr);
    }

}
