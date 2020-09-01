package com.cmdi.dims.domain;

import java.util.List;

import com.cmdi.dims.sdk.model.IndexProcDto;
import com.cmdi.dims.sdk.model.MetadataDto;
import com.cmdi.dims.sdk.model.TaskConfigDto;

public interface MetaService {

    MetadataDto loadMetadata(String tableName, String specialityName);

    TaskConfigDto loadConfig(String province, String specialityName);

    List<String> loadAllTables();

    List<IndexProcDto> loadIndexProcBySpeciality(String speciality);

}
