package com.cmdi.dims.domain;

import com.cmdi.dims.batch.*;
import org.apache.commons.lang3.ClassUtils;

import lombok.Getter;
//import xyz.yaxshi.dims.batch.*;

public enum TaskStatusEnum {

    UNKNOWN(-1, null, true),
    INITIALIZED(0, null, true),
    FILE_TRANSFER_SUCCESS(1, FileTransferTasklet.class, true),
    FILE_TRANSFER_FAILURE(2, FileTransferTasklet.class, false),
    FILE_PROCESS_SUCCESS(3, FileProcessTasklet.class, true),
    FILE_PROCESS_FAILURE(4, FileProcessTasklet.class, false),
    BUSINESS_ANALYSIS_SUCCESS(5, BusinessAnalysisGxTasklet.class, true),
    BUSINESS_ANALYSIS_FAILURE(6, BusinessAnalysisGxTasklet.class, false),
    FILE_COMPARE_SUCCESS(7, FileCompareTasklet.class, true),
    FILE_COMPARE_FAILURE(8, FileCompareTasklet.class, false),
    FILE_UPLOAD_SUCCESS(9, FileUploadTasklet.class, true),
    File_UPLOAD_FAILURE(10, FileUploadTasklet.class, false);
    @Getter
    private int value;
    @Getter
    private boolean success;
    @Getter
    private Class<?> clazz;

    TaskStatusEnum(int value, Class<?> clazz, boolean success) {
        this.value = value;
        this.clazz = clazz;
        this.success = success;
    }

    public static TaskStatusEnum resolve(Class<?> clazz, boolean success) {
        for (TaskStatusEnum status : TaskStatusEnum.values()) {
            if (null != status.clazz && status.success == success && ClassUtils.isAssignable(clazz, status.clazz)) {
                return status;
            }
        }
        return TaskStatusEnum.UNKNOWN;
    }
}
