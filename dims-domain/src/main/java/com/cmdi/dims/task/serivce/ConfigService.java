package com.cmdi.dims.task.serivce;

import com.cmdi.dims.task.dto.TaskConfigDto;
import com.cmdi.dims.task.entity.TaskConfig;

public interface ConfigService {

    TaskConfigDto loadConfig(String province, String specialityName);

    TaskConfig findTaskConfigByTaskConfigId(Long taskConfigId);

}
