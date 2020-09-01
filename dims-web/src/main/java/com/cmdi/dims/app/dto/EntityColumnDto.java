package com.cmdi.dims.app.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

@ApiModel("核查的实体")
@Data
@Builder
public class EntityColumnDto {
    @ApiModelProperty("实体名称")
    private String name;
    @ApiModelProperty("实体编码")
    private String code;
    @ApiModelProperty("实体的量")
    private Long amount;
}
