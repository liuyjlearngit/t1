package com.cmdi.dims.app.dto;

import java.util.List;

import com.cmdi.dims.index.entity.Folder;
import com.cmdi.dims.index.entity.Index;
import com.cmdi.dims.task.entity.Task;
import com.cmdi.dims.task.entity.TaskItemIndex;
import lombok.Data;

@Data
public class TaskItemIndexListDto {

    private Folder folder;

    private Index index;

    private Task task;

    private List<TaskItemIndex> taskItemIndices;

}
