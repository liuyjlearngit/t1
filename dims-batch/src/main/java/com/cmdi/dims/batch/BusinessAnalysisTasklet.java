package com.cmdi.dims.batch;

import com.cmdi.dims.domain.ConfigService;
import com.cmdi.dims.domain.DataService;
import com.cmdi.dims.domain.meta.dto.Index;
import com.cmdi.dims.sdk.model.TaskItemIndexDto;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;

import java.util.List;

@Slf4j
public class BusinessAnalysisTasklet extends AbstractDimsTasklet {

    @Setter
    private ConfigService configService;
    @Setter
    private DataService dataService;

    @Override
    public void process(String taskCode, String province, String speciality) {
        //加载专业相关的所有存储过程
        List<Index> indices = dataService.loadIndices(speciality);
        calculateIndex(taskCode, province, indices);
        uploadData(taskCode);
    }

    private void calculateIndex(String taskCode, String province, Index index) {
        log.info("calculate index " + index.getCode() + " - " + index.getName() + " begin ! ");
        long start = System.currentTimeMillis();
        try {
            dataService.calculateIndex(taskCode, province, index);
        } catch (Exception e) {
            log.error("calculate index " + index.getCode() + " - " + index.getName() + " error !", e);
        } finally {
            log.info("calculate index " + index.getCode() + " - " + index.getName() + " end, use " + (System.currentTimeMillis() - start) + "ms");
        }
    }
    //TODO 计算指标，站点名称在系统内是否唯一执行时间过长
    private void calculateIndex(String taskCode, String province, List<Index> indices) {
        if (CollectionUtils.isNotEmpty(indices)) {
            for (Index index : indices) {
                calculateIndex(taskCode, province, index);
            }
        }
    }

    private void uploadData(String taskCode) {
        List<TaskItemIndexDto> data = dataService.loadCalculateIndexData(taskCode);
        if (CollectionUtils.isNotEmpty(data)) {
            taskService.saveTaskItemIndex(data);
        }
    }
}
