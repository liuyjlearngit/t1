package com.cmdi.dims.task.serivce;

import com.cmdi.dims.task.dto.IndexProcDto;
import com.cmdi.dims.task.dto.TaskConfigDto;
import com.cmdi.dims.task.entity.TaskConfig;

import java.util.List;

public interface MetaService {

    TaskConfigDto loadConfig(String province, String specialityName);

    TaskConfig findTaskConfigByTaskConfigId(Long taskConfigId);

    List<IndexProcDto> loadIndexProcBySpeciality(String speciality);

}
