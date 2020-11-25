package com.cmdi.dims.app.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@ApiModel("资源详情区域数据")
@Data
@Builder
public class ResourcesDetailsDto {
    @ApiModelProperty("资源详情姓名")
    private String rname;
    @ApiModelProperty("资源详情姓名")
    private String name;
    @ApiModelProperty("资源详情数量")
    private String num;
    @ApiModelProperty("资源详情单位")
    private String unit;
}
