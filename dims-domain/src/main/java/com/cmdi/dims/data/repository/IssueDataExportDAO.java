package com.cmdi.dims.data.repository;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * @author Administrator
 */
@Repository
public class IssueDataExportDAO {


    @Autowired
    JdbcTemplate jdbcTemplate;


    /**
     * 导出错误数据
     * @param executeSql
     * @return
     */
    public List<String> batchExport(String executeSql) {


        List<String> errorData = jdbcTemplate.query(executeSql, new RowMapper<String>() {
            @Override
            public String mapRow(ResultSet resultSet, int i) throws SQLException {
                return resultSet.getString("data");
            }
        });

        return errorData;
    }

    /**
     * 找出规则id的表名
     * @param executeSql
     * @return
     */
    public List<String> queryTableName(String executeSql) {
        List<String> tableName = jdbcTemplate.query(executeSql, new RowMapper<String>() {
            @Override
            public String mapRow(ResultSet resultSet, int i) throws SQLException {
                return resultSet.getString("table_name");
            }
        });
            return  tableName;
    }



}
