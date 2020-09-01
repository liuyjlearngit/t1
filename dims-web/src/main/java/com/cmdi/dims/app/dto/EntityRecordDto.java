package com.cmdi.dims.app.dto;

import java.util.Date;
import java.util.List;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

@ApiModel("核查实体记录")
@Data
@Builder
public class EntityRecordDto {
    @ApiModelProperty("核查日期")
    private Date date;
    @ApiModelProperty("采集日期")
    private Date collectDate;
    @ApiModelProperty("核查的实体结果")
    private List<EntityColumnDto> columns;
}
