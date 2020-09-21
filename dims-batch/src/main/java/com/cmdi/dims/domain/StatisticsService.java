package com.cmdi.dims.domain;

import com.cmdi.dims.domain.entity.StatisticsResIndex;
import com.cmdi.dims.sdk.model.ResStatisticsDto;

import java.sql.SQLException;
import java.util.List;

public interface StatisticsService {
    List<StatisticsResIndex> loadResIndexProcBySpeciality(String speciality);

    void calculateResIndex(String taskCode, String province, StatisticsResIndex procDto) throws SQLException;

    List<ResStatisticsDto> loadCalculateResIndexData(String taskCode);

    void saveResStatistics(List<ResStatisticsDto> data);
}
