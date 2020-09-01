package com.cmdi.dims.common.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.RichTextString;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;


public abstract class ExcelUtil {

    /**
     *
     */
    private static final transient Logger logger = LoggerFactory.getLogger(ExcelUtil.class);

    public static final String XLS = "xls";
    public static final String XLSX = "xlsx";

    public static Workbook getWorkbook(MultipartFile file) {
        if (null == file) {
            return null;
        }
        String extension = FilenameUtils.getExtension(file.getOriginalFilename()).toLowerCase();
        try (InputStream fis = file.getInputStream()) {
            if (ExcelUtil.XLS.equals(extension)) {
                try (POIFSFileSystem fs = new POIFSFileSystem(fis)) {
                    return new HSSFWorkbook(fs);
                }
            } else if (ExcelUtil.XLSX.equals(extension)) {
                return new XSSFWorkbook(fis);
            }
            return null;
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        }
        return null;
    }

    public static Object getCellObject(Cell cell) {
        if (null != cell) {
            switch (cell.getCellType()) {

                case BLANK:
                    return null;

                case BOOLEAN:
                    return cell.getBooleanCellValue();

                case NUMERIC:
                    Double db = cell.getNumericCellValue();
                    if ((db - db.longValue()) == 0) {
                        return db.longValue();
                    }
                    return db;

                default:
                    return getCellString(cell);
            }
        }
        return null;
    }

    public static String getCellAsString(Cell cell) {
        if (null != cell) {
            Object value = getCellObject(cell);
            if (null != value) {
                return String.valueOf(value);
            }
        }
        return null;
    }

    public static String getCellString(Cell cell) {
        if (null != cell) {
            RichTextString richTextString = cell.getRichStringCellValue();
            if (null != richTextString) {
                if (richTextString.getString().trim().equals("")) {
                    return null;
                }
                return richTextString.getString().trim();
            }
        }
        return null;
    }

    public static String getCellDateString(Cell cell) {
        if (null != cell) {
            if (cell.getCellType() != CellType.BLANK) {
                Date date = cell.getDateCellValue();
                return DateFormatUtil.toDateString(date);
            }
        }
        return null;
    }

    public static Date getCellDate(String value) {
        if (null != value) {
            try {
                return DateUtil.getJavaDate(Double.parseDouble(value));
            } catch (Exception e) {
                logger.error("value=" + value, e);
            }
        }
        return null;
    }

    public static void setCellString(CreationHelper helper, Cell cell, String string) {
        // cell.setEncoding(Cell.ENCODING_UTF_16);//handle Chinese now
        // automatically handles Unicode without forcing the encoding.
        if (null != cell) {
            RichTextString value = helper.createRichTextString(string);
            cell.setCellValue(value);
        }
    }

    private static CellStyle createCellStyle(Workbook workbook, short fillForegroundColor) {
        if (null == workbook) {
            return null;
        }
        CellStyle cellStyle = workbook.createCellStyle();
        cellStyle.setWrapText(true);

        cellStyle.setFillForegroundColor(fillForegroundColor);
        cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        return cellStyle;
    }

    public static CellStyle createCellStyle(Workbook workbook, IndexedColors fillForegroundColor) {
        return createCellStyle(workbook, (null == fillForegroundColor) ? IndexedColors.YELLOW.getIndex() : fillForegroundColor.getIndex());
    }

    public static CellStyle createErrorCellStyle(Workbook workbook) {
        return createCellStyle(workbook, IndexedColors.YELLOW.getIndex());

    }

    public static Row firstRowOnFirstSheet(Workbook workbook) {
        if (null == workbook) {
            return null;
        }
        Sheet sheet = workbook.getSheetAt(0);
        if (null == sheet) {
            return null;
        }
        return sheet.getRow(0);

    }

    public static Workbook createWorkbook(String fileExtension) {
        Workbook workbook = null;
        if (XLS.equalsIgnoreCase(fileExtension)) {
            workbook = new HSSFWorkbook();
        } else if (XLSX.equalsIgnoreCase(fileExtension)) {
            workbook = new XSSFWorkbook();
        }
        return workbook;
    }

    public static Workbook createWorkbook(String fileExtension, List<List<?>> data) {
        Workbook workbook = null;
        if (XLS.equalsIgnoreCase(fileExtension)) {
            workbook = new HSSFWorkbook();
        } else if (XLSX.equalsIgnoreCase(fileExtension)) {
            workbook = new XSSFWorkbook();
        } else {
            throw new RuntimeException("unsupported excel format !");
        }
        CellStyle cellStyle = fomatStyle(workbook, IndexedColors.BLUE.getIndex(), IndexedColors.LIGHT_TURQUOISE.getIndex(), HorizontalAlignment.LEFT);
        CellStyle header = fomatStyle(workbook, IndexedColors.RED.getIndex(), IndexedColors.YELLOW.getIndex(), HorizontalAlignment.CENTER);
        return createWorkbook(data, workbook, header, cellStyle);
    }

    public static void addSheet(List<List<?>> data, Workbook workbook) {
        addSheet(data, workbook, null);
    }

