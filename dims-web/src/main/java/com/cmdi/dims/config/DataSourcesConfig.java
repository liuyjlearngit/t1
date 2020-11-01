package com.cmdi.dims.config;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;

@Configuration
public class DataSourcesConfig {
    /**
     * 第一个数据连接，默认优先级最高
     * @return
     */
    @Primary
    @Bean(name = "primaryDataSource")
    @Qualifier("primaryDataSource")
    @ConfigurationProperties(prefix="spring.datasource.primary")
    public DataSource PrimaryDataSource() {
        //return DataSourceBuilder.create().type(DruidDataSource.class).build();
        return DataSourceBuilder.create().build();
    }

    /**
     * 第二个数据源
     * @return
     */
    @Bean(name = "secondDataSource")
    @Qualifier("secondDataSource")
    @ConfigurationProperties(prefix="spring.datasource.second")
    public DataSource secondaryDataSource() {
        //return DataSourceBuilder.create().type(DruidDataSource.class).build();
        return DataSourceBuilder.create().build();
    }

    /**
     * 配置第二个数据源操作对象
     * @param dataSource
     * @return
     */
    @Bean(name = "secondJdbcTemplate")
    public JdbcTemplate secondaryJdbcTemplate(@Qualifier("secondDataSource") DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }
}
