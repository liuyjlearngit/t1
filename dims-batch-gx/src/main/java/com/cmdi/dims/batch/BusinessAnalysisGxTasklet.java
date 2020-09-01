package com.cmdi.dims.batch;

import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.cmdi.dims.domain.DataService;
import com.cmdi.dims.domain.MetaService;
import org.apache.commons.collections4.CollectionUtils;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import com.cmdi.dims.sdk.model.IndexProcDto;
import com.cmdi.dims.sdk.model.TaskItemIndexDto;

@Slf4j
public class BusinessAnalysisGxTasklet extends AbstractDimsTasklet {

    private static final long TASK_ID = 0L;

    @Setter
    private MetaService metaService;
    @Setter
    private DataService dataService;

    @Override
    public void process(String taskCode, String province, String speciality) {
        dataService.insertDefaultTask(TASK_ID, province, new Date());
        List<IndexProcDto> allIndices = metaService.loadIndexProcBySpeciality(speciality);
        Map<Integer, List<IndexProcDto>> typeIndices = allIndices.stream().collect(Collectors.groupingBy(IndexProcDto::getIndexType));

        /**
         * 定制存过的指标：必填性指标、规范性指标、关联性指标、业务分类指标等四大类
         * 每个指标都有自己的存过，存过名称记录在dims_idx_index.name上
         * 存过参数p_taskId integer,p_indexCode varchar
         * dims_idx_index.type:
         * 1,存储过程定制;
         * 2,扩展表关联性指标;
         * 3,指标集合;
         * 4,字典准确性指标;
         * 5,必填性分类指标
         */
        List<IndexProcDto> indices = typeIndices.get(1);
        calculateIndex(TASK_ID, indices);

        /**
         * 扩展表关联性指标
         * 单个存过proc_checkOneExtTableAssocIndex
         * 存过参数p_taskId integer,p_indexId integer
         * dims_idx_index.type:
         * 1,存储过程定制;
         * 2,扩展表关联性指标;
         * 3,指标集合;
         * 4,字典准确性指标;
         * 5,必填性分类指标
         */
        indices = typeIndices.get(2);
        calculateIndex(TASK_ID, indices);

        /**
         * 字典准确性指标
         * 单个存过proc_checkOneDictAccuracyIndex
         * 存过参数p_taskId integer,p_indexId integer
         * dims_idx_index.type:
         * 1,存储过程定制;
         * 2,扩展表关联性指标;
         * 3,指标集合;
         * 4,字典准确性指标;
         * 5,必填性分类指标
         */
        indices = typeIndices.get(4);
        calculateIndex(TASK_ID, indices);

        /**
         * 必填性分析类指标
         * 单个存过proc_checkOneMandatoryClassifiedIndex
         * 存过参数p_taskId integer,p_indexId integer
         * dims_idx_index.type:
         * 1,存储过程定制;
         * 2,扩展表关联性指标;
         * 3,指标集合;
         * 4,字典准确性指标;
         * 5,必填性分类指标
         */
        indices = typeIndices.get(5);
        calculateIndex(TASK_ID, indices);

        indices = typeIndices.get(6);
        calculateIndex(TASK_ID, indices);

        indices = typeIndices.get(7);
        calculateIndex(TASK_ID, indices);

        indices = typeIndices.get(8);
        calculateIndex(TASK_ID, indices);

        indices = typeIndices.get(9);
        calculateIndex(TASK_ID, indices);

        indices = typeIndices.get(10);
        calculateIndex(TASK_ID, indices);

        /**
         * 指标集合(目前有三个：数据完整性指标、属性规范性指标、业务关联性指标)
         * 只计算下挂指标的算术平均，不标记业务数据，速度很快
         * 计算全部指标集合的存过proc_checkIndexSet
         * 存过参数p_taskId integer
         * dims_idx_index.type:
         * 1,存储过程定制;
         * 2,扩展表关联性指标;
         * 3,指标集合;
         * 4,字典准确性指标;
         * 5,必填性分类指标
         */
        IndexProcDto index = mockTypeThreeIndex();
        calculateIndex(TASK_ID, index);

        uploadData(taskCode, province);
    }

    private IndexProcDto mockTypeThreeIndex() {
        IndexProcDto index = new IndexProcDto();
        index.setIndexName("指标集合");
        index.setIndexCode("proc_checkIndexSet");
        index.setIndexType(3);
        return index;
    }

    private void calculateIndex(long taskId, IndexProcDto index) {
        log.info("calculate index " + index.getIndexCode() + " - " + index.getIndexName() + " begin ! ");
        long start = System.currentTimeMillis();
        try {
            dataService.calculateIndex(taskId, index);
        } catch (Exception e) {
            log.error("calculate index " + index.getIndexCode() + " - " + index.getIndexName() + " error !", e);
        } finally {
            log.info("calculate index " + index.getIndexCode() + " - " + index.getIndexName() + " end, use " + (System.currentTimeMillis() - start) + "ms");
        }
    }

    private void calculateIndex(long taskId, List<IndexProcDto> indices) {
        if (CollectionUtils.isNotEmpty(indices)) {
            indices.sort(Comparator.comparing(IndexProcDto::getIndexCode));
            for (IndexProcDto index : indices) {
                calculateIndex(taskId, index);
            }
        }
    }

    private void uploadData(String taskCode, String province) {
        List<TaskItemIndexDto> data = dataService.loadCalculateIndexData(TASK_ID);
        if (CollectionUtils.isNotEmpty(data)) {
            data.forEach(d -> {
                d.setTaskCode(taskCode);
                d.setProvinceCode(province);
                d.setProvince("湖北省");
            });
//            List<TaskItemIndexDto> prefecture = new ArrayList<>();
//            for (TaskItemIndexDto item : data) {
//                TaskItemIndexDto newDto = new TaskItemIndexDto();
//                BeanUtils.copyProperties(item, newDto);
//                newDto.setProvinceCode(province);
//                newDto.setRegionType(2);
//                prefecture.add(newDto);
//            }
//            data.addAll(prefecture);
            taskService.saveTaskItemIndex(data);
        }
    }
}
