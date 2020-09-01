package com.cmdi.dims.domain.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmdi.dims.domain.MetaService;
import com.cmdi.dims.sdk.api.MetaRestApi;
import com.cmdi.dims.sdk.model.IndexProcDto;
import com.cmdi.dims.sdk.model.MetadataDto;
import com.cmdi.dims.sdk.model.TaskConfigDto;

@Service
public class MetaServiceImpl implements MetaService {

    @Autowired
    private MetaRestApi metaRestApi;

    @Override
    public MetadataDto loadMetadata(String tableName, String specialityName) {
        return metaRestApi.loadMetadataUsingGET(specialityName, tableName).getData();
    }

    @Override
    public TaskConfigDto loadConfig(String province, String specialityName) {
        return metaRestApi.loadConfigUsingGET(province, specialityName).getData();
    }

    @Override
    public List<String> loadAllTables() {
        return metaRestApi.loadAllTablesUsingGET().getData();
    }

    @Override
    public List<IndexProcDto> loadIndexProcBySpeciality(String speciality) {
        return metaRestApi.loadIndexProcBySpecialityUsingGET(speciality).getData();
    }
}
