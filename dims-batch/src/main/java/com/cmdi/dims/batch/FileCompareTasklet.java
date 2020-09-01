package com.cmdi.dims.batch;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.util.Assert;

import lombok.extern.slf4j.Slf4j;
import com.cmdi.dims.sdk.model.TaskItemFileDto;

@Slf4j
public class FileCompareTasklet extends AbstractDimsTasklet {

    @Override
    public void process(String taskCode, String province, String speciality) throws Exception {
        Assert.hasText(taskCode, "taskCode is null");
        String previousTaskCode = taskService.findPreviousTaskCode(taskCode);
        if (StringUtils.isEmpty(previousTaskCode)) {
            return;
        }
        List<TaskItemFileDto> taskItemFiles = taskService.findTaskItemFilesByTaskCode(taskCode);
        Assert.notEmpty(taskItemFiles, "task item files is empty !!!");
        List<TaskItemFileDto> preTaskItemFiles = taskService.findTaskItemFilesByTaskCode(previousTaskCode);
        if (CollectionUtils.isNotEmpty(preTaskItemFiles)) {
            Map<String, String> fileHash = preTaskItemFiles.stream().collect(Collectors.toMap(TaskItemFileDto::getCode, TaskItemFileDto::getSignature, (u, v) -> u));
            for (TaskItemFileDto file : taskItemFiles) {
                if (!Objects.equals(file.getSignature(), fileHash.get(file.getCode()))) {
                    return;
                }
            }
            throw new RuntimeException("File compare result: no change");
        }
    }
}
