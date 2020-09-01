package com.cmdi.dims.util;

import java.util.List;
import java.util.Map;

import com.cmdi.dims.common.util.ExcelUtil;
import com.cmdi.dims.task.entity.FileValidation;
import com.cmdi.dims.task.entity.TaskConfig;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public class FileValidationExportUtil {

    public static Workbook export(List<TaskConfig> taskConfigs, Map<Long, List<FileValidation>> groupedFileValiations) {
        Workbook workbook = ExcelUtil.createWorkbook(ExcelUtil.XLSX);

        if (CollectionUtils.isNotEmpty(taskConfigs)) {
            for (TaskConfig taskConfig : taskConfigs) {
                Sheet sheet = workbook.createSheet(taskConfig.getProvince());
                Row headerRow = sheet.createRow(sheet.getPhysicalNumberOfRows());
                CellStyle headerStyle = ExcelUtil.createCellStyle(workbook, IndexedColors.YELLOW);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "实体名称", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "表名", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "服务器CSV文件路径", headerStyle);
                ExcelUtil.createCell(workbook.getCreationHelper(), headerRow, "校验结果", headerStyle);

                List<FileValidation> fileValidations = groupedFileValiations.get(taskConfig.getTaskConfigId());
                if (CollectionUtils.isNotEmpty(fileValidations)) {
                    for (FileValidation fileValidation : fileValidations) {
                        Row row = sheet.createRow(sheet.getPhysicalNumberOfRows());
                        ExcelUtil.createCell(workbook.getCreationHelper(), row, fileValidation.getEntityName(), null);
                        ExcelUtil.createCell(workbook.getCreationHelper(), row, fileValidation.getDestTable(), null);
                        ExcelUtil.createCell(workbook.getCreationHelper(), row, fileValidation.getCsvFile(), null);
                        ExcelUtil.createCell(workbook.getCreationHelper(), row, fileValidation.getValidationResult(), null);
                    }
                }
                for (int i = 0; i < headerRow.getPhysicalNumberOfCells(); i++) {
                    sheet.autoSizeColumn(i);
                }
            }
        }
        return workbook;
    }
}
