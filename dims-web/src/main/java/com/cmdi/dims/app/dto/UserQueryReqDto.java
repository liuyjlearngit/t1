package com.cmdi.dims.app.dto;

import lombok.Data;

@Data
public class UserQueryReqDto {

    private Long userId;

    private String name;

    private String username;

    private String email;

    private String mobilePhone;

    private String remark;

    //区域类型
    private int regionType;

    //区域编码
    private String regionCode;
}
