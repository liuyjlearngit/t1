package com.cmdi.dims.app.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@ApiModel("资源区域数据")
@Data
@Builder
public class ResourcesDto {
    @ApiModelProperty("资源姓名")
    private String resourcesName;
    @ApiModelProperty("资源数量")
    private String allValue;
    @ApiModelProperty("单位")
    private String allUnit;
    @ApiModelProperty("总页")
    private Integer page;
    @ApiModelProperty("资源详情集合")
    private List<List<ResourcesDetailsDto>> numsn;
    @ApiModelProperty("资源详情集合")
    private List<ResourcesDetailsDto> nums;
}
