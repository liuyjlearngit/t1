package com.cmdi.dims.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cmdi.dims.common.util.ExcelUtil;
import com.cmdi.dims.meta.entity.AttributeType;
import com.cmdi.dims.meta.entity.Dictionary;
import com.cmdi.dims.meta.entity.DictionaryType;
import com.cmdi.dims.meta.entity.EntityType;
import com.cmdi.dims.task.dto.MetadataDto;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public class MetadataUtil {

    public static MetadataDto parseMetadata(Workbook workbook, int tabIdx, DictionaryTypeLoader loader) {
        MetadataDto metadataDto = null;
        Sheet sheet = workbook.getSheetAt(tabIdx);
        int totalRows = sheet.getPhysicalNumberOfRows();
        boolean entityTypeLocated = false;
        boolean attributeTypeLocated = false;
        for (int i = 0; i < totalRows; i++) {
            Row row = sheet.getRow(i);
            if (null == row) {
                continue;
            }
            if (!entityTypeLocated) {
                String value = ExcelUtil.getCellAsString(row.getCell(0));
                if ("数据库表定义".equalsIgnoreCase(value)) {
                    boolean tableStoreLocated = false;
                    Row tableStoreRow = sheet.getRow(i + 1);
                    if (null != tableStoreRow) {
                        String tableStoreTitle = ExcelUtil.getCellAsString(tableStoreRow.getCell(0));
                        if ("数据表存储：".equalsIgnoreCase(tableStoreTitle)) {
                            tableStoreLocated = true;
                        }
                    }
                    boolean tableTypeLocated = false;
                    Row tableTypeRow = sheet.getRow(i + 2);
                    if (null != tableTypeRow) {
                        String tableTypeTitle = ExcelUtil.getCellAsString(tableTypeRow.getCell(0));
                        if ("数据表类型：".equalsIgnoreCase(tableTypeTitle)) {
                            tableTypeLocated = true;
                        }
                    }
                    boolean tableNameLocated = false;
                    Row tableNameRow = sheet.getRow(i + 3);
                    if (null != tableNameRow) {
                        String tableNameTitle = ExcelUtil.getCellAsString(tableNameRow.getCell(0));
                        if ("数据表名称：".equalsIgnoreCase(tableNameTitle)) {
                            tableNameLocated = true;
                        }
                    }
                    boolean tableModelLocated = false;
                    Row tableModelRow = sheet.getRow(i + 4);
                    if (null != tableModelRow) {
                        String tableModelTitle = ExcelUtil.getCellAsString(tableModelRow.getCell(0));
                        if ("数据表建模类型：".equalsIgnoreCase(tableModelTitle)) {
                            tableModelLocated = true;
                        }
                    }
                    if (tableStoreLocated && tableTypeLocated && tableNameLocated && tableModelLocated) {
                        String tableName = ExcelUtil.getCellAsString(tableNameRow.getCell(1));
                        String entityTypeName = ExcelUtil.getCellAsString(tableNameRow.getCell(3));
                        String tableStore = ExcelUtil.getCellAsString(tableStoreRow.getCell(1));
                        String tableType = ExcelUtil.getCellAsString(tableTypeRow.getCell(1));
                        String tableModel = ExcelUtil.getCellAsString(tableModelRow.getCell(1));
                        if (StringUtils.isNotEmpty(tableName)) {
                            entityTypeLocated = true;
                            i = i + 4;
                            metadataDto = new MetadataDto();
                            EntityType entityType = new EntityType();
                            entityType.setName(entityTypeName);
                            entityType.setCode(tableName.toUpperCase());
                            entityType.setExtensionTable(tableName.toUpperCase());
                            entityType.setVersion(1L);
                            List<String> memo = new ArrayList<>();
                            memo.add("数据表存储:" + tableStore);
                            memo.add("数据表类型:" + tableType);
                            memo.add("数据表建模类型:" + tableModel);
                            entityType.setMemo(StringUtils.join(memo, ","));
                            metadataDto.setEntityType(entityType);
                            metadataDto.setAttributeTypes(new ArrayList<>());
                        }
                    }
                }
            } else if (!attributeTypeLocated) {
                String value = ExcelUtil.getCellAsString(row.getCell(0));
                if ("属性".equalsIgnoreCase(value)) {
                    Row nextTitleRow = sheet.getRow(i + 1);
                    String titleDataSource = ExcelUtil.getCellAsString(nextTitleRow.getCell(1));
                    String titleColumnName = ExcelUtil.getCellAsString(nextTitleRow.getCell(2));
                    String titleDataType = ExcelUtil.getCellAsString(nextTitleRow.getCell(3));
                    if ("数据来源".equalsIgnoreCase(titleDataSource)
                            && "数据库属性名称".equalsIgnoreCase(titleColumnName)
                            && "数据库字段类型".equalsIgnoreCase(titleDataType)) {
                        attributeTypeLocated = true;
                        i++;
                    }
                }
            } else {
                String attributeName = ExcelUtil.getCellAsString(row.getCell(0));
                String dataSource = ExcelUtil.getCellAsString(row.getCell(1));
                String columnName = ExcelUtil.getCellAsString(row.getCell(2));
                String dataType = ExcelUtil.getCellAsString(row.getCell(3));
                String nullable = ExcelUtil.getCellAsString(row.getCell(4));
                String memo = ExcelUtil.getCellAsString(row.getCell(5));

                if (StringUtils.isNotEmpty(columnName) && StringUtils.isNotEmpty(dataType) && StringUtils.isNotEmpty(attributeName)) {
                    AttributeType attributeType = new AttributeType();
                    attributeType.setName(attributeName);
                    attributeType.setCode(columnName);
                    attributeType.setColumnName(columnName);
                    int parenthesesLeft = dataType.indexOf("(");
                    parenthesesLeft = parenthesesLeft >= 0 ? parenthesesLeft : dataType.indexOf("（");
                    int parenthesesRight = dataType.indexOf(")");
                    parenthesesRight = parenthesesRight >= 0 ? parenthesesRight : dataType.indexOf("）");
                    int enumIndex = dataType.indexOf("enum");
                    String realDataType = null;
                    String dictionaryTypeCode = null;
                    if (parenthesesLeft >= 0) {
                        realDataType = StringUtils.trim(dataType.substring(0, parenthesesLeft));
                        if (enumIndex >= 0 && parenthesesRight >= 0 && enumIndex < parenthesesRight) {
                            dictionaryTypeCode = StringUtils.trim(dataType.substring(enumIndex + 5, parenthesesRight));
                        }
                    }
                    if (StringUtils.isNotEmpty(dictionaryTypeCode)) {
                        DictionaryType dictionaryType = loader.load(dictionaryTypeCode);
                        if (null != dictionaryType) {
                            attributeType.setDictionaryTypeId(dictionaryType.getDictionaryTypeId());
                        }
                    }
                    attributeType.setDateType(StringUtils.isNotEmpty(realDataType) ? realDataType : dataType);
                    List<String> memos = new ArrayList<>();
                    memos.add("数据来源:" + dataSource);
                    memos.add("是否必填:" + nullable);
                    memos.add("备注:" + memo);
                    attributeType.setMemo(StringUtils.join(memos, ","));
                    attributeType.setVersion(1L);
                    metadataDto.getAttributeTypes().add(attributeType);
                }
            }
        }
        return metadataDto;
    }


    public static Map<DictionaryType, List<Dictionary>> parseDictionaries(Workbook workbook, int dictionaryTab) {
        Sheet sheet = workbook.getSheetAt(dictionaryTab);
        int totalRows = sheet.getPhysicalNumberOfRows();
        int columnIndexDictName = -1;
        int columnIndexDictLabel = -1;
        int columnIndexDictCode = -1;
        int columnIndexDictKey = -1;
        int columnIndexDictValue = -1;
        boolean headFound = false;
        Map<String, DictionaryType> dictionaryTypeMap = new HashMap<>();
        Map<DictionaryType, List<Dictionary>> dictionaries = new HashMap<>();
        for (int i = 0; i < totalRows; i++) {
            Row row = sheet.getRow(i);
            if (!headFound) {
                int totalColumns = row.getPhysicalNumberOfCells();
                for (int j = 0; j < totalColumns; j++) {
                    Cell cell = row.getCell(j);
                    String value = ExcelUtil.getCellAsString(cell);
                    if ("DICT_CHN_NAME".equalsIgnoreCase(value)) {
                        columnIndexDictName = j;
                    } else if ("DICT_NAME".equalsIgnoreCase(value)) {
                        columnIndexDictCode = j;
                    } else if ("DICT_KEY".equalsIgnoreCase(value)) {
                        columnIndexDictKey = j;
                    } else if ("DICT_VALUE".equalsIgnoreCase(value)) {
                        columnIndexDictValue = j;
                    } else if ("DICT_LABEL".equalsIgnoreCase(value)) {
                        columnIndexDictLabel = j;
                    }
                }
                if (columnIndexDictName >= 0 && columnIndexDictCode >= 0 && columnIndexDictKey >= 0 && columnIndexDictValue >= 0 && columnIndexDictLabel >= 0) {
                    headFound = true;
                }
            } else {
                String dictName = ExcelUtil.getCellAsString(row.getCell(columnIndexDictName));
                String dictCode = ExcelUtil.getCellAsString(row.getCell(columnIndexDictCode));
                String dictKey = ExcelUtil.getCellAsString(row.getCell(columnIndexDictKey));
                String dictValue = ExcelUtil.getCellAsString(row.getCell(columnIndexDictValue));
                if (StringUtils.isNotEmpty(dictName) && StringUtils.isNotEmpty(dictCode) && StringUtils.isNotEmpty(dictKey) && StringUtils.isNotEmpty(dictValue)) {
                    DictionaryType dictionaryType = dictionaryTypeMap.get(dictCode);
                    if (null == dictionaryType) {
                        dictionaryType = new DictionaryType();
                        dictionaryType.setName(dictName);
                        dictionaryType.setCode(dictCode);
                        dictionaryType.setVersion(1L);
                        dictionaryTypeMap.put(dictCode, dictionaryType);
                    }
                    List<Dictionary> dictionary = dictionaries.get(dictionaryType);
                    if (null == dictionary) {
                        dictionary = new ArrayList<>();
                        dictionaries.put(dictionaryType, dictionary);
                    }
                    String dictLabel = ExcelUtil.getCellAsString(row.getCell(columnIndexDictLabel));
                    Dictionary dict = new Dictionary();
                    dict.setMemo(dictLabel);
                    dict.setDictKey(NumberUtils.toInt(dictKey));
                    dict.setDictValue(dictValue);
                    dict.setVersion(1L);
                    dictionary.add(dict);
                }
            }
        }
        return dictionaries;
    }
}
