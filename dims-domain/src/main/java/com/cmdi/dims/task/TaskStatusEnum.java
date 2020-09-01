package com.cmdi.dims.task;

import java.util.Objects;

import lombok.Getter;

public enum TaskStatusEnum {

    UNKNOWN(-1, null, true),
    INITIALIZED(0, null, true),
    FILE_TRANSFER_SUCCESS(1, "", true),
    FILE_TRANSFER_FAILURE(2, "", false),
    FILE_PROCESS_SUCCESS(3, "", true),
    FILE_PROCESS_FAILURE(4, "", false),
    BUSINESS_ANALYSIS_SUCCESS(5, "", true),
    BUSINESS_ANALYSIS_FAILURE(6, "", false),
    FILE_COMPARE_SUCCESS(7, "", true),
    FILE_COMPARE_FAILURE(8, "", false),
    FILE_UPLOAD_SUCCESS(9, "", true),
    File_UPLOAD_FAILURE(10, "", false);
    @Getter
    private int value;
    @Getter
    private boolean success;
    @Getter
    private String clazz;

    TaskStatusEnum(int value, String clazz, boolean success) {
        this.value = value;
    }

    public static TaskStatusEnum resolve(Class<?> clazz, boolean success) {
        for (TaskStatusEnum status : TaskStatusEnum.values()) {
            if (status.success == success && clazz.getName().equals(status.clazz)) {
                return status;
            }
        }
        return TaskStatusEnum.UNKNOWN;
    }

    public static boolean success(Integer status) {
        return Objects.equals(FILE_UPLOAD_SUCCESS.value, status);
    }

    public static TaskStatusEnum successStatus() {
        return TaskStatusEnum.FILE_UPLOAD_SUCCESS;
    }
}
