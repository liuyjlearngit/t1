package com.cmdi.dims.app.dto;

import java.util.List;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@ApiModel("专业平均指标")
@Data
public class SpecialityItemDto {

    @ApiModelProperty("专业")
    private String speciality;
    @ApiModelProperty("专业名称")
    private String specialityName;
    @ApiModelProperty("指标值")
    private Double value;
    @ApiModelProperty("专业下区域指标列表")
    List<RegionItemDto> regions;
}
