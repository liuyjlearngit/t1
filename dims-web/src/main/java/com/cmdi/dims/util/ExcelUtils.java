package com.cmdi.dims.util;

import com.cmdi.dims.app.dto.ExcelDownData;
import com.cmdi.dims.data.entity.DataStorage;
import com.cmdi.dims.task.entity.ResStatistics;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class ExcelUtils {
    /**
     * 导出学校信息，有多个工作表sheet
     * @param request
     * @param response
     */
    public static void exportExcel(HttpServletRequest request, HttpServletResponse response,List<String> speciality, Map<String, List<ExcelDownData>> collect) throws IOException {
        /** 第一步，创建一个Workbook，对应一个Excel文件  */
        HSSFWorkbook wb = new HSSFWorkbook();

        /////
        String templateName = "导出模板.xls";
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/vnd.ms-excel");
        //输出文件名
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Content-Type", "application/octet-stream;charset=utf-8"); // 告诉浏览器输出内容为流
        response.setHeader("Content-Disposition",
                "attachment;filename=" + URLEncoder.encode(templateName, "UTF-8"));
        ServletOutputStream stream = response.getOutputStream();


        for (String specia:speciality) {
            List<ExcelDownData> excelDownData = collect.get(specia);
            createExcelSheet(wb,specia,excelDownData.get(0));
        }



        if (null != wb && null != stream) {
            wb.write(stream);
            // 将数据写出去
            wb.close();
            stream.close();
        }
    }

    /**
     * 生成单个工作表
     *
     *
     */

    public static void exportExcels(HttpServletRequest request, HttpServletResponse response,Map<String, List<DataStorage>> collect,String[] stringsName) throws IOException, ParseException {
        /** 第一步，创建一个Workbook，对应一个Excel文件  */
        HSSFWorkbook wb = new HSSFWorkbook();

        /////
        String templateName = "导出模板.xls";
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/vnd.ms-excel");
        //输出文件名
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Content-Type", "application/octet-stream;charset=utf-8"); // 告诉浏览器输出内容为流
        response.setHeader("Content-Disposition",
                "attachment;filename=" + URLEncoder.encode(templateName, "UTF-8"));
        ServletOutputStream stream = response.getOutputStream();


        for (Map.Entry<String, List<DataStorage>> colle:collect.entrySet()){
            if (colle.getValue().size()>5){
                int n=0;
                ArrayList<DataStorage> arrayList= new ArrayList<DataStorage>();
                for (DataStorage dataStorage:colle.getValue()) {
                    arrayList.add(dataStorage);

                    if (arrayList.size()==60000){
                        n++;
                        String name=colle.getKey()+"_"+n;
                        createExcelSheets(wb,name,arrayList,stringsName);
                        arrayList=new ArrayList<DataStorage>();
                    }
                }
                if (arrayList.size()!=0){
                    n++;
                    String name=colle.getKey()+"_"+n;
                    createExcelSheets(wb,name,arrayList,stringsName);
                    arrayList=new ArrayList<DataStorage>();
                }
            }else {
                createExcelSheets(wb,colle.getKey(),colle.getValue(),stringsName);
            }
        }



        if (null != wb && null != stream) {
            wb.write(stream);
            // 将数据写出去
            wb.close();
            stream.close();
        }
    }

    private static void createExcelSheet(HSSFWorkbook wb, String sheetName, ExcelDownData excelDownData){
        /** 第二步，在Workbook中添加一个sheet,对应Excel文件中的sheet  */
        HSSFSheet sheet = wb.createSheet(sheetName);

        /** 第三步，设置样式以及字体样式*/
        HSSFCellStyle titleStyle = createTitleCellStyle(wb);
        HSSFCellStyle headerStyle = createHeadCellStyle(wb);
        HSSFCellStyle contentStyle = createContentCellStyle(wb);

        if (excelDownData.getStrings()==null){
            int rowNum = 0;
            // 创建第一页的第一行，索引从0开始
            HSSFRow row0 = sheet.createRow(rowNum++);
            row0.setHeight((short) 800);// 设置行高

            HSSFCell c00 = row0.createCell(0);
            c00.setCellValue(excelDownData.getSpeciality()+"资源为空");
            c00.setCellStyle(headerStyle);
            return;
        }
        /** 第四步，创建标题 ,合并标题单元格 */
        // 行号
        int rowNum = 0;
        // 创建第一页的第一行，索引从0开始
        HSSFRow row0 = sheet.createRow(rowNum++);
        row0.setHeight((short) 800);// 设置行高

        HSSFCell c00 = row0.createCell(0);
        c00.setCellValue("资源对象");
        c00.setCellStyle(headerStyle);

        ArrayList<String> strings = excelDownData.getStrings();//第一行数据
        ArrayList<Integer> onenum = excelDownData.getOnenum();//第一行数量
        ArrayList<String> stringss = excelDownData.getStringss();//第二行数据   他的size是总长度
        HashMap<String, List<Integer>> alldata = excelDownData.getAlldata();//地址数据
        List<Integer> allDatas = excelDownData.getAllDatas();//总计

        //第一行 数据开始
        String[] row_first = new String[stringss.size()];
        Integer integer=0;
        Integer[] integers = new Integer[stringss.size()];
        for (int i=0;i<strings.size();i++){
            integers[i]=integer;
            row_first[integer]=strings.get(i);
            integer+= onenum.get(i);
        }
        integers[strings.size()]=integer;

        for (int i=0;i<row_first.length;i++){
            HSSFCell tempCell = row0.createCell(i+1);
            tempCell.setCellValue(row_first[i]);
            tempCell.setCellStyle(headerStyle);
        }

        // 合并单元格，参数依次为起始行，结束行，起始列，结束列 （索引0开始）
        // 合并
        for (int i=0;i<strings.size();i++){
            if (i==0){
                if (integers[i+1]==1){

                }else {
                    sheet.addMergedRegion(new CellRangeAddress(0, 0, 1, integers[i+1]));
                }

            }else {
                sheet.addMergedRegion(new CellRangeAddress(0, 0, integers[i]+1, integers[i+1]));
            }

        }

        //第二行
        HSSFRow row2 = sheet.createRow(rowNum++);
        row2.setHeight((short) 700);

        HSSFCell cell = row2.createCell(0);
        cell.setCellValue("统计指标");
        cell.setCellStyle(headerStyle);

        for (int i = 0; i < stringss.size(); i++) {
            HSSFCell tempCell = row2.createCell(i+1);
            tempCell.setCellValue(stringss.get(i));
            tempCell.setCellStyle(headerStyle);
        }

        //第三行  地址开始
        for (Map.Entry<String, List<Integer>> colless:alldata.entrySet()){
            HSSFRow data = sheet.createRow(rowNum++);
            data.setHeight((short) 700);

            HSSFCell dataCell = data.createCell(0);
            dataCell.setCellValue(colless.getKey());
            dataCell.setCellStyle(headerStyle);

            List<Integer> value = colless.getValue();
            for (int i = 0; i < value.size(); i++) {
                HSSFCell tempCell = data.createCell(i+1);
                tempCell.setCellValue(value.get(i));
                tempCell.setCellStyle(headerStyle);
            }
        }

        //最后一行
        HSSFRow end = sheet.createRow(rowNum++);
        end.setHeight((short) 700);

        HSSFCell ends = end.createCell(0);
        ends.setCellValue("总计");
        ends.setCellStyle(headerStyle);

        for (int i = 0; i < allDatas.size(); i++) {
            HSSFCell tempCell = end.createCell(i+1);
            tempCell.setCellValue(allDatas.get(i));
            tempCell.setCellStyle(headerStyle);
        }

    }

    private static void createExcelSheets(HSSFWorkbook wb, String sheetName, List<DataStorage> list,String[] stringsName) throws ParseException {
        /** 第二步，在Workbook中添加一个sheet,对应Excel文件中的sheet  */
        HSSFSheet sheet = wb.createSheet(sheetName);

        /** 第三步，设置样式以及字体样式*/
        HSSFCellStyle titleStyle = createTitleCellStyle(wb);
        HSSFCellStyle headerStyle = createHeadCellStyle(wb);
        HSSFCellStyle contentStyle = createContentCellStyle(wb);

        List<DataStorage> list1 = list;
        if (list1.size()==0){
            int rowNum = 0;
            // 创建第一页的第一行，索引从0开始
            HSSFRow row0 = sheet.createRow(rowNum++);
            row0.setHeight((short) 800);// 设置行高

            HSSFCell c00 = row0.createCell(0);
            c00.setCellValue(sheetName+"没有错误数据");
            c00.setCellStyle(headerStyle);
            return;
        }
        /** 第四步，创建标题 ,合并标题单元格 */
        // 行号
        int rowNum = 0;
        // 创建第一页的第一行，索引从0开始
        HSSFRow row0 = sheet.createRow(rowNum++);
        row0.setHeight((short) 800);// 设置行高

        //第一行 数据开始

        for (int i=0;i<stringsName.length;i++){
            HSSFCell tempCell = row0.createCell(i);
            tempCell.setCellValue(stringsName[i]);
            tempCell.setCellStyle(headerStyle);
        }

        ListSort(list1);

        //下面数据


//下面行
        for (DataStorage datastor:list1) {
            HSSFRow row = sheet.createRow(rowNum++);//创建行
            row.setHeight((short) 800);// 设置行高

            String[] split = datastor.getData().split("\\^");
            String s = split[split.length - 1];
            String s2 = split[split.length - 2];
            String errorname="";
            for (int i=0;i<split.length-2;i++){
                errorname+=split[i]+"^";
            }
            errorname = errorname.substring(0, errorname.length() - 1);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String createdAt = datastor.getCreatedAt();
            Date parse = format.parse(createdAt);
            String format1 = format.format(parse);
            String[] data={format1,datastor.getSpecialityName(),datastor.getTableName(),errorname,s2,s};
            for (int i=0;i<6;i++){
                HSSFCell ro = row.createCell(i);
                ro.setCellValue(data[i]);
                ro.setCellStyle(headerStyle);
            }

        }

    }

    //时间排序
    private static void ListSort(List<DataStorage> list) {
        Collections.sort(list, new Comparator<DataStorage>() {
            @Override
            //定义一个比较器
            public int compare(DataStorage o1, DataStorage o2) {
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    Date dt1 = format.parse(o1.getCreatedAt());
                    Date dt2 = format.parse(o2.getCreatedAt());
                    if (dt1.getTime() > dt2.getTime()) {
                        return 1;
                    } else if (dt1.getTime() < dt2.getTime()) {
                        return -1;
                    } else {
                        return 0;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return 0;
            }
        });
    }

    private static HSSFCellStyle createTitleCellStyle(HSSFWorkbook wb) {
        HSSFCellStyle cellStyle = wb.createCellStyle();
        cellStyle.setAlignment(HorizontalAlignment.CENTER);//水平居中
        cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);//垂直对齐
        cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        cellStyle.setFillForegroundColor(IndexedColors.GREY_40_PERCENT.getIndex());//背景颜色
        HSSFFont headerFont1 = (HSSFFont) wb.createFont(); // 创建字体样式
        headerFont1.setBold(true); //字体加粗
        headerFont1.setFontName("黑体"); // 设置字体类型
        headerFont1.setFontHeightInPoints((short) 15); // 设置字体大小
        cellStyle.setFont(headerFont1); // 为标题样式设置字体样式

        return cellStyle;
    }

    /**
     * 创建表头样式
     * @param wb
     * @return
     */
    private static HSSFCellStyle createHeadCellStyle(HSSFWorkbook wb) {
        HSSFCellStyle cellStyle = wb.createCellStyle();
        cellStyle.setWrapText(true);// 设置自动换行
        cellStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());//背景颜色
        cellStyle.setAlignment(HorizontalAlignment.CENTER); //水平居中
        cellStyle.setVerticalAlignment(VerticalAlignment.CENTER); //垂直对齐
        cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        cellStyle.setBottomBorderColor(IndexedColors.BLACK.index);
        cellStyle.setBorderBottom(BorderStyle.THIN); //下边框
        cellStyle.setBorderLeft(BorderStyle.THIN); //左边框
        cellStyle.setBorderRight(BorderStyle.THIN); //右边框
        cellStyle.setBorderTop(BorderStyle.THIN); //上边框

        HSSFFont headerFont = (HSSFFont) wb.createFont(); // 创建字体样式
        headerFont.setBold(true); //字体加粗
        headerFont.setFontName("黑体"); // 设置字体类型
        headerFont.setFontHeightInPoints((short) 12); // 设置字体大小
        cellStyle.setFont(headerFont); // 为标题样式设置字体样式

        return cellStyle;
    }

    /**
     * 创建内容样式
     * @param wb
     * @return
     */
    private static HSSFCellStyle createContentCellStyle(HSSFWorkbook wb) {
        HSSFCellStyle cellStyle = wb.createCellStyle();
        cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);// 垂直居中
        cellStyle.setAlignment(HorizontalAlignment.CENTER);// 水平居中
        cellStyle.setWrapText(true);// 设置自动换行
        cellStyle.setBorderBottom(BorderStyle.THIN); //下边框
        cellStyle.setBorderLeft(BorderStyle.THIN); //左边框
        cellStyle.setBorderRight(BorderStyle.THIN); //右边框
        cellStyle.setBorderTop(BorderStyle.THIN); //上边框

        // 生成12号字体
        HSSFFont font = wb.createFont();
        font.setColor((short)8);
        font.setFontHeightInPoints((short) 12);
        cellStyle.setFont(font);

        return cellStyle;
    }
}
