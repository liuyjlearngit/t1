package com.cmdi.dims.batch;

import java.util.List;

import com.cmdi.dims.domain.DataService;
import com.cmdi.dims.domain.MetaService;
import org.apache.commons.collections4.CollectionUtils;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import com.cmdi.dims.sdk.model.IndexProcDto;
import com.cmdi.dims.sdk.model.TaskItemIndexDto;

@Slf4j
public class BusinessAnalysisTasklet extends AbstractDimsTasklet {

    @Setter
    private MetaService metaService;
    @Setter
    private DataService dataService;

    @Override
    public void process(String taskCode, String province, String speciality) {
        //加载专业相关的所有存储过程
        List<IndexProcDto> indices = metaService.loadIndexProcBySpeciality(speciality);
        calculateIndex(taskCode, province, indices);
        uploadData(taskCode);
    }

    private void calculateIndex(String taskCode, String province, IndexProcDto index) {
        log.info("calculate index " + index.getIndexCode() + " - " + index.getIndexName() + " begin ! ");
        long start = System.currentTimeMillis();
        try {
            dataService.calculateIndex(taskCode, province, index);
        } catch (Exception e) {
            log.error("calculate index " + index.getIndexCode() + " - " + index.getIndexName() + " error !", e);
        } finally {
            log.info("calculate index " + index.getIndexCode() + " - " + index.getIndexName() + " end, use " + (System.currentTimeMillis() - start) + "ms");
        }
    }
    //TODO 计算指标，站点名称在系统内是否唯一执行时间过长
    private void calculateIndex(String taskCode, String province, List<IndexProcDto> indices) {
        if (CollectionUtils.isNotEmpty(indices)) {
            for (IndexProcDto index : indices) {
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
