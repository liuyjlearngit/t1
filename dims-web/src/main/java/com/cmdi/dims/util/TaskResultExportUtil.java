package com.cmdi.dims.util;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.cmdi.dims.common.util.DateFormatUtil;
import com.cmdi.dims.common.util.ExcelUtil;
import com.cmdi.dims.task.entity.TaskItemBusiness;
import com.cmdi.dims.task.entity.TaskItemFile;
import com.cmdi.dims.task.entity.TaskItemIndex;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public class TaskResultExportUtil {


    public static Workbook export(List<TaskItemFile> taskItemFiles, List<TaskItemBusiness> taskItemBusinesses, List<TaskItemIndex> taskItemIndices) {
        Workbook workbook = ExcelUtil.createWorkbook(ExcelUtil.XLSX);

        Sheet sheet = workbook.createSheet("核查文件结果");
        Row headerRow = sheet.createRow(sheet.getPhysicalNumberOfRows());
        CellStyle headerStyle = ExcelUtil.createCellStyle(workbook, IndexedColors.YELLOW);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "采集日期", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "省份", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "文件名", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "FTP文件来源", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "目标表", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "文件大小", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "csv文件名", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "csv文件大小", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "获取耗时ms", headerStyle);

        if (CollectionUtils.isNotEmpty(taskItemFiles)) {
            for (TaskItemFile taskItemFile : taskItemFiles) {
                Row row = sheet.createRow(sheet.getPhysicalNumberOfRows());
                ExcelUtil.createCell(workbook.getCreationHelper(), row, DateFormatUtil.toDateString(taskItemFile.getCollectionDate()), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemFile.getProvince(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemFile.getName(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemFile.getCode(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemFile.getDestTable(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemFile.getFileSize(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemFile.getCsvFile(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemFile.getCsvFileSize(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemFile.getFileGettingCosts(), null);

            }
        }
        for (int i = 0; i < headerRow.getPhysicalNumberOfCells(); i++) {
            sheet.autoSizeColumn(i);
        }

        sheet = workbook.createSheet("核查业务结果");
        headerRow = sheet.createRow(sheet.getPhysicalNumberOfRows());
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "采集日期", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "省份", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "资源对象", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "表名", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "总量", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "原始数据量", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "入库用时ms", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "失败原因", headerStyle);

        if (CollectionUtils.isNotEmpty(taskItemBusinesses)) {
            for (TaskItemBusiness taskItemBusiness : taskItemBusinesses) {
                Row row = sheet.createRow(sheet.getPhysicalNumberOfRows());
                ExcelUtil.createCell(workbook.getCreationHelper(), row, null != taskItemBusiness.getCollectionDate() ? DateFormatUtil.toDateString(taskItemBusiness.getCollectionDate()) : null, null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemBusiness.getProvince(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemBusiness.getName(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemBusiness.getCode(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemBusiness.getAmount(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemBusiness.getOriginAmount(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemBusiness.getAnalysisCosts(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemBusiness.getMemo(), null);
            }
        }
        for (int i = 0; i < headerRow.getPhysicalNumberOfCells(); i++) {
            sheet.autoSizeColumn(i);
        }

        if (CollectionUtils.isNotEmpty(taskItemIndices)) {
            Map<Integer, List<TaskItemIndex>> regionIndices = taskItemIndices.stream().collect(Collectors.groupingBy(TaskItemIndex::getRegionType));
            List<TaskItemIndex> indices = regionIndices.get(1);
            if (CollectionUtils.isNotEmpty(indices)) {
                indices.sort(Comparator.comparing(TaskItemIndex::getCode));
                sheet = workbook.createSheet("省级核查指标结果");
                headerRow = sheet.createRow(sheet.getPhysicalNumberOfRows());
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "采集日期", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "省份", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "指标编码", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "指标名称", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "总量", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "错误量", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "指标值", headerStyle);

                for (TaskItemIndex taskItemIndex : indices) {
                    Row row = sheet.createRow(sheet.getPhysicalNumberOfRows());
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, DateFormatUtil.toDateString(taskItemIndex.getCollectionDate()), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getProvince(), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getCode(), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getName(), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getAmount(), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getErrorAmount(), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, null != taskItemIndex.getIndexValue() ? new BigDecimal(taskItemIndex.getIndexValue() * 100).setScale(2, RoundingMode.HALF_UP).toString() + "%" : null, null);
                }

                for (int i = 0; i < headerRow.getPhysicalNumberOfCells(); i++) {
                    sheet.autoSizeColumn(i);
                }
            }

            indices = regionIndices.get(2);
            if (CollectionUtils.isNotEmpty(indices)) {
                indices.sort(Comparator.comparing(TaskItemIndex::getCode));
                sheet = workbook.createSheet("地市核查指标结果");
                headerRow = sheet.createRow(sheet.getPhysicalNumberOfRows());
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "采集日期", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "省份", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "地市", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "指标编码", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "指标名称", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "总量", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "错误量", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "指标值", headerStyle);

                for (TaskItemIndex taskItemIndex : indices) {
                    Row row = sheet.createRow(sheet.getPhysicalNumberOfRows());
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, DateFormatUtil.toDateString(taskItemIndex.getCollectionDate()), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getProvince(), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getPrefecture(), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getCode(), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getName(), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getAmount(), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getErrorAmount(), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, null != taskItemIndex.getIndexValue() ? new BigDecimal(taskItemIndex.getIndexValue() * 100).setScale(2, RoundingMode.HALF_UP).toString() + "%" : null, null);
                }

                for (int i = 0; i < headerRow.getPhysicalNumberOfCells(); i++) {
                    sheet.autoSizeColumn(i);
                }
            }
            indices = regionIndices.get(3);
            if (CollectionUtils.isNotEmpty(indices)) {
                indices.sort(Comparator.comparing(TaskItemIndex::getCode));
                sheet = workbook.createSheet("区县核查指标结果");
                headerRow = sheet.createRow(sheet.getPhysicalNumberOfRows());
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "采集日期", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "省份", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "地市", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "区县", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "指标编码", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "指标名称", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "总量", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "错误量", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "指标值", headerStyle);

                for (TaskItemIndex taskItemIndex : indices) {
                    Row row = sheet.createRow(sheet.getPhysicalNumberOfRows());
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, DateFormatUtil.toDateString(taskItemIndex.getCollectionDate()), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getProvince(), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getPrefecture(), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getCounty(), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getCode(), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getName(), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getAmount(), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getErrorAmount(), null);
                    ExcelUtil.createCell(workbook.getCreationHelper(), row, null != taskItemIndex.getIndexValue() ? new BigDecimal(taskItemIndex.getIndexValue() * 100).setScale(2, RoundingMode.HALF_UP).toString() + "%" : null, null);
                }

                for (int i = 0; i < headerRow.getPhysicalNumberOfCells(); i++) {
                    sheet.autoSizeColumn(i);
                }
            }

        }

        return workbook;
    }
}
