package com.cmdi.dims.batch;

import com.cmdi.dims.domain.TaskService;
import org.springframework.batch.core.StepContribution;
import org.springframework.batch.core.scope.context.ChunkContext;
import org.springframework.batch.repeat.RepeatStatus;

import lombok.Getter;
import lombok.Setter;

public abstract class AbstractDimsTasklet implements DimsTasklet {

    @Setter
    @Getter
    protected TaskService taskService;

    @Override
    public RepeatStatus execute(StepContribution contribution, ChunkContext chunkContext) {
        return DimsTaskletExecutor.execute(this, chunkContext.getStepContext());
    }
}
