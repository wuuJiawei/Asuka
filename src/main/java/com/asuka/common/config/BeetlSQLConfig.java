package com.asuka.common.config;

import com.ibeetl.starter.BeetlSqlProperties;
import com.zaxxer.hikari.HikariDataSource;
import org.beetl.core.fun.ObjectUtil;
import org.beetl.sql.core.ClasspathLoader;
import org.beetl.sql.core.Interceptor;
import org.beetl.sql.core.NameConversion;
import org.beetl.sql.core.db.DBStyle;
import org.beetl.sql.ext.DebugInterceptor;
import org.beetl.sql.ext.SimpleCacheInterceptor;
import org.beetl.sql.ext.spring4.BeetlSqlDataSource;
import org.beetl.sql.ext.spring4.SqlManagerFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

/**
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/7/2
 */
@Configuration
public class BeetlSQLConfig {

    /**
     * 数据源
     * @param env
     * @return
     */
    @Bean
    public DataSource masterDataSource(Environment env) {
        HikariDataSource ds = new HikariDataSource();
        ds.setJdbcUrl(env.getProperty("spring.datasource.master.url"));
        ds.setUsername(env.getProperty("spring.datasource.master.username"));
        ds.setPassword(env.getProperty("spring.datasource.master.password"));
        ds.setDriverClassName(env.getProperty("spring.datasource.master.driver-class-name"));
        return ds;
    }

    /**
     * 创建BeetlSql数据源配置
     * @param env
     * @return
     */
    @Bean
    public BeetlSqlDataSource beetlSqlDataSource(Environment env) {
        BeetlSqlDataSource source = new BeetlSqlDataSource();
        source.setMasterSource(masterDataSource(env));
        return source;
    }

    /**
     * BeetlSQL自带缓存配置
     * 使用Map进行缓存，当出现更新操作时，将会清除整个namespace中的缓存
     *
     * @return
     */
    public SimpleCacheInterceptor simpleCacheInterceptor() {
        List<String> namespaces = new ArrayList<>();
        namespaces.add("system.menu");
        namespaces.add("system.userRole");
        return new SimpleCacheInterceptor(namespaces);
    }

    @Bean(name = "sqlManagerFactoryBean")
    public SqlManagerFactoryBean sqlManagerFactoryBean(Environment env) throws Exception {

        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        if (classLoader == null) {
            classLoader = this.getClass().getClassLoader();
        }

        BeetlSqlProperties beetlSqlProperties = new BeetlSqlProperties(env);
        SqlManagerFactoryBean factory = new SqlManagerFactoryBean();

        // 拦截器
        boolean dev = beetlSqlProperties.getDev();
        List<Interceptor> interceptorList = new ArrayList<>();
        if (dev) {
            interceptorList.add(new DebugInterceptor());
        }
//        interceptorList.add(simpleCacheInterceptor());
        interceptorList.add(new CacheInterceptor());
        factory.setInterceptors(interceptorList.toArray(new Interceptor[interceptorList.size()]));

        // 数据源
        factory.setCs(beetlSqlDataSource(env));

        // 数据库类型
        factory.setDbStyle((DBStyle) ObjectUtil.tryInstance(beetlSqlProperties.getDbStyle(), classLoader));

        // 命名转换
        factory.setNc((NameConversion) ObjectUtil.tryInstance(beetlSqlProperties.getNameConversion(), classLoader));

        // 加载sql路径
        ClasspathLoader loader = new ClasspathLoader(beetlSqlProperties.getSqlPath());
        factory.setSqlLoader(loader);

        // 其他配置
        Properties ps = new Properties();
        ps.put("PRODUCT_MODE", dev ? "false" : "true");
        factory.setExtProperties(ps);

        return factory;
    }



}
