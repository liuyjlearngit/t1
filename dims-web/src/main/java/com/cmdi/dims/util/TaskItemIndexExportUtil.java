package com.cmdi.dims.util;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

import com.cmdi.dims.app.dto.TaskItemIndexListDto;
import com.cmdi.dims.common.util.DateFormatUtil;
import com.cmdi.dims.common.util.ExcelUtil;
import com.cmdi.dims.task.entity.TaskItemIndex;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public class TaskItemIndexExportUtil {

    public static String filename(TaskItemIndexListDto dto) {
        StringBuilder builder = new StringBuilder();
        if (null != dto.getTask()) {
            builder.append(dto.getTask().getName());
        } else {
            builder.append("NA");
        }
        if (null != dto.getFolder()) {
            builder.append("-").append(dto.getFolder().getName());
        }
        if (null != dto.getIndex()) {
            builder.append("-").append(dto.getIndex().getName());
        }
        builder.append(".").append(System.currentTimeMillis()).append(".").append(ExcelUtil.XLSX);
        return builder.toString();
    }


    public static Workbook export(List<TaskItemIndex> taskItemIndices) {
        Workbook workbook = ExcelUtil.createWorkbook(ExcelUtil.XLSX);

        Sheet sheet = workbook.createSheet("核查指标结果");
        Row headerRow = sheet.createRow(sheet.getPhysicalNumberOfRows());
        CellStyle headerStyle = ExcelUtil.createCellStyle(workbook, IndexedColors.YELLOW);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "采集日期", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "省份", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "地市", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "区县", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "区域类型", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "指标编码", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "指标名称", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "总量", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "错误量", headerStyle);
        ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "指标值", headerStyle);

        if (CollectionUtils.isNotEmpty(taskItemIndices)) {
            for (TaskItemIndex taskItemIndex : taskItemIndices) {
                Row row = sheet.createRow(sheet.getPhysicalNumberOfRows());
                ExcelUtil.createCell(workbook.getCreationHelper(), row, DateFormatUtil.toDateString(taskItemIndex.getCollectionDate()), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getProvince(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getPrefecture(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getCounty(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getRegionType(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getCode(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getName(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getAmount(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, taskItemIndex.getErrorAmount(), null);
                ExcelUtil.createCell(workbook.getCreationHelper(), row, null != taskItemIndex.getIndexValue() ? new BigDecimal(taskItemIndex.getIndexValue() * 100).setScale(2, RoundingMode.HALF_UP).toString() + "%" : null, null);
            }
        }
        for (int i = 0; i < headerRow.getPhysicalNumberOfCells(); i++) {
            sheet.autoSizeColumn(i);
        }
        return workbook;
    }
}
