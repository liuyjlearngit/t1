package com.cmdi.dims.app.dto;

import com.cmdi.dims.index.entity.Index;
import com.cmdi.dims.task.entity.Task;
import com.cmdi.dims.task.entity.TaskItemIndex;
import lombok.Data;

import java.util.List;

@Data
public class TaskItemIndexListDto {

    private Index index;

    private Task task;

    private List<TaskItemIndex> taskItemIndices;

}
