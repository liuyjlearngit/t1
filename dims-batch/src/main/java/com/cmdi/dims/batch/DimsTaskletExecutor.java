package com.cmdi.dims.batch;

import com.cmdi.dims.domain.TaskStatusEnum;
import org.apache.commons.lang3.StringUtils;
import org.springframework.batch.core.scope.context.StepContext;
import org.springframework.batch.repeat.RepeatStatus;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class DimsTaskletExecutor {

    public static RepeatStatus execute(DimsTasklet dimsTasklet, StepContext stepContext) {
        String province = BatchUtil.getProvince(stepContext);
        String speciality = BatchUtil.getSpeciality(stepContext);
        if (StringUtils.isEmpty(province) || StringUtils.isEmpty(speciality) || BatchUtil.isSkip(stepContext)) {
            log.info("[" + dimsTasklet.getClass().getSimpleName() + "] STEP SKIPPED");
            return RepeatStatus.FINISHED;
        }
        String taskCode = BatchUtil.getTaskCode(stepContext);
        boolean success = true;
        long start = System.currentTimeMillis();
        try {
            dimsTasklet.process(taskCode, province, speciality);
        } catch (Exception e) {
            success = false;
            log.error("[" + dimsTasklet.getClass().getSimpleName() + "] PROCESS ERROR ! " + e.getMessage(), e);
            BatchUtil.setSkip(stepContext, SkipEnum.ERROR_SKIP);
        } finally {
            try {
                dimsTasklet.getTaskService().status(taskCode, TaskStatusEnum.resolve(dimsTasklet.getClass(), success));
            } catch (Exception e) {
                log.error("[" + dimsTasklet.getClass().getSimpleName() + "] SAVE TASK STATUS ERROR ! " + e.getMessage());
            }
            log.info("[" + dimsTasklet.getClass().getSimpleName() + "] STEP USE " + (System.currentTimeMillis() - start) + "(ms)");
        }
        return RepeatStatus.FINISHED;
    }
}
