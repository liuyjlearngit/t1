package com.cmdi.dims.app.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@ApiModel("专业区域数据")
@Data
@Builder
public class ProfessionalDot {
    @ApiModelProperty("区域")
    private String speciality;
    @ApiModelProperty("区域名称")
    private String specialityName;
    @ApiModelProperty("总页数")
    private Integer page;
    @ApiModelProperty("当前页数")
    private Integer nowpage;
    @ApiModelProperty("资源数据集合")
    private List<List<ResourcesDto>> resourcesDtos;
    @ApiModelProperty("资源数据集合")
    private List<ResourcesDto> resourcesDtosn;
    @ApiModelProperty("数组")
    private List<String> pageData;
    @ApiModelProperty("姓名")
    private List<DownExcel> name;
}
