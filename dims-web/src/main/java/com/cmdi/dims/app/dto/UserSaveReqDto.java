package com.cmdi.dims.app.dto;

import lombok.Data;

@Data
public class UserSaveReqDto {

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
}
