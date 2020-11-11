package com.cmdi.dims.app.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@ApiModel("错误数据导出")
@Data
public class ErrorDownDto {

    @ApiModelProperty("规则编号")
    private String ruleNo;
    @ApiModelProperty("规则类型")
    private String ruleTagName;
    @ApiModelProperty("规则描述")
    private String ruleDescription ;
    @ApiModelProperty("省份")
    private String Province;
    @ApiModelProperty("地市")
    private String city;
    @ApiModelProperty("区县")
    private String county;
    @ApiModelProperty("资源标识")
    private String intId;
    @ApiModelProperty("资源标识")
    private String zhLable;
    @ApiModelProperty("问题原因")
    private String error;
    @ApiModelProperty("错误数量")
    private String errornum;

}
