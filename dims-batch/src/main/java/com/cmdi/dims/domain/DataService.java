package com.cmdi.dims.domain;

import com.cmdi.dims.domain.meta.dto.Index;
import com.cmdi.dims.domain.meta.dto.MetadataDto;
import com.cmdi.dims.sdk.model.TaskItemIndexDto;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface DataService {

    MetadataDto loadMetadata(String tableName);

    List<Index> loadIndices(String speciality);

    Map<String, String> loadTables(List<String> specialities);

    int importData(MetadataDto metadata, List<Map<String, Object>> parameters);

    void cleanData(String table);

    void calculateIndex(String taskCode, String province, Index index) throws SQLException;

    List<TaskItemIndexDto> loadCalculateIndexData(String taskCode);

    long countErrorData(MetadataDto metadata);

    List<Map<String, Object>> exportData(MetadataDto metadata, int limit, int offset);
}
