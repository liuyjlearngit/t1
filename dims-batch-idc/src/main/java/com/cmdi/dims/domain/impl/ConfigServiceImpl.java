package com.cmdi.dims.domain.impl;

import com.cmdi.dims.domain.ConfigService;
import com.cmdi.dims.sdk.api.ConfigRestApi;
import com.cmdi.dims.sdk.model.TaskConfigDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConfigServiceImpl implements ConfigService {

    @Autowired
    private ConfigRestApi configRestApi;

    @Override
    public TaskConfigDto loadConfig(String province, String specialityName) {
        return configRestApi.loadConfigUsingGET(province, specialityName).getData();
    }
}
