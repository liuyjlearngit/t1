package com.cmdi.dims.domain.impl;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmdi.dims.domain.TaskService;
import com.cmdi.dims.domain.TaskStatusEnum;
import com.cmdi.dims.sdk.api.TaskRestApi;
import com.cmdi.dims.sdk.model.TaskForm;
import com.cmdi.dims.sdk.model.TaskItemBusinessDto;
import com.cmdi.dims.sdk.model.TaskItemFileDto;
import com.cmdi.dims.sdk.model.TaskItemIndexDto;

@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskRestApi taskRestApi;

    @Override
    public String findPreviousTaskCode(String taskCode) {
        return taskRestApi.findPreviousTaskCodeUsingGET(taskCode).getData();
    }

    @Override
    public String createTask(String province, String specialityName) throws IOException {
        return taskRestApi.createTaskUsingPOST(new TaskForm().province(province).speciality(specialityName)).getData();
    }

    @Override
    public void start(String taskCode) {
        taskRestApi.startUsingPUT(taskCode);
    }

    @Override
    public void status(String taskCode, TaskStatusEnum status) {
        taskRestApi.statusUsingPUT(status.name(), taskCode);
    }

    @Override
    public void finish(String taskCode) {
        taskRestApi.finishUsingPUT(taskCode);
    }

    @Override
    public List<TaskItemFileDto> findTaskItemFilesByTaskCode(String taskCode) {
        return taskRestApi.findTaskItemFilesByTaskCodeUsingGET(taskCode).getData();
    }

    @Override
    public List<TaskItemBusinessDto> findTaskItemBusinessesByTaskCode(String taskCode) {
        return taskRestApi.findTaskItemBusinessesByTaskCodeUsingGET(taskCode).getData();
    }

    @Override
    public void saveTaskItemFile(TaskItemFileDto taskItemFile) {
        taskRestApi.saveTaskItemFileUsingPOST(taskItemFile);
    }

    @Override
    public void saveTaskItemBusiness(TaskItemBusinessDto taskItemBusinessDto) {
        taskRestApi.saveTaskItemBusinessUsingPOST(taskItemBusinessDto);
    }

    @Override
    public void saveTaskItemIndex(List<TaskItemIndexDto> taskItemIndexDtos) {
        taskRestApi.saveTaskItemIndexUsingPOST(taskItemIndexDtos);
    }
}
