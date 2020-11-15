package com.cmdi.dims.util;

import com.cmdi.dims.app.dto.DownExcel;
import com.cmdi.dims.app.dto.SpecificationsDto;
import com.cmdi.dims.index.entity.Index;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

public class ExportExcelUtils {

    public static String exportExcel(HttpServletResponse response, List<String> speciality, List<String> collect, Map<String, List<Index>> collect1, Map<String, List<DownExcel>> collect2, String site, HashMap<String, SpecificationsDto> specialitytypes, ArrayList<String> types) throws IOException {
            //speciality 所有专业
            //collect 有哪些专业编码
            //collect1 专业 键  包含哪些专业
        //collect2  键 省   值 每个专业和数据
        // site 空 还是 全国
        //specialitytypes 专业 和 他的 数据
        //types  排好了 的 专业指标

        HashMap<Integer, Integer> integerIntegerHashMap = new HashMap<>();
        int j=1;
        String str="";
        for (String speciali:speciality) {
            List<Index> indices = collect1.get(speciali);
            int size = indices.size();
            integerIntegerHashMap.put(j,size);
            j++;
            if (speciality.get(0).equals(speciali)){
                str=speciali;
            }else {
                str+="_"+speciali;
            }
        }

        //获取当前时间
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = formatter.format(currentTime);
        site=site.equals("")?"全国":site;
        String name=""+site+"-"+str+"-"+"核查指标统计-"+dateString;

        /**
         *  导出excel （HSSFWorkbook）
         */

            /** 第一步，创建一个Workbook，对应一个Excel文件  */
            HSSFWorkbook wb = new HSSFWorkbook();

            /** 第二步，在Workbook中添加一个sheet,对应Excel文件中的sheet  */
            HSSFSheet sheet = wb.createSheet("excel导出指标详情");

            /** 第三步，设置样式以及字体样式*/
            HSSFCellStyle titleStyle = createTitleCellStyle(wb);
            HSSFCellStyle headerStyle = createHeadCellStyle(wb);
            HSSFCellStyle contentStyle = createContentCellStyle(wb);

            /** 第四步，创建标题 ,合并标题单元格 */
            // 行号
            int rowNum = 0;
            // 创建第一页的第一行，索引从0开始
            HSSFRow row0 = sheet.createRow(rowNum++);
            row0.setHeight((short) 800);// 设置行高

            String title = name;
            HSSFCell c00 = row0.createCell(0);
            c00.setCellValue(title);
            c00.setCellStyle(titleStyle);
            // 合并单元格，参数依次为起始行，结束行，起始列，结束列 （索引0开始）
            sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, collect.size()));//标题合并单元格操作，6为总列数

            // 第二行
            HSSFRow row1 = sheet.createRow(rowNum++);
            row1.setHeight((short) 500);
            HSSFCell tempCell1 = row1.createCell(0);
            tempCell1.setCellValue("专业");
            tempCell1.setCellStyle(headerStyle);

            String[] row_first = new String[collect.size()];
            Integer integer=0;
        Integer[] integers = new Integer[collect.size()];
        for (int i=0;i<speciality.size();i++){
            integers[i]=integer;
                row_first[integer]=speciality.get(i);
                integer+=integerIntegerHashMap.get(i + 1);
            }
        integers[speciality.size()]=integer;

            for (int i=0;i<row_first.length;i++){
                HSSFCell tempCell = row1.createCell(i+1);
                tempCell.setCellValue(row_first[i]);
                tempCell.setCellStyle(headerStyle);
            }

            // 合并
        for (int i=0;i<speciality.size();i++){
            if (i==0){
                sheet.addMergedRegion(new CellRangeAddress(1, 1, 1, integers[i+1]));
            }else {
                sheet.addMergedRegion(new CellRangeAddress(1, 1, integers[i]+1, integers[i+1]));
            }

        }



            //第三行
            HSSFRow row2 = sheet.createRow(rowNum++);
            row2.setHeight((short) 700);

        HSSFCell cell = row2.createCell(0);
        cell.setCellValue("指标");
        cell.setCellStyle(headerStyle);
        for (int i = 0; i < types.size(); i++) {
                HSSFCell tempCell = row2.createCell(i+1);
                tempCell.setCellValue(types.get(i));
                tempCell.setCellStyle(headerStyle);
            }


            // 合并
        HSSFRow tempRowg = sheet.createRow(rowNum++);
        tempRowg.setHeight((short) 500);


            if (site.equals("")){//全国
                HSSFCell tempCelln = tempRowg.createCell(0);
                tempCelln.setCellValue("全国");
                tempCelln.setCellStyle(headerStyle);
            }else {
                HSSFCell tempCelln = tempRowg.createCell(0);
                tempCelln.setCellValue(site);
                tempCelln.setCellStyle(headerStyle);
            }
            //第三行
            int nums=1;
            for (String speciali:speciality) {
                SpecificationsDto specificationsDtos = specialitytypes.get(speciali);

                if (specificationsDtos.getTotalValue()==null){


                }else {
                    HSSFCell tempCell = tempRowg.createCell(nums++);
                    tempCell.setCellValue(specificationsDtos.getTotalValue());
                    tempCell.setCellStyle(headerStyle);
                }

                if (specificationsDtos.getIntegrityValue()==null){


                }else {
                    HSSFCell tempCell = tempRowg.createCell(nums++);
                    tempCell.setCellValue(specificationsDtos.getIntegrityValue());
                    tempCell.setCellStyle(headerStyle);
                }

                if (specificationsDtos.getNormativityValue()==null){


                }else {
                    HSSFCell tempCell = tempRowg.createCell(nums++);
                    tempCell.setCellValue(specificationsDtos.getNormativityValue());
                    tempCell.setCellStyle(headerStyle);
                }

                if (specificationsDtos.getAssociationValue()==null){


                }else {
                    HSSFCell tempCell = tempRowg.createCell(nums++);
                    tempCell.setCellValue(specificationsDtos.getAssociationValue());
                    tempCell.setCellStyle(headerStyle);
                }

                if (specificationsDtos.getComplianceValue()==null){


                }else {
                    HSSFCell tempCell = tempRowg.createCell(nums++);
                    tempCell.setCellValue(specificationsDtos.getComplianceValue());
                    tempCell.setCellStyle(headerStyle);
                }
            }


            //循环每一行数据
            List<Map<String, Object>> dataList = new ArrayList<Map<String, Object>>(); //查询出来的数据
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("name", "测试名称1");
            map.put("r1", "111");
            map.put("r2", "222");
            map.put("r3", "333");
            map.put("r4", "444");
            map.put("r5", "555");
            map.put("r6", "666");
            dataList.add(map);
            dataList.add(map);//加多一条list



        for (Map.Entry<String, List<DownExcel>> colle:collect2.entrySet()){//

            HSSFRow tempRow = sheet.createRow(rowNum++);
            tempRow.setHeight((short) 500);

            HSSFCell tempCelln = tempRow.createCell(0);
            tempCelln.setCellValue(colle.getKey());
            tempCelln.setCellStyle(headerStyle);

            List<DownExcel> value = colle.getValue();
            int num=1;
            for (DownExcel values:value) {
                SpecificationsDto specificationsDtos = values.getSpecificationsDtos();
                if (specificationsDtos.getTotalValue()==null){
                    HSSFCell tempCell = tempRow.createCell(num++);
                    tempCell.setCellValue("无数据");
                    tempCell.setCellStyle(headerStyle);
                }else if (specificationsDtos.getTotalValue()==999){

                }else {
                    HSSFCell tempCell = tempRow.createCell(num++);
                    tempCell.setCellValue(specificationsDtos.getTotalValue());
                    tempCell.setCellStyle(headerStyle);
                }

                if (specificationsDtos.getIntegrityValue()==null){
                    HSSFCell tempCell = tempRow.createCell(num++);
                    tempCell.setCellValue("无数据");
                    tempCell.setCellStyle(headerStyle);
                }else if (specificationsDtos.getIntegrityValue()==999){

                }else {
                    HSSFCell tempCell = tempRow.createCell(num++);
                    tempCell.setCellValue(specificationsDtos.getIntegrityValue());
                    tempCell.setCellStyle(headerStyle);
                }

                if (specificationsDtos.getNormativityValue()==null){
                    HSSFCell tempCell = tempRow.createCell(num++);
                    tempCell.setCellValue("无数据");
                    tempCell.setCellStyle(headerStyle);
                }else if (specificationsDtos.getNormativityValue()==999){

                }else {
                    HSSFCell tempCell = tempRow.createCell(num++);
                    tempCell.setCellValue(specificationsDtos.getNormativityValue());
                    tempCell.setCellStyle(headerStyle);
                }

                if (specificationsDtos.getAssociationValue()==null){
                    HSSFCell tempCell = tempRow.createCell(num++);
                    tempCell.setCellValue("无数据");
                    tempCell.setCellStyle(headerStyle);
                }else if (specificationsDtos.getAssociationValue()==999){

                }else {
                    HSSFCell tempCell = tempRow.createCell(num++);
                    tempCell.setCellValue(specificationsDtos.getAssociationValue());
                    tempCell.setCellStyle(headerStyle);
                }

                if (specificationsDtos.getComplianceValue()==null){
                    HSSFCell tempCell = tempRow.createCell(num++);
                    tempCell.setCellValue("无数据");
                    tempCell.setCellStyle(headerStyle);
                }else if (specificationsDtos.getComplianceValue()==999){

                }else {
                    HSSFCell tempCell = tempRow.createCell(num++);
                    tempCell.setCellValue(specificationsDtos.getComplianceValue());
                    tempCell.setCellStyle(headerStyle);
                }


            }
        }






            //导出

