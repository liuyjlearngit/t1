package com.cmdi.dims.domain;

import com.cmdi.dims.sdk.model.TaskConfigDto;

public interface ConfigService {

    TaskConfigDto loadConfig(String province, String specialityName);
}
