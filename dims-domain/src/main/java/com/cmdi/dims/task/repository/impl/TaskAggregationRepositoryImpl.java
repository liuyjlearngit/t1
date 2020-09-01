package com.cmdi.dims.task.repository.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import com.cmdi.dims.task.dto.TaskItemFileAggregationDto;
import com.cmdi.dims.task.repository.TaskAggregationRepository;

@Component
public class TaskAggregationRepositoryImpl implements TaskAggregationRepository {

    @Autowired
    NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public List<TaskItemFileAggregationDto> findTaskItemFileAggregations() {
        String statement = "SELECT taskcode," +
                " SUM(filesize) AS totalFileSize," +
                " SUM(filegettingcosts) AS totalCosts," +
                " COUNT(1) AS totalRecordNum," +
                " SUM(issuccessful) AS successRecordNum" +
                " FROM dims_tm_taskitem_file" +
                " group by taskcode" +
                " order by taskcode asc" +
                " limit 30;";
        return namedParameterJdbcTemplate.query(statement, new BeanPropertyRowMapper<>(TaskItemFileAggregationDto.class));
    }
}
