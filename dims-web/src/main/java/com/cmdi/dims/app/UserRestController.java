package com.cmdi.dims.app;

import java.util.List;

import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.app.dto.UserQueryReqDto;
import com.cmdi.dims.app.dto.UserSaveReqDto;
import com.cmdi.dims.common.dto.Pagination;
import com.cmdi.dims.system.dto.UserInfoDto;
import com.cmdi.dims.system.dto.UserQueryDto;
import com.cmdi.dims.system.service.UserInfoService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/app/v1/user")
public class UserRestController {

    @Autowired
    UserInfoService userInfoService;

    @GetMapping()
    public ResponseDto<List<UserInfoDto>> users(
            UserQueryReqDto param,
            @RequestParam(value = "start", defaultValue = "0") Integer start,
            @RequestParam(value = "limit", defaultValue = "20") Integer limit) {

        Integer size = null != limit ? limit : 20;
        Integer page = null != start ? start / size : 0;

        UserQueryDto query = new UserQueryDto();
        BeanUtils.copyProperties(param, query);

        Pagination<UserInfoDto> users;
        if(param.getRegionType()==1) {
             users = userInfoService.findUserInfo(query, page, size);
        }
        else{
            users=userInfoService.findSingalUserInfo(query, page, size);
        }
        return ResponseDto.success(users.getData(), users.getTotal(), users.getCount());
    }

    @PostMapping()
    public ResponseDto<UserInfoDto> save(UserSaveReqDto param) {
        UserInfoDto userInfo = new UserInfoDto();
        BeanUtils.copyProperties(param, userInfo);
        UserInfoDto result = userInfoService.save(userInfo);
        return ResponseDto.success(result);
    }

    @DeleteMapping("/{userId}")
    public ResponseDto<UserInfoDto> delete(@PathVariable("userId") Long userId) {
        UserInfoDto result = userInfoService.delete(userId);
        return ResponseDto.success(result);
    }

    @PostMapping("/{userId}/reset")
    public ResponseDto<Void> reset(@PathVariable("userId") Long userId) {
        userInfoService.resetPassword(userId);
        return ResponseDto.success();
    }
}
