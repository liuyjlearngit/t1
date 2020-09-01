package com.cmdi.dims.system.dto;

import lombok.Data;

@Data
public class UserQueryDto {

    private Long userId;

    private String name;

    private String username;

    private String email;

    private String mobilePhone;

    private String remark;
}
