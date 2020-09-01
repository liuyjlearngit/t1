package com.cmdi.dims.app.dto;

import java.util.Date;
import java.util.List;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

@ApiModel("核查指标记录")
@Data
@Builder
public class IndexRecordDto {

    @ApiModelProperty("核查时间")
    private Date date;
    @ApiModelProperty("采集日期")
    private Date collectDate;
    @ApiModelProperty("核查的指标结果")
    List<IndexColumnDto> columns;
}
