package com.cmdi.dims.batch;

import com.cmdi.dims.domain.DataService;
import com.cmdi.dims.domain.StatisticsService;
import com.cmdi.dims.domain.entity.StatisticsResIndex;
import com.cmdi.dims.sdk.model.ResStatisticsDto;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;

import java.util.List;

@Slf4j
public class StatisticsTasklet extends AbstractDimsTasklet{
    @Setter
    private StatisticsService statisticsService;

    @Setter
    private DataService dataService;

    @Override
    public void process(String taskCode, String province, String speciality) {
        //加载统计相关的所有存储过程
        List<StatisticsResIndex> resIndices = statisticsService.loadResIndexProcBySpeciality(speciality);
        if (CollectionUtils.isNotEmpty(resIndices)){
            calculateIndex(taskCode, province, resIndices);
            uploadData(taskCode);
        }else{
            log.info("No statistics need to calculate for " + province + ":" + speciality);
        }
    }

    private void calculateIndex(String taskCode, String province, StatisticsResIndex resIndex) {
        log.info("calculate statistics " + resIndex.getId() + " - " + resIndex.getName() + " begin ! ");
        long start = System.currentTimeMillis();
        try {
            statisticsService.calculateResIndex(taskCode, province, resIndex);
        } catch (Exception e) {
            log.error("calculate statistics " + resIndex.getId() + " - " + resIndex.getName() + " error !", e);
        } finally {
            log.info("calculate statistics " + resIndex.getId() + " - " + resIndex.getName() + " end, use " + (System.currentTimeMillis() - start) + "ms");
        }
    }
    //TODO 计算指标，站点名称在系统内是否唯一执行时间过长
    private void calculateIndex(String taskCode, String province, List<StatisticsResIndex> resIndices) {
        if (CollectionUtils.isNotEmpty(resIndices)) {
            for (StatisticsResIndex resIndex : resIndices) {
                calculateIndex(taskCode, province, resIndex);
            }
        }
    }

    private void uploadData(String taskCode) {
        List<ResStatisticsDto> data = statisticsService.loadCalculateResIndexData(taskCode);
        if (CollectionUtils.isNotEmpty(data)) {
            statisticsService.saveResStatistics(data);
        }
    }
}
