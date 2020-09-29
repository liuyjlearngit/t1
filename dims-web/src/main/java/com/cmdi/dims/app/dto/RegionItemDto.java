package com.cmdi.dims.app.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@ApiModel("区域平均指标")
@Data
public class RegionItemDto {

    @ApiModelProperty("区域")
    private String region;

    @ApiModelProperty("区域名称")
    private String regionName;

    @ApiModelProperty("指标值")
    private Double value;

    @ApiModelProperty("指标名称")
    private String vName;
}
