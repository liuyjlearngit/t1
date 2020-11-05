package com.cmdi.dims.app.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

@ApiModel("指标详细结果")
@Data
@Builder
public class IndexItemDto {
    @ApiModelProperty("指标编码")
    private String indexCode;
    @ApiModelProperty("指标名称")
    private String indexName;
    @ApiModelProperty("数据总量")
    private String totalAmount;
    @ApiModelProperty("错误量")
    private String errorAmount;
    @ApiModelProperty("指标值")
    private Double value;
}
