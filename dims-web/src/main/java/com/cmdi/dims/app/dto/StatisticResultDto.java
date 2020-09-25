package com.cmdi.dims.app.dto;

import java.util.List;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@ApiModel("统计结果信息")
@Data
public class StatisticResultDto {

    private Double totalValue;

    private String regionsName;

    @ApiModelProperty("区域维度的统计信息")
    private List<RegionItemDto> regions;

    @ApiModelProperty("专业维度的统计信息")
    private List<SpecialityItemDto> specialities;
}
