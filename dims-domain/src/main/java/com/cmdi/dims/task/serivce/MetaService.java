package com.cmdi.dims.task.serivce;

import java.util.List;

import com.cmdi.dims.task.dto.IndexProcDto;
import com.cmdi.dims.task.dto.MetadataDto;
import com.cmdi.dims.task.dto.TaskConfigDto;
import com.cmdi.dims.task.entity.TaskConfig;

public interface MetaService {

    MetadataDto loadMetadata(String tableName, String specialityName);

    TaskConfigDto loadConfig(String province, String specialityName);

    List<String> loadAllTables();

    TaskConfig findTaskConfigByTaskConfigId(Long taskConfigId);

    TaskConfig findTaskConfigByProvinceAndSpecialityName(String province, String specialityName);

    List<IndexProcDto> loadIndexProcBySpeciality(String speciality);

}
