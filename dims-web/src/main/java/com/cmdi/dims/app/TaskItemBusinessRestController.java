package com.cmdi.dims.app;

import java.util.List;

import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.app.dto.TaskItemQueryDto;
import com.cmdi.dims.task.entity.TaskItemBusiness;
import com.cmdi.dims.task.repository.TaskItemBusinessRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/app/v1/taskitembusiness")
public class TaskItemBusinessRestController {

    @Autowired
    TaskItemBusinessRepository taskItemBusinessRepository;

    @GetMapping
    public ResponseDto<List<TaskItemBusiness>> taskItemBusinesses(
            TaskItemQueryDto query,
            @RequestParam(value = "start", defaultValue = "0") Integer start,
            @RequestParam(value = "limit", defaultValue = "50") Integer limit
    ) {

        Integer size = null != limit ? limit : 50;
        Integer page = null != start ? start / size : 0;

        TaskItemBusiness example = new TaskItemBusiness();
        example.setCollectionDate(query.getCollectionDate());

        Page<TaskItemBusiness> pagination = taskItemBusinessRepository.findAll(Example.of(example), PageRequest.of(page, size));
        return ResponseDto.success(pagination.getContent(), pagination.getTotalElements(), pagination.getNumberOfElements());
    }
}
