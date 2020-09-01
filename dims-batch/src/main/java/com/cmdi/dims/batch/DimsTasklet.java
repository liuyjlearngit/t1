package com.cmdi.dims.batch;

import com.cmdi.dims.domain.TaskService;
import org.springframework.batch.core.step.tasklet.Tasklet;

public interface DimsTasklet extends Tasklet {

    TaskService getTaskService();

    void process(String taskCode, String province, String speciality) throws Exception;
}
