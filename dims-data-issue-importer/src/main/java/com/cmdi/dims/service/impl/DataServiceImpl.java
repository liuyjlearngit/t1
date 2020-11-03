package com.cmdi.dims.service.impl;

import com.cmdi.dims.service.DataService;
import com.cmdi.dims.service.vo.FileLocationVo;
import com.cmdi.dims.service.vo.TaskVo;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class DataServiceImpl implements DataService {

    @Autowired
    private NamedParameterJdbcTemplate jdbcTemplate;

    @Override
    public TaskVo getTask(String province, String speciality) {
        String statement = "SELECT * FROM dims_tm_task WHERE code IN (SELECT taskcode FROM dims_tm_task_latest WHERE province=:province AND specialityname=:speciality)";
        Map<String, Object> parameter = new HashMap<>();
        parameter.put("province", province);
        parameter.put("speciality", speciality);
        return jdbcTemplate.queryForList(statement, parameter)
                .stream().map(TaskVo::new).findFirst().orElse(null);
    }

    @Override
    public List<FileLocationVo> getFileLocation(String province, String speciality) {
        String statement = "SELECT * FROM dims_tm_filelocation WHERE province=:province AND specialityName=:speciality";
        Map<String, Object> parameter = new HashMap<>();
        parameter.put("province", province);
        parameter.put("speciality", speciality);
        return jdbcTemplate.queryForList(statement, parameter)
                .stream().map(FileLocationVo::new).collect(Collectors.toList());
    }

    @Override
    public void cleanColumns(String taskCode) {
        String statement = "DELETE FROM dims_data_column WHERE task_code=:taskCode";
        Map<String, Object> parameter = new HashMap<>();
        parameter.put("taskCode", taskCode);
        jdbcTemplate.update(statement, parameter);
    }

    @Override
    public void saveColumn(String taskCode, String speciality, String table, String columns) {
        String statement = "INSERT INTO dims_data_column(speciality_name, table_name, task_code, columns, created_at) VALUES(:speciality, :table, :taskCode, :columns, NOW())";
        Map<String, Object> parameter = new HashMap<>();
        parameter.put("taskCode", taskCode);
        parameter.put("speciality", speciality);
        parameter.put("table", table);
        parameter.put("columns", columns);
        jdbcTemplate.update(statement, parameter);
    }


    @Override
    public Map<String, String> getIndexName(String speciality) {
        String statement = "SELECT code, name FROM dims_idx_index WHERE specialityname=:speciality";
        Map<String, Object> parameter = new HashMap<>();
        parameter.put("speciality", speciality);
        List<Map<String, Object>> result = jdbcTemplate.queryForList(statement, parameter);
        return result.stream().collect(Collectors.toMap(k -> String.valueOf(k.get("code")), v -> String.valueOf(v.get("name"))));
    }

    @Override
    public void saveStorage(List<Map<String, Object>> indices, List<Map<String, Object>> storages) {
        if (CollectionUtils.isNotEmpty(indices)) {
            this.saveIndices(indices);
        }
        if (CollectionUtils.isNotEmpty(storages)) {
            this.saveStorage(storages);
        }
    }

    @Override
    public void cleanStorage(String taskCode) {
        Map<String, Object> parameter = new HashMap<>();
        parameter.put("taskCode", taskCode);
        jdbcTemplate.update("DELETE FROM dims_data_index WHERE task_code=:taskCode", parameter);
        jdbcTemplate.update("DELETE FROM dims_data_storage WHERE task_code=:taskCode", parameter);
    }

    @Override
    public Double getIndexValue(String province,String taskCode) {
        String statement = "SELECT indexvalue from dims_tm_taskitem_index where provincecode=:province AND taskcode=:taskCode order by code desc limit 1";
        Map<String, Object> parameter = new HashMap<>();
        parameter.put("taskCode", taskCode);
        parameter.put("province", province);
        Double indexValue = jdbcTemplate.queryForObject(statement,parameter,java.lang.Double.class);
        return indexValue*100;
    }

    @Override
    public String getRemotePath(String taskCode) {
        String statement = "SELECT code from dims_tm_taskitem_file where taskcode=:taskCode limit 1";
        Map<String, Object> parameter = new HashMap<>();
        parameter.put("taskCode", taskCode);
        String path = jdbcTemplate.queryForObject(statement,parameter,java.lang.String.class);
        return StringUtils.substringBeforeLast(path,"/");
    }

    public void saveStorage(List<Map<String, Object>> storages) {
        SqlParameterSource[] sqlParameterSources = new SqlParameterSource[storages.size()];
        for (int i = 0; i < storages.size(); i++) {
            sqlParameterSources[i] = new MapSqlParameterSource(storages.get(i));
        }
        String statement = "INSERT INTO dims_data_storage(task_code, data_key, speciality_name, table_name, province_code, prefecture_code, county_code, data, created_at) " +
                "VALUES (:taskCode, :dataKey, :speciality, :table, :province, :prefecture, :county, :data, NOW());";
        int[] result = jdbcTemplate.batchUpdate(statement, sqlParameterSources);
    }


    private void saveIndices(List<Map<String, Object>> indices) {
        SqlParameterSource[] sqlParameterSources = new SqlParameterSource[indices.size()];
        for (int i = 0; i < indices.size(); i++) {
            sqlParameterSources[i] = new MapSqlParameterSource(indices.get(i));
        }
        String statement = "INSERT INTO dims_data_index(index_code, index_name, province_code, prefecture_code, county_code, created_at, speciality_name, table_name, data_key, task_code) " +
                "VALUES (:indexCode, :indexName, :province, :prefecture, :county, NOW(), :speciality, :table, :dataKey, :taskCode);";
        int[] result = jdbcTemplate.batchUpdate(statement, sqlParameterSources);
    }
}
