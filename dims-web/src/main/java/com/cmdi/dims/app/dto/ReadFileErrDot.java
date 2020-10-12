package com.cmdi.dims.app.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@ApiModel("ftp添加测试功能返回结果")
@Data
@Builder
public class ReadFileErrDot {
    @ApiModelProperty("添加错误数量")
    private Integer numerr;
    @ApiModelProperty("测试连接ftp错误数量")
    private Integer ftperrnum;
    @ApiModelProperty("测试连接ftp错误名")
    private List<String> ftperr;
    @ApiModelProperty("测试连接ftp错误名")
    private ArrayList<String> ftperrs;
}