//            String fileName = "报表名称.xls";
//
//            try {
//                fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
////                response.setContentType("application/vnd.ms-excel");
////                response.setCharacterEncoding("UTF-8");
////                response.setHeader("Content-disposition", "attachment;filename=\"" + fileName + "\"");
//
//                response.setCharacterEncoding("utf-8");
//                response.setContentType("application/vnd.ms-excel");
//                response.addHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\"");
//                OutputStream stream = response.getOutputStream();
        String templateName = "导出模板.xls";
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/vnd.ms-excel");
        //输出文件名
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Content-Type", "application/octet-stream;charset=utf-8"); // 告诉浏览器输出内容为流
        response.setHeader("Content-Disposition",
                "attachment;filename=" + URLEncoder.encode(templateName, "UTF-8"));
        ServletOutputStream stream = response.getOutputStream();

        if (null != wb && null != stream) {
                    wb.write(stream);
                    // 将数据写出去
                    wb.close();
                    stream.close();
                }

        return templateName;

        }

    /**
     * 创建标题样式
     * @param wb
     * @return
     */
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

    public static Double avarage(Double substring){
        BigDecimal b   =   new BigDecimal(substring);
        double   f1   =   b.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue();
        return f1;
    }

    public static void exportExcelHead(HttpServletResponse response, ArrayList<String> one, ArrayList<Integer> num, HashMap<String, ArrayList<Double>> hashMap,String site,List<String> speciality,ArrayList<Double> three) throws IOException {
        HashMap<Integer, Integer> integerIntegerHashMap = new HashMap<>();
        int j=1;
        String str="";
        for (String speciali:speciality) {

            if (speciality.get(0).equals(speciali)){
                str=speciali;
            }else {
                str+="_"+speciali;
            }
        }

        //获取当前时间
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = formatter.format(currentTime);
        site=site.equals("")?"全国":site;
        String name=""+site+"-"+str+"-"+"核查指标统计-"+dateString;

        /**
         *  导出excel （HSSFWorkbook）
         */

        /** 第一步，创建一个Workbook，对应一个Excel文件  */
        HSSFWorkbook wb = new HSSFWorkbook();

        /** 第二步，在Workbook中添加一个sheet,对应Excel文件中的sheet  */
        HSSFSheet sheet = wb.createSheet("excel导出指标详情");

        /** 第三步，设置样式以及字体样式*/
        HSSFCellStyle titleStyle = createTitleCellStyle(wb);
        HSSFCellStyle headerStyle = createHeadCellStyle(wb);
        HSSFCellStyle contentStyle = createContentCellStyle(wb);

        /** 第四步，创建标题 ,合并标题单元格 */
        // 行号
        int rowNum = 0;
        // 创建第一页的第一行，索引从0开始
        HSSFRow row0 = sheet.createRow(rowNum++);
        row0.setHeight((short) 800);// 设置行高

        String title = name;
        HSSFCell c00 = row0.createCell(0);
        c00.setCellValue(title);
        c00.setCellStyle(titleStyle);
        // 合并单元格，参数依次为起始行，结束行，起始列，结束列 （索引0开始）
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, one.size()));//标题合并单元格操作，6为总列数

        // 第二行
        HSSFRow row1 = sheet.createRow(rowNum++);
        row1.setHeight((short) 500);
        HSSFCell tempCell1 = row1.createCell(0);
        tempCell1.setCellValue("专业");
        tempCell1.setCellStyle(headerStyle);

        String[] row_first = new String[one.size()];
        Integer integer=0;
        Integer[] integers = new Integer[one.size()];
        for (int i=0;i<speciality.size();i++){
            integers[i]=integer;
            row_first[integer]=speciality.get(i);
            integer+=num.get(i);
        }
        integers[speciality.size()]=integer;

        for (int i=0;i<row_first.length;i++){
            HSSFCell tempCell = row1.createCell(i+1);
            tempCell.setCellValue(row_first[i]);
            tempCell.setCellStyle(headerStyle);
        }

        // 合并
        for (int i=0;i<speciality.size();i++){
            if (i==0){
                sheet.addMergedRegion(new CellRangeAddress(1, 1, 1, integers[i+1]));
            }else {
                sheet.addMergedRegion(new CellRangeAddress(1, 1, integers[i]+1, integers[i+1]));
            }

        }



        //第三行
        HSSFRow row2 = sheet.createRow(rowNum++);
        row2.setHeight((short) 700);

        HSSFCell cell = row2.createCell(0);
        cell.setCellValue("指标");
        cell.setCellStyle(headerStyle);
        for (int i = 0; i < one.size(); i++) {
            HSSFCell tempCell = row2.createCell(i+1);
            tempCell.setCellValue(one.get(i));
            tempCell.setCellStyle(headerStyle);
        }


        // 合并
        HSSFRow tempRowg = sheet.createRow(rowNum++);
        tempRowg.setHeight((short) 500);


        if (site.equals("")){//全国
            HSSFCell tempCelln = tempRowg.createCell(0);
            tempCelln.setCellValue("全国");
            tempCelln.setCellStyle(headerStyle);
        }else {
            HSSFCell tempCelln = tempRowg.createCell(0);
            tempCelln.setCellValue(site);
            tempCelln.setCellStyle(headerStyle);
        }
        //第三行
        int i=1;
        for (Double doublethree:three) {
            HSSFCell tempCelln = tempRowg.createCell(i++);
            tempCelln.setCellValue(avarage(doublethree*100)+"%");
            tempCelln.setCellStyle(headerStyle);
        }

        for (Map.Entry<String, ArrayList<Double>> colle:hashMap.entrySet()){
            HSSFRow tempRow = sheet.createRow(rowNum++);
            tempRow.setHeight((short) 500);

            HSSFCell tempCelln = tempRow.createCell(0);
            tempCelln.setCellValue(colle.getKey());
            tempCelln.setCellStyle(headerStyle);

            ArrayList<Double> value = colle.getValue();
            int nums=1;
            for (Double doble:value) {
                if (doble==0.0){
                    HSSFCell tempCell = tempRow.createCell(nums++);
                    tempCell.setCellValue("无数据");
                    tempCell.setCellStyle(headerStyle);
                }else {
                    HSSFCell tempCell = tempRow.createCell(nums++);
                    tempCell.setCellValue(avarage(doble)+"%");
                    tempCell.setCellStyle(headerStyle);
                }
            }
        }
