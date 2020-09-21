package com.cmdi.dims.api;

import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.task.TaskStatusEnum;
import com.cmdi.dims.task.dto.ResStatisticsDto;
import com.cmdi.dims.task.dto.TaskItemBusinessDto;
import com.cmdi.dims.task.dto.TaskItemFileDto;
import com.cmdi.dims.task.dto.TaskItemIndexDto;
import com.cmdi.dims.task.serivce.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@RequestMapping("/api/task")
@RestController
public class TaskRest {

    @Autowired
    private TaskService taskService;

    @GetMapping("/findPreviousTaskCode")
    public ResponseDto<String> findPreviousTaskCode(@RequestParam("taskCode") String taskCode) {
        return ResponseDto.success(taskService.findPreviousTaskCode(taskCode));
    }

    @PostMapping("/createTask")
    public ResponseDto<String> createTask(@RequestBody TaskForm form) throws IOException {
        return ResponseDto.success(taskService.createTask(form.getProvince(), form.getSpeciality()));
    }

    @PutMapping("/start")
    public ResponseDto<Void> start(@RequestParam("taskCode") String taskCode) {
        taskService.start(taskCode);
        return ResponseDto.success();
    }

    @PutMapping("/status")
    public ResponseDto<Void> status(@RequestParam("taskCode") String taskCode, @RequestParam("status") TaskStatusEnum status) {
        taskService.status(taskCode, status);
        return ResponseDto.success();
    }

    @PutMapping("/finish")
    public ResponseDto<Void> finish(@RequestParam("taskCode") String taskCode) {
        taskService.finish(taskCode);
        return ResponseDto.success();
    }

    @GetMapping("/findTaskItemFilesByTaskCode")
    public ResponseDto<List<TaskItemFileDto>> findTaskItemFilesByTaskCode(@RequestParam("taskCode") String taskCode) {
        return ResponseDto.success(taskService.findTaskItemFilesByTaskCode(taskCode));
    }

    @GetMapping("/findTaskItemBusinessesByTaskCode")
    public ResponseDto<List<TaskItemBusinessDto>> findTaskItemBusinessesByTaskCode(@RequestParam("taskCode") String taskCode) {
        return ResponseDto.success(taskService.findTaskItemBusinessesByTaskCode(taskCode));
    }

    @PostMapping("/saveTaskItemFile")
    public ResponseDto<Void> saveTaskItemFile(@RequestBody TaskItemFileDto taskItemFile) {
        taskService.saveTaskItemFile(taskItemFile);
        return ResponseDto.success();
    }

    @PostMapping("/saveTaskItemBusiness")
    public ResponseDto<Void> saveTaskItemBusiness(@RequestBody TaskItemBusinessDto taskItemBusinessDto) {
        taskService.saveTaskItemBusiness(taskItemBusinessDto);
        return ResponseDto.success();
    }

    @PostMapping("/saveTaskItemIndex")
    public ResponseDto<Void> saveTaskItemIndex(@RequestBody List<TaskItemIndexDto> taskItemIndexDtos) {
        taskService.saveTaskItemIndex(taskItemIndexDtos);
        return ResponseDto.success();
    }
    @PostMapping("/saveResStatistics")
    public ResponseDto<Void> saveResStatistics(@RequestBody List<ResStatisticsDto> resStatisticsDtos) {
        taskService.saveResStatistics(resStatisticsDtos);
        return ResponseDto.success();
    }
}
