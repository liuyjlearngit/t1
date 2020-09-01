package com.cmdi.dims.domain;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.cmdi.dims.sdk.model.IndexProcDto;
import com.cmdi.dims.sdk.model.MetadataDto;
import com.cmdi.dims.sdk.model.TaskItemIndexDto;

public interface DataService {

    int importData(MetadataDto metadata, List<Map<String, Object>> parameters);

    void cleanData(String table);

    void calculateIndex(String taskCode, String province, IndexProcDto procDto) throws SQLException;

    void calculateIndex(Long taskId, IndexProcDto index) throws SQLException;

    List<TaskItemIndexDto> loadCalculateIndexData(String taskCode);

    List<TaskItemIndexDto> loadCalculateIndexData(long taskId);

    void insertDefaultTask(long taskId, String province, Date startTime);

    long countErrorData(MetadataDto metadata);

    List<Map<String, Object>> exportData(MetadataDto metadata, int limit, int offset);
}
