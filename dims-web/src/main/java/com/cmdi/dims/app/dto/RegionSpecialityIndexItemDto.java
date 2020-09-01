package com.cmdi.dims.app.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

@ApiModel("区域专业指标")
@Data
@Builder
public class RegionSpecialityIndexItemDto {

    @ApiModelProperty("区域")
    private String region;
    @ApiModelProperty("区域名称")
    private String regionName;
    @ApiModelProperty("专业")
    private String speciality;
    @ApiModelProperty("专业名称")
    private String specialityName;
    @ApiModelProperty("指标编码")
    private String indexCode;
    @ApiModelProperty("指标名称")
    private String indexName;
    @ApiModelProperty("指标值")
    private Double value;
}
