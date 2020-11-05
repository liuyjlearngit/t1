package com.cmdi.dims.app.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;

@ApiModel("字典")
@Data
@AllArgsConstructor
public class DictDtos {
    @ApiModelProperty("名称")
    private String name;
    @ApiModelProperty("值")
    private Double value;
}
