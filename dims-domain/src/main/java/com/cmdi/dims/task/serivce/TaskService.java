package com.cmdi.dims.task.serivce;

import com.cmdi.dims.task.TaskStatusEnum;
import com.cmdi.dims.task.dto.ResStatisticsDto;
import com.cmdi.dims.task.dto.TaskItemBusinessDto;
import com.cmdi.dims.task.dto.TaskItemFileDto;
import com.cmdi.dims.task.dto.TaskItemIndexDto;

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

    void saveResStatistics(List<ResStatisticsDto> resStatisticsDtos);
}
