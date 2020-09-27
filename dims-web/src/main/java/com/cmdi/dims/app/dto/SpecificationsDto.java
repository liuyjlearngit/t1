package com.cmdi.dims.app.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

@ApiModel("核查的指标")
@Data
@Builder
public class SpecificationsDto {
    @ApiModelProperty("指标名称")
    private String speciality;
    @ApiModelProperty("指标编码")
    private String specialityName;
    @ApiModelProperty("指标值")
    private Double totalValue;
    private Double normativityValue;
    private Double associationValue;
    private Double complianceValue;
    private Double integrityValue;
}
