package com.cmdi.dims.domain;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.cmdi.dims.sdk.model.IndexProcDto;
import com.cmdi.dims.sdk.model.MetadataDto;
import com.cmdi.dims.sdk.model.TaskItemIndexDto;

public interface DataService {

    int importData(MetadataDto metadata, List<Map<String, Object>> parameters);

    void cleanData(String table);

    void calculateIndex(String taskCode, String province, IndexProcDto procDto) throws SQLException;

    List<TaskItemIndexDto> loadCalculateIndexData(String taskCode);

    long countErrorData(MetadataDto metadata);

    List<Map<String, Object>> exportData(MetadataDto metadata, int limit, int offset);
}
