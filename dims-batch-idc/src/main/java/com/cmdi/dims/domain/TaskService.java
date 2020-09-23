package com.cmdi.dims.domain;

import com.cmdi.dims.sdk.model.TaskItemBusinessDto;
import com.cmdi.dims.sdk.model.TaskItemFileDto;
import com.cmdi.dims.sdk.model.TaskItemIndexDto;

import java.io.IOException;
import java.util.List;

public interface TaskService {

    String findPreviousTaskCode(String taskCode);

    String createTask(String province, String specialityName) throws IOException;

    void start(String taskCode);

    void status(String taskCode, TaskStatusEnum status);

    void finish(String taskCode);

    List<TaskItemFileDto> findTaskItemFilesByTaskCode(String taskCode);

    List<TaskItemBusinessDto> findTaskItemBusinessesByTaskCode(String taskCode);

    void saveTaskItemFile(TaskItemFileDto taskItemFile);

    void saveTaskItemBusiness(TaskItemBusinessDto taskItemBusinessDto);

    void saveTaskItemIndex(List<TaskItemIndexDto> taskItemIndexDtos);
}