//
//
//
//        for (Map.Entry<String, List<DownExcel>> colle:collect2.entrySet()){//
//
//            HSSFRow tempRow = sheet.createRow(rowNum++);
//            tempRow.setHeight((short) 500);
//
//            HSSFCell tempCelln = tempRow.createCell(0);
//            tempCelln.setCellValue(colle.getKey());
//            tempCelln.setCellStyle(headerStyle);
//
//            List<DownExcel> value = colle.getValue();
//            int num=1;
//            for (DownExcel values:value) {
//                SpecificationsDto specificationsDtos = values.getSpecificationsDtos();
//                if (specificationsDtos.getTotalValue()==null){
//                    HSSFCell tempCell = tempRow.createCell(num++);
//                    tempCell.setCellValue("无数据");
//                    tempCell.setCellStyle(headerStyle);
//                }else if (specificationsDtos.getTotalValue()==999){
//
//                }else {
//                    HSSFCell tempCell = tempRow.createCell(num++);
//                    tempCell.setCellValue(specificationsDtos.getTotalValue());
//                    tempCell.setCellStyle(headerStyle);
//                }
//
//                if (specificationsDtos.getIntegrityValue()==null){
//                    HSSFCell tempCell = tempRow.createCell(num++);
//                    tempCell.setCellValue("无数据");
//                    tempCell.setCellStyle(headerStyle);
//                }else if (specificationsDtos.getIntegrityValue()==999){
//
//                }else {
//                    HSSFCell tempCell = tempRow.createCell(num++);
//                    tempCell.setCellValue(specificationsDtos.getIntegrityValue());
//                    tempCell.setCellStyle(headerStyle);
//                }
//
//                if (specificationsDtos.getNormativityValue()==null){
//                    HSSFCell tempCell = tempRow.createCell(num++);
//                    tempCell.setCellValue("无数据");
//                    tempCell.setCellStyle(headerStyle);
//                }else if (specificationsDtos.getNormativityValue()==999){
//
//                }else {
//                    HSSFCell tempCell = tempRow.createCell(num++);
//                    tempCell.setCellValue(specificationsDtos.getNormativityValue());
//                    tempCell.setCellStyle(headerStyle);
//                }
//
//                if (specificationsDtos.getAssociationValue()==null){
//                    HSSFCell tempCell = tempRow.createCell(num++);
//                    tempCell.setCellValue("无数据");
//                    tempCell.setCellStyle(headerStyle);
//                }else if (specificationsDtos.getAssociationValue()==999){
//
//                }else {
//                    HSSFCell tempCell = tempRow.createCell(num++);
//                    tempCell.setCellValue(specificationsDtos.getAssociationValue());
//                    tempCell.setCellStyle(headerStyle);
//                }
//
//                if (specificationsDtos.getComplianceValue()==null){
//                    HSSFCell tempCell = tempRow.createCell(num++);
//                    tempCell.setCellValue("无数据");
//                    tempCell.setCellStyle(headerStyle);
//                }else if (specificationsDtos.getComplianceValue()==999){
//
//                }else {
//                    HSSFCell tempCell = tempRow.createCell(num++);
//                    tempCell.setCellValue(specificationsDtos.getComplianceValue());
//                    tempCell.setCellStyle(headerStyle);
//                }
//
//
//            }
//        }






        //导出

//            String fileName = "报表名称.xls";
//
//            try {
//                fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
////                response.setContentType("application/vnd.ms-excel");
////                response.setCharacterEncoding("UTF-8");
////                response.setHeader("Content-disposition", "attachment;filename=\"" + fileName + "\"");
//
//                response.setCharacterEncoding("utf-8");
//                response.setContentType("application/vnd.ms-excel");
//                response.addHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\"");
//                OutputStream stream = response.getOutputStream();
        String templateName = "导出模板.xls";
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/vnd.ms-excel");
        //输出文件名
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Content-Type", "application/octet-stream;charset=utf-8"); // 告诉浏览器输出内容为流
        response.setHeader("Content-Disposition",
                "attachment;filename=" + URLEncoder.encode(templateName, "UTF-8"));
        ServletOutputStream stream = response.getOutputStream();

        if (null != wb && null != stream) {
            wb.write(stream);
            // 将数据写出去
            wb.close();
            stream.close();
        }
    }


}

