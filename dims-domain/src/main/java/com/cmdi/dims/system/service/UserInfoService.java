package com.cmdi.dims.system.service;


import com.cmdi.dims.common.dto.Pagination;
import com.cmdi.dims.system.dto.UserInfoDto;
import com.cmdi.dims.system.dto.UserPasswordDto;
import com.cmdi.dims.system.dto.UserQueryDto;

public interface UserInfoService {

    Pagination<UserInfoDto> findUserInfo(UserQueryDto query, Integer page, Integer size);

    UserInfoDto save(UserInfoDto userInfoDto);

    UserInfoDto delete(Long userId);

    void modifyPassword(UserPasswordDto userPasswordDto);

    void resetPassword(Long userId);

    void initializeSuperUser();

    Pagination<UserInfoDto> findSingalUserInfo(UserQueryDto query, Integer page, Integer size);
}
