package com.cmdi.dims.data.service;


import org.springframework.stereotype.Service;

import java.io.IOException;

/**
 * @author Administrator
 */
@Service
public interface IssueDataExportService {
     String  batchExport(String province, String speciality, String regionCode, String[] rulecodes) throws Exception;

    String  export(String province, String speciality, String regionCode, String regionField, String taskCode) throws IOException, Exception;
}
