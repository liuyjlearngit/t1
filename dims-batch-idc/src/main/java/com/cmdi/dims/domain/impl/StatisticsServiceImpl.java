package com.cmdi.dims.domain.impl;

import com.cmdi.dims.domain.StatisticsService;
import com.cmdi.dims.domain.entity.StatisticsResIndex;
import com.cmdi.dims.sdk.api.TaskRestApi;
import com.cmdi.dims.sdk.model.ResStatisticsDto;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@Slf4j
@Service
public class StatisticsServiceImpl implements StatisticsService {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private TaskRestApi taskRestApi;

    @Override
    public List<StatisticsResIndex> loadResIndexProcBySpeciality(String speciality) {
        return jdbcTemplate.query("SELECT id,name,procName FROM dims_tm_res_index WHERE specialityName=? and isEnable=1",
                new Object[]{speciality},
                new BeanPropertyRowMapper<>(StatisticsResIndex.class));
    }
    @Transactional(propagation = Propagation.REQUIRES_NEW, timeout = 7200)
    @Override
    public void calculateResIndex(String taskCode, String province, StatisticsResIndex procDto) {
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
            callableStatement.setInt(3, procDto.getId());
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
    public List<ResStatisticsDto> loadCalculateResIndexData(String taskCode) {
        return  jdbcTemplate.query("SELECT * FROM dims_tm_res_statistics WHERE taskCode=? ",
                new Object[]{taskCode}, new BeanPropertyRowMapper<>(ResStatisticsDto.class));
    }

    @Override
    public void saveResStatistics(List<ResStatisticsDto> data) {
        taskRestApi.saveResStatisticsUsingPOST(data);
    }
}
