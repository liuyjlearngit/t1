package com.cmdi.dims.app.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@ApiModel("导出excel数据")
@Data
public class ExcelDownData {
    @ApiModelProperty("专业")
    private String speciality;
    @ApiModelProperty("第一行")
    private ArrayList<String> strings;
    @ApiModelProperty("第二行")
    private ArrayList<String> stringss;
    @ApiModelProperty("第一行长度")
    private ArrayList<Integer> onenum;
    @ApiModelProperty("总计")
    private String allDatas;
    @ApiModelProperty("地址总结数据行")
    private ArrayList<String> alldata;

}
