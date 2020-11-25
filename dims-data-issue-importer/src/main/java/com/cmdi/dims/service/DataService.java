package com.cmdi.dims.service;

import com.cmdi.dims.service.vo.FileLocationVo;
import com.cmdi.dims.service.vo.TaskVo;

import java.util.List;
import java.util.Map;

public interface DataService {

    TaskVo getTask(String province, String speciality);

    List<FileLocationVo> getFileLocation(String province, String speciality);

    void saveColumn(String taskCode, String speciality, String table, String columns);

    void cleanColumns(String taskCode);

    Map<String, String> getIndexName(String speciality);

    void saveStorage(List<Map<String, Object>> indices, List<Map<String, Object>> storages);

    void cleanStorage(String taskCode);

    Double getIndexValue(String province,String taskCode) ;
    String getRemotePath(String taskCode) ;
    String getRemotePath(String taskCode,FileLocationVo curLocation) ;
}
