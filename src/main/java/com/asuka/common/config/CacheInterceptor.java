package com.asuka.common.config;

import cn.hutool.cache.impl.LFUCache;
import net.sf.jsqlparser.JSQLParserException;
import net.sf.jsqlparser.parser.CCJSqlParserUtil;
import net.sf.jsqlparser.statement.Statement;
import net.sf.jsqlparser.util.TablesNamesFinder;
import org.beetl.sql.core.Interceptor;
import org.beetl.sql.core.InterceptorContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * BeetlSql缓存
 * 缓存策略：LFU(least frequently used)最少使用率
 * 缓存充满时清理使用率最少的数据
 *
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/7/2
 */
public class CacheInterceptor implements Interceptor {

    public CacheInterceptor() {
    }

    private static Logger log = LoggerFactory.getLogger(CacheInterceptor.class);

    private static LFUCache<String, LFUCache<String, Object>> lfuCache = new LFUCache<>(80);

    @Override
    public void before(InterceptorContext ctx) {
        boolean cacheHit = false;
        Object cacheHitResult = null;
        String tableSql = getTableSql(ctx.getSql());
        ctx.put("cache.key", tableSql);

        if (ctx.isUpdate()) {
            return;
        }

        if (lfuCache.containsKey(tableSql)) {
            LFUCache<String, Object> sqlCache = lfuCache.get(tableSql);
            if (sqlCache.containsKey(ctx.getSql())) {
                cacheHitResult = sqlCache.get(ctx.getSql());
                cacheHit = true;
            }
        }

        // 命中缓存
        if (cacheHit) {
            log.debug("cache[{}] hit!", tableSql);
            ctx.setResult(cacheHitResult);
        }
        ctx.put("cache.hit", cacheHit);
    }

    @Override
    public void after(InterceptorContext ctx) {
        String cacheKey = (String) ctx.get("cache.key");
        if (ctx.isUpdate()) {
            if (!StringUtils.isEmpty(cacheKey)) {
                lfuCache.remove(cacheKey);
                log.debug("cache[{}] cleared!", cacheKey);
            }
        } else {
            boolean hit = (Boolean) ctx.get("cache.hit");
            if (!hit) {
                // 检查有无table cache
                if (lfuCache.containsKey(cacheKey)) {
                    lfuCache.get(cacheKey).put(ctx.getSql(), ctx.getResult());
                } else {
                    // 创建table cache
                    LFUCache<String, Object> sqlCache = new LFUCache<>(40);
                    sqlCache.put(ctx.getSql(), ctx.getResult());
                    lfuCache.put(cacheKey, sqlCache);
                }
            }
        }
    }

    @Override
    public void exception(InterceptorContext ctx, Exception ex) {
        log.error(ctx.getSql());
    }

    private String getTableSql(String sql) {
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

    public static void main(String[] args) throws JSQLParserException {
        String sql = "delete from `sys_user` where id = 1";
        Statement statement = CCJSqlParserUtil.parse(sql);
        TablesNamesFinder tablesNamesFinder = new TablesNamesFinder();
        List<String> tableList = tablesNamesFinder.getTableList(statement);
        tableList.forEach(x -> System.out.println(x));
    }
}
