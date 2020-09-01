package com.cmdi.dims.domain.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
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

import lombok.extern.slf4j.Slf4j;
import com.cmdi.dims.domain.DataService;
import com.cmdi.dims.domain.util.DataUtil;
import com.cmdi.dims.sdk.model.IndexProcDto;
import com.cmdi.dims.sdk.model.MetadataDto;
import com.cmdi.dims.sdk.model.TaskItemIndexDto;

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
            connection.setAutoCommit(true);
            CallableStatement callableStatement = connection.prepareCall("{call " + procDto.getProcName() + "(?,?,?)}");
            callableStatement.setString(1, province);
            callableStatement.setString(2, taskCode);
            callableStatement.setInt(3, procDto.getIndexId());
            callableStatement.executeUpdate();
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

    @Transactional(propagation = Propagation.REQUIRES_NEW, timeout = 7200)
    @Override
    public void calculateIndex(Long taskId, IndexProcDto index) {
        if (null == index.getIndexType()) {
            log.error("undefined procedure for index: " + index.getIndexCode() + " - " + index.getIndexName());
            return;
        }
        Connection connection = null;
        boolean oldAutoCommit = false;
        try {
            connection = jdbcTemplate.getDataSource().getConnection();
            oldAutoCommit = connection.getAutoCommit();
            connection.setAutoCommit(true);
            CallableStatement callableStatement = null;
            switch (index.getIndexType()) {
                case 1:
                    callableStatement = connection.prepareCall("{call " + index.getProcName() + "(?,?)}");
                    callableStatement.setInt(1, taskId.intValue());
                    callableStatement.setString(2, index.getIndexCode());
                    callableStatement.executeUpdate();
                    break;
                case 2:
                    callableStatement = connection.prepareCall("{call proc_checkOneExtTableAssocIndex(?,?)}");
                    callableStatement.setInt(1, taskId.intValue());
                    callableStatement.setInt(2, index.getIndexId().intValue());
                    callableStatement.executeUpdate();
                    break;
                case 3:
                    callableStatement = connection.prepareCall("{call proc_checkIndexSet(?)}");
                    callableStatement.setInt(1, taskId.intValue());
                    callableStatement.executeUpdate();
                    break;
                case 4:
                    callableStatement = connection.prepareCall("{call proc_checkOneDictAccuracyIndex(?,?)}");
                    callableStatement.setInt(1, taskId.intValue());
                    callableStatement.setInt(2, index.getIndexId().intValue());
                    callableStatement.executeUpdate();
                    break;
                case 5:
                    callableStatement = connection.prepareCall("{call proc_checkOneMandatoryClassifiedIndex(?,?)}");
                    callableStatement.setInt(1, taskId.intValue());
                    callableStatement.setInt(2, index.getIndexId().intValue());
                    callableStatement.executeUpdate();
                    break;
                case 6:
                    callableStatement = connection.prepareCall("{call proc_checkOneCriticalNotNullIndex(?,?)}");
                    callableStatement.setInt(1, taskId.intValue());
                    callableStatement.setInt(2, index.getIndexId().intValue());
                    callableStatement.executeUpdate();
                    break;
                case 7:
                    callableStatement = connection.prepareCall("{call proc_checkOneCriticalAreaCodeIndex(?,?)}");
                    callableStatement.setInt(1, taskId.intValue());
                    callableStatement.setInt(2, index.getIndexId().intValue());
                    callableStatement.executeUpdate();
                    break;
                case 8:
                    callableStatement = connection.prepareCall("{call proc_checkOneCoordinateIndex(?,?)}");
                    callableStatement.setInt(1, taskId.intValue());
                    callableStatement.setInt(2, index.getIndexId().intValue());
                    callableStatement.executeUpdate();
                    break;
                case 9:
                    callableStatement = connection.prepareCall("{call proc_checkOneRepeatabilityIndex(?,?)}");
                    callableStatement.setInt(1, taskId.intValue());
                    callableStatement.setInt(2, index.getIndexId().intValue());
                    callableStatement.executeUpdate();
                    break;
                case 10:
                    callableStatement = connection.prepareCall("{call proc_checkOneRelationKeyIndex(?,?)}");
                    callableStatement.setInt(1, taskId.intValue());
                    callableStatement.setInt(2, index.getIndexId().intValue());
                    callableStatement.executeUpdate();
                    break;
                default:
                    log.error("undefined procedure for index: " + index.getIndexCode() + " - " + index.getIndexName());
                    break;
            }
        } catch (SQLException e) {
            if (null != connection) {
                try {
                    connection.rollback();
                } catch (Exception e1) {
                }
            }

            System.out.println(index.getIndexCode()+"核查规则报错");
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
        return jdbcTemplate.query("SELECT * FROM (SELECT A.* FROM dims_tm_taskitem_index A INNER JOIN dims_tm_areacodeconfig b ON A.provincecode = b.code AND b.regiontype = 1 AND A.regiontype IN ( 1, 2, 3 ) AND A.prefecturecode IS NULL AND A.countycode IS NULL UNION ALL SELECT A.* FROM dims_tm_taskitem_index A INNER JOIN dims_tm_areacodeconfig b ON A.provincecode = b.provincecode AND A.prefecturecode = b.code AND b.regiontype = 2 AND A.regiontype IN ( 2, 3 ) AND A.countycode IS NULL UNION ALL SELECT A.* FROM dims_tm_taskitem_index A INNER JOIN dims_tm_areacodeconfig b ON A.provincecode = b.provincecode AND A.prefecturecode = b.code AND A.countycode = b.code AND b.regiontype = 3 AND A.regiontype = 3) T WHERE taskCode=? ORDER BY regiontype, code", new Object[]{taskCode}, new BeanPropertyRowMapper<>(TaskItemIndexDto.class));
    }

    @Override
    public List<TaskItemIndexDto> loadCalculateIndexData(long taskId) {
        return jdbcTemplate.query("SELECT * FROM dims_tm_taskitem_index WHERE task_id=?", new Object[]{taskId}, new BeanPropertyRowMapper<>(TaskItemIndexDto.class));
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW, timeout = 7200)
    @Override
    public void insertDefaultTask(long taskId, String province, Date startTime) {
        jdbcTemplate.execute("INSERT INTO dims_tm_task(id, starttime, province) VALUES(" + taskId + ",'" + new DateTime(startTime).toString("yyyy-MM-dd") + "','" + province + "')");
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
