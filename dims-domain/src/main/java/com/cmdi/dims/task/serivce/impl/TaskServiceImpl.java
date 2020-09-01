package com.cmdi.dims.task.serivce.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import org.apache.commons.collections4.CollectionUtils;
import org.joda.time.DateTime;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import lombok.extern.slf4j.Slf4j;
import com.cmdi.dims.task.TaskStatusEnum;
import com.cmdi.dims.task.dto.TaskItemBusinessDto;
import com.cmdi.dims.task.dto.TaskItemFileDto;
import com.cmdi.dims.task.dto.TaskItemIndexDto;
import com.cmdi.dims.task.entity.AreaCodeConfig;
import com.cmdi.dims.task.entity.Task;
import com.cmdi.dims.task.entity.TaskItemBusiness;
import com.cmdi.dims.task.entity.TaskItemFile;
import com.cmdi.dims.task.entity.TaskItemIndex;
import com.cmdi.dims.task.entity.TaskLatest;
import com.cmdi.dims.task.repository.AreaCodeConfigRepository;
import com.cmdi.dims.task.repository.TaskItemBusinessRepository;
import com.cmdi.dims.task.repository.TaskItemFileRepository;
import com.cmdi.dims.task.repository.TaskItemIndexRepository;
import com.cmdi.dims.task.repository.TaskLatestRepository;
import com.cmdi.dims.task.repository.TaskRepository;
import com.cmdi.dims.task.serivce.TaskService;

