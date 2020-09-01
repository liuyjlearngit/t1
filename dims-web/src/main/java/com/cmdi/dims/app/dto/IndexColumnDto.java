package com.cmdi.dims.app.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

@ApiModel("核查的指标")
@Data
@Builder
public class IndexColumnDto {

    @ApiModelProperty("指标名称")
    private String name;
    @ApiModelProperty("指标编码")
    private String code;
    @ApiModelProperty("指标值")
    private Double value;
}