    public static void addSheet(List<List<?>> data, Workbook workbook, String sheetName) {
        CellStyle cellStyle = fomatStyle(workbook, IndexedColors.BLUE.getIndex(), IndexedColors.LIGHT_TURQUOISE.getIndex(), HorizontalAlignment.LEFT);
        CellStyle headerCell = fomatStyle(workbook, IndexedColors.RED.getIndex(), IndexedColors.YELLOW.getIndex(), HorizontalAlignment.CENTER);
        addSheet(data, workbook, headerCell, cellStyle, sheetName);
    }

    public static void addSheet(List<List<?>> data, Workbook workbook, CellStyle headerCell, CellStyle cellStyle, String sheetName) {
        Sheet sheet;
        if (sheetName == null) {
            sheet = workbook.createSheet();
        } else {
            sheet = workbook.createSheet(sheetName);
        }
        if (data == null || data.isEmpty()) {
            return;
        }
        // 表头
        Row columnRow = sheet.createRow(0);
        List<?> columns = data.get(0);
        for (Object v : columns) {
            createMergedRegion2Cell(sheet, columnRow, v, headerCell);
        }
        // 数据
        for (int i = 1; i < data.size(); i++) {
            Row row = sheet.createRow(i);
            List<?> rowData = data.get(i);
            for (Object v : rowData) {
                createMergedRegion2Cell(sheet, row, v, cellStyle);
            }
        }
    }

    public static Workbook createWorkbook(List<List<?>> data, Workbook workbook, CellStyle headerCell, CellStyle cellStyle) {
        if (data == null || data.isEmpty()) {
            return workbook;
        }
        addSheet(data, workbook);
        return workbook;
    }

    public static void createRow(CreationHelper helper, Row row, List<Object> rowValues, CellStyle cellStyle) {
        for (Object v : rowValues) {
            createCell(helper, row, v, cellStyle);
        }
    }

    @SuppressWarnings("unchecked")
    public static void createMergedRegion2Cell(Sheet sheet, Row row, Object value, CellStyle cellStyle) {
        CreationHelper helper = sheet.getWorkbook().getCreationHelper();
        if (value instanceof Map) {
            Map<String, Object> mapValue = (Map<String, Object>) value;
            Object colspan = mapValue.get("colspan");
            createCell(helper, row, mapValue.get("value"), cellStyle);
            if (colspan instanceof Integer) {
                int rowFrom = sheet.getLastRowNum();
                int rowTo = sheet.getLastRowNum();
                short colFrom = sheet.getRow(sheet.getLastRowNum()).getLastCellNum();
                short colTo = (short) (colFrom + ((Integer) colspan).shortValue());

                CellRangeAddress region = new CellRangeAddress(rowFrom, colFrom, rowTo, colTo);
                sheet.addMergedRegion(region);
                for (int i = colFrom; i < colTo; i++) {
                    createCell(helper, row, "", cellStyle);
                }

            }
        } else {
            createCell(helper, row, value, cellStyle);
        }

    }

    public static void createCell(CreationHelper helper, Row row, Object value, CellStyle cellStyle) {
        Cell cell = row.createCell(row.getPhysicalNumberOfCells());
        String v = null;
        if (value == null) {
            v = "";
        } else {
            v = String.valueOf(value);
        }
        RichTextString valueString = helper.createRichTextString(v);
        cell.setCellValue(valueString);
        cell.setCellStyle(cellStyle);
    }

    public static CellStyle fomatStyle(Workbook workbook, short fontColor, short cellColor, boolean isHead) {


        CellStyle style = workbook.createCellStyle();
        style.setAlignment(HorizontalAlignment.LEFT);
        style.setVerticalAlignment(VerticalAlignment.CENTER);

        style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        style.setFillForegroundColor(cellColor);
        style.setFillBackgroundColor(cellColor);

        style.setWrapText(true);

        style.setBottomBorderColor(cellColor);
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);
        style.setBorderTop(BorderStyle.THIN);

        Font font = workbook.createFont();
        font.setFontName("宋体");
        font.setBold(false);
        font.setFontHeight((short) 200);
        font.setColor(fontColor);
        if (isHead) {
            font.setBold(true);
        }
        style.setFont(font);
        return style;
    }

    public static CellStyle fomatStyle(Workbook workbook, short fontColor, short cellColor, HorizontalAlignment align) {
        Font font = workbook.createFont();
        font.setFontName("SimSun");
        font.setBold(false);
        font.setFontHeight((short) 200);
        font.setColor(fontColor);

        CellStyle style = workbook.createCellStyle();
        style.setAlignment(align);
        style.setVerticalAlignment(VerticalAlignment.CENTER);

        style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        style.setFillForegroundColor(cellColor);
        style.setFillBackgroundColor(cellColor);

        style.setWrapText(true);

        style.setBottomBorderColor(cellColor);
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);
        style.setBorderTop(BorderStyle.THIN);

        // 设置字体
        style.setFont(font);
        return style;
    }
}
