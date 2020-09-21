package com.cmdi.dims.domain.impl;

import com.cmdi.dims.domain.DataService;
import com.cmdi.dims.domain.util.DataUtil;
import com.cmdi.dims.sdk.model.IndexProcDto;
import com.cmdi.dims.sdk.model.MetadataDto;
import com.cmdi.dims.sdk.model.TaskItemIndexDto;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.ColumnMapRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class DataServiceImpl implements DataService {

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public int importData(MetadataDto metadata, List<Map<String, Object>> parameters) {
        int length = parameters.size();
        SqlParameterSource[] sqlParameterSources = new SqlParameterSource[length];
        for (int i = 0; i < length; i++) {
            sqlParameterSources[i] = new MapSqlParameterSource(parameters.get(i));
        }
        int[] result = namedParameterJdbcTemplate.batchUpdate(DataUtil.insertDataStatement(metadata), sqlParameterSources);
        int total = 0;
        if (null != result) {
            for (int r : result) {
                total += r;
            }
        }
        return total;
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public void cleanData(String table) {
        namedParameterJdbcTemplate.update(DataUtil.cleanDataStatement(table), new HashMap<>());
    }
    //TODO 核查空间数据时，已经超过7200ms了，为什么没有报错
    @Transactional(propagation = Propagation.REQUIRES_NEW, timeout = 7200)
    @Override
    public void calculateIndex(String taskCode, String province, IndexProcDto procDto) {
        if (StringUtils.isEmpty(procDto.getProcName())) {
            return;
        }
        Connection connection = null;
        boolean oldAutoCommit = false;
        try {
            connection = jdbcTemplate.getDataSource().getConnection();
            oldAutoCommit = connection.getAutoCommit();
            connection.setAutoCommit(false);
            CallableStatement callableStatement = connection.prepareCall("{call " + procDto.getProcName() + "(?,?,?)}");
            callableStatement.setString(1, province);
            callableStatement.setString(2, taskCode);
            callableStatement.setInt(3, procDto.getIndexId());
            callableStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            if (null != connection) {
                try {
                    connection.rollback();
                } catch (Exception e1) {
                }
            }
            throw new RuntimeException(e);
        } finally {
            if (null != connection) {
                try {
                    connection.setAutoCommit(oldAutoCommit);
                    connection.close();
                } catch (Exception e1) {
                }
            }
        }
    }

    @Override
    public List<TaskItemIndexDto> loadCalculateIndexData(String taskCode) {
        return jdbcTemplate.query("SELECT * FROM (SELECT A.* FROM dims_tm_taskitem_index A INNER JOIN dims_tm_areacodeconfig b ON A.provincecode = b.code AND b.regiontype = 1 AND A.regiontype IN ( 1, 2, 3 ) AND A.prefecturecode IS NULL AND A.countycode IS NULL UNION ALL SELECT A.* FROM dims_tm_taskitem_index A INNER JOIN dims_tm_areacodeconfig b ON A.provincecode = b.provincecode AND A.prefecturecode = b.code AND b.regiontype = 2 AND A.regiontype IN ( 2, 3 ) AND A.countycode IS NULL UNION ALL SELECT A.* FROM dims_tm_taskitem_index A INNER JOIN dims_tm_areacodeconfig b ON A.provincecode = b.provincecode AND A.prefecturecode = b.prefecturecode AND A.countycode = b.code AND b.regiontype = 3 AND A.regiontype = 3) T WHERE taskCode=? ORDER BY regiontype, code", new Object[]{taskCode}, new BeanPropertyRowMapper<>(TaskItemIndexDto.class));
    }

    @Override
    public long countErrorData(MetadataDto metadata) {
        return jdbcTemplate.queryForObject(DataUtil.countErrorDataStatement(metadata), Long.class);
    }

    @Override
    public List<Map<String, Object>> exportData(MetadataDto metadata, int limit, int offset) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("LIMIT", limit);
        parameters.put("OFFSET", offset);
        return namedParameterJdbcTemplate.query(DataUtil.selectErrorDataStatement(metadata), parameters, new ColumnMapRowMapper());
    }
}
