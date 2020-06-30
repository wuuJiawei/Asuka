package com.asuka.common.core.config;

import com.zaxxer.hikari.HikariDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

import javax.sql.DataSource;

/**
 * 数据源配置
 * 支持多个数据源
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/6/30
 */
@Configuration
public class DataSourceConfig {

    @Bean
    public DataSource masterDataSource(Environment env) {
        HikariDataSource ds = new HikariDataSource();
        ds.setJdbcUrl(env.getProperty("spring.datasource.master.url"));
        ds.setUsername(env.getProperty("spring.datasource.master.username"));
        ds.setPassword(env.getProperty("spring.datasource.master.password"));
        ds.setDriverClassName(env.getProperty("spring.datasource.master.driver-class-name"));
        return ds;
    }

}
