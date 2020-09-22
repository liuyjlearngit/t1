package com.cmdi.dims.domain;

import com.cmdi.dims.domain.meta.dto.Index;
import com.cmdi.dims.domain.meta.dto.Metadata;
import com.cmdi.dims.sdk.model.TaskItemIndexDto;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface DataService {

    Metadata loadMetadata(String tableName);

    List<Index> loadIndices(String speciality);

    Map<String, String> loadTables(List<String> specialities);

    int importData(Metadata metadata, List<Map<String, Object>> parameters);

    void cleanData(String table);

    void calculateIndex(String taskCode, String province, Index index) throws SQLException;

    List<TaskItemIndexDto> loadCalculateIndexData(String taskCode);

    long countErrorData(Metadata metadata);

    List<Map<String, Object>> exportData(Metadata metadata, int limit, int offset);
}