@Slf4j
@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskRepository taskRepository;
    @Autowired
    private TaskItemFileRepository taskItemFileRepository;
    @Autowired
    private TaskItemBusinessRepository taskItemBusinessRepository;
    @Autowired
    private TaskItemIndexRepository taskItemIndexRepository;
    @Autowired
    private TaskLatestRepository taskLatestRepository;
    @Autowired
    private AreaCodeConfigRepository areaCodeConfigRepository;

    @Override
    public String findPreviousTaskCode(String taskCode) {
        Task task = taskRepository.findByCode(taskCode);
        List<Task> tasks = taskRepository.findByProvinceAndSpecialityNameAndStatusOrderByCollectionDateDescTaskIdDesc(task.getProvince(), task.getSpecialityName(), TaskStatusEnum.successStatus().getValue(), PageRequest.of(0, 2))
                .stream().filter(t -> !Objects.equals(t.getCode(), taskCode)).limit(1).collect(Collectors.toList());
        return tasks.isEmpty() ? null : tasks.get(0).getCode();
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public String createTask(String province, String specialityName) {
        DateTime today = new DateTime().withMillisOfDay(0);
        String taskCode = province + "-" + specialityName + "-" + today.toString("yyyyMMdd");

        Task task;
        List<Task> existTasks = taskRepository.findByProvinceAndSpecialityNameAndCollectionDate(province, specialityName, today.toDate());
        if (CollectionUtils.isNotEmpty(existTasks)) {
            task = existTasks.get(0);
            List<TaskItemFile> taskItemFiles = taskItemFileRepository.findByTaskCodeOrderByTaskItemFileId(task.getCode());
            taskItemFileRepository.deleteAll(taskItemFiles);
            List<TaskItemBusiness> taskItemBusinesses = taskItemBusinessRepository.findByTaskCodeOrderByTaskItemBusinessIdAsc(task.getCode());
            taskItemBusinessRepository.deleteAll(taskItemBusinesses);
            List<TaskItemIndex> taskItemIndices = taskItemIndexRepository.findByTaskCodeOrderByTaskItemIndexId(task.getCode());
            taskItemIndexRepository.deleteAll(taskItemIndices);
            task = existTasks.get(0);
            task.setStartTime(new Date());
            task.setEndTime(null);
            task.setStatus(TaskStatusEnum.INITIALIZED.getValue());
            task = taskRepository.save(task);
        } else {
            AreaCodeConfig areaCodeConfig = areaCodeConfigRepository.findByCode(province);
            Assert.notNull(areaCodeConfig, "省份不存在");
            task = new Task();
            task.setName("采集任务-" + province + "-" + areaCodeConfig.getName() + "-" + specialityName + "-" + today.toString("yyyyMMdd"));
            task.setCode(taskCode);
            task.setProvince(province);
            task.setSpecialityName(specialityName);
            task.setCollectionDate(today.toDate());
            task.setStartTime(new Date());
            task.setStatus(TaskStatusEnum.INITIALIZED.getValue());
            task.setVersion(1L);
            task = taskRepository.save(task);
        }
        return task.getCode();
    }

    @Override
    public List<TaskItemFileDto> findTaskItemFilesByTaskCode(String taskCode) {
        return taskItemFileRepository.findByTaskCodeOrderByTaskItemFileId(taskCode)
                .stream().map(TaskItemFileDto::from).collect(Collectors.toList());
    }

    @Override
    public List<TaskItemBusinessDto> findTaskItemBusinessesByTaskCode(String taskCode) {
        return taskItemBusinessRepository.findByTaskCodeOrderByTaskItemBusinessIdAsc(taskCode)
                .stream().map(TaskItemBusinessDto::from).collect(Collectors.toList());
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public void saveTaskItemFile(TaskItemFileDto taskItemFile) {
        List<TaskItemFile> files = taskItemFileRepository.findByTaskCodeAndCode(taskItemFile.getTaskCode(), taskItemFile.getCode());
        TaskItemFile file;
        if (CollectionUtils.isNotEmpty(files)) {
            file = files.get(0);
        } else {
            file = new TaskItemFile();
            file.setVersion(1L);
        }
        BeanUtils.copyProperties(taskItemFile, file);
        taskItemFileRepository.save(file);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public void start(String taskCode) {
        Task task = taskRepository.findByCode(taskCode);
        task.setStartTime(new Date());
        taskRepository.save(task);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public void status(String taskCode, TaskStatusEnum status) {
        Task task = taskRepository.findByCode(taskCode);
        task.setStatus(status.getValue());
        taskRepository.save(task);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public void finish(String taskCode) {
        Task task = taskRepository.findByCode(taskCode);
        task.setEndTime(new Date());
        taskRepository.save(task);
        if (TaskStatusEnum.success(task.getStatus())) {
            List<TaskLatest> taskLatests = taskLatestRepository.findByProvinceAndSpecialityName(task.getProvince(), task.getSpecialityName());
            if (CollectionUtils.isNotEmpty(taskLatests)) {
                taskLatestRepository.deleteInBatch(taskLatests);
            }
            TaskLatest taskLatest = new TaskLatest();
            taskLatest.setTaskCode(taskCode);
            taskLatest.setProvince(task.getProvince());
            taskLatest.setSpecialityName(task.getSpecialityName());
            taskLatest.setVersion(1L);
            taskLatestRepository.save(taskLatest);
        }
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public void saveTaskItemBusiness(TaskItemBusinessDto taskItemBusinessDto) {
        List<TaskItemBusiness> taskItemBusinesses = taskItemBusinessRepository.findByTaskCodeAndCode(taskItemBusinessDto.getTaskCode(), taskItemBusinessDto.getCode());
        TaskItemBusiness taskItemBusiness;
        if (CollectionUtils.isNotEmpty(taskItemBusinesses)) {
            taskItemBusiness = taskItemBusinesses.get(0);
        } else {
            taskItemBusiness = new TaskItemBusiness();
            taskItemBusiness.setVersion(1L);
        }
        BeanUtils.copyProperties(taskItemBusinessDto, taskItemBusiness);
        this.taskItemBusinessRepository.save(taskItemBusiness);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public void saveTaskItemIndex(List<TaskItemIndexDto> taskItemIndexDtos) {
        List<TaskItemBusiness> taskItemBusinesses = taskItemBusinessRepository.findByTaskCodeOrderByTaskItemBusinessIdAsc(taskItemIndexDtos.get(0).getTaskCode());
        Date collectionDate = taskItemBusinesses.stream().map(TaskItemBusiness::getCollectionDate).findFirst().orElse(null);

        List<TaskItemIndex> taskItemIndices = taskItemIndexRepository.findByTaskCodeOrderByTaskItemIndexId(taskItemIndexDtos.get(0).getTaskCode());
        if (CollectionUtils.isNotEmpty(taskItemIndices)) {
            taskItemIndexRepository.deleteInBatch(taskItemIndices);
        }
        List<TaskItemIndex> save = new ArrayList<>();
        for (TaskItemIndexDto indexDto : taskItemIndexDtos) {
            TaskItemIndex index = new TaskItemIndex();
            BeanUtils.copyProperties(indexDto, index);
            index.setVersion(1L);
            if (null != collectionDate) {
                index.setCollectionDate(collectionDate);
            }
            save.add(index);
        }
        taskItemIndexRepository.saveAll(save);
    }
}
