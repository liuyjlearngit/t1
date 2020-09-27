package com.cmdi.dims.app.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@ApiModel("众和数据")
@Data
public class StatisticsAllData {
    @ApiModelProperty("资源详情姓名")
    List<ProfessionalDot> statisticals;
    @ApiModelProperty("资源详情姓名")
    List<RegionItemDto> graphicals;
}
