package com.cmdi.dims.system.dto;

import lombok.Data;

@Data
public class UserInfoDto {

    private Long userId;

    private String name;

    private String username;

    private String email;

    private String mobilePhone;

    private String remark;

    //区域类型
    private Integer regionType;

    //区域编码
    private String regionCode;
    //区域名称
    private String regionName;
}
