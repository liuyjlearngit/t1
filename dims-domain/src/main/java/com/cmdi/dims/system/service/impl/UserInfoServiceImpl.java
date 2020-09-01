package com.cmdi.dims.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import lombok.extern.slf4j.Slf4j;
import com.cmdi.dims.common.dto.Pagination;
import com.cmdi.dims.system.dto.UserInfoDto;
import com.cmdi.dims.system.dto.UserPasswordDto;
import com.cmdi.dims.system.dto.UserQueryDto;
import com.cmdi.dims.system.entity.User;
import com.cmdi.dims.system.repository.AuthorizationRepository;
import com.cmdi.dims.system.repository.PermissionRepository;
import com.cmdi.dims.system.repository.UserRepository;
import com.cmdi.dims.system.service.UserInfoService;
import com.cmdi.dims.task.repository.AreaCodeConfigRepository;

@Slf4j
@Service
public class UserInfoServiceImpl implements UserInfoService {

    private static final String USER_DEFAULT_PASSWORD = "dims@123";

    @Autowired
    UserRepository userRepository;

    @Autowired
    PermissionRepository permissionRepository;

    @Autowired
    AuthorizationRepository authorizationRepository;
    @Autowired
    AreaCodeConfigRepository  areaCodeConfigRepository;
    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public Pagination<UserInfoDto> findUserInfo(UserQueryDto query, Integer page, Integer size) {

        Page<User> pageUsers = userRepository.findAll((Root<User> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();
            if (StringUtils.isNotEmpty(query.getName())) {
                predicates.add(criteriaBuilder.like(root.get("name"), "%" + query.getName() + "%"));
            }
            if (StringUtils.isNotEmpty(query.getEmail())) {
                predicates.add(criteriaBuilder.like(root.get("email"), "%" + query.getEmail() + "%"));
            }
            if (StringUtils.isNotEmpty(query.getUsername())) {
                predicates.add(criteriaBuilder.like(root.get("username"), "%" + query.getUsername() + "%"));
            }
            if (StringUtils.isNotEmpty(query.getMobilePhone())) {
                predicates.add(criteriaBuilder.like(root.get("mobilePhone"), "%" + query.getMobilePhone() + "%"));
            }
            if (StringUtils.isNotEmpty(query.getRemark())) {
                predicates.add(criteriaBuilder.like(root.get("remark"), "%" + query.getRemark() + "%"));
            }
            if (null != query.getUserId()) {
                predicates.add(criteriaBuilder.equal(root.get("userId"), query.getUserId()));
            }
            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        }, PageRequest.of(page, size, Sort.Direction.DESC, "userId"));
        Pagination<UserInfoDto> pagination = new Pagination<>();
        List<UserInfoDto> data = new ArrayList<>();
        for (User user : pageUsers.getContent()) {
            UserInfoDto info = new UserInfoDto();
            //获取相应的地市编码
            String  regionCode=user.getRegionCode();
            String regionName=areaCodeConfigRepository.findByCode(regionCode).getName();
            info.setRegionName(regionName);
            BeanUtils.copyProperties(user, info);
            data.add(info);
        }
        pagination.setData(data);
        pagination.setTotal(pageUsers.getTotalElements());
        pagination.setCount(pageUsers.getNumberOfElements());
        return pagination;
    }

    @Transactional
    @Override
    public UserInfoDto save(UserInfoDto userInfoDto) {
        User user;
        if (null != userInfoDto.getUserId()) {
            user = userRepository.findById(userInfoDto.getUserId()).orElseThrow(() -> new IllegalArgumentException("用户不存在！"));
        } else {
            user = new User();
            user.setPasswordInitialized(true);
            user.setPassword(passwordEncoder.encode(USER_DEFAULT_PASSWORD));
        }
        user.setName(userInfoDto.getName());
        user.setUsername(userInfoDto.getUsername());
        user.setEmail(userInfoDto.getEmail());
        user.setMobilePhone(userInfoDto.getMobilePhone());
        user.setRemark(userInfoDto.getRemark());

        //保存用户的区域编码与区域类型
        user.setRegionType(userInfoDto.getRegionType());
        user.setRegionCode(userInfoDto.getRegionCode());


        User saved = userRepository.save(user);
        UserInfoDto result = new UserInfoDto();
        BeanUtils.copyProperties(saved, result);
        return result;
    }

    @Transactional
    @Override
    public UserInfoDto delete(Long userId) {
        User user = userRepository.findById(userId).orElseThrow(() -> new IllegalArgumentException("用户不存在！"));

        userRepository.delete(user);
        UserInfoDto result = new UserInfoDto();
        BeanUtils.copyProperties(user, result);
        return result;
    }

    @Transactional
    @Override
    public void modifyPassword(UserPasswordDto userPasswordDto) {
        User user = userRepository.findById(userPasswordDto.getUserId()).orElseThrow(() -> new IllegalArgumentException("用户不存在！"));

        Assert.hasLength(userPasswordDto.getOldPassword(), "请输入原密码！");
        Assert.state(passwordEncoder.matches(userPasswordDto.getOldPassword(), user.getPassword()), "原密码输入错误！");

        Assert.hasLength(userPasswordDto.getPassword(), "新密码不能为空");
        user.setPassword(passwordEncoder.encode(userPasswordDto.getPassword()));
        user.setPasswordInitialized(false);
        userRepository.save(user);
    }

    @Transactional
    @Override
    public void resetPassword(Long userId) {
        User user = userRepository.findById(userId).orElseThrow(() -> new IllegalArgumentException("用户不存在！"));
        user.setPassword(passwordEncoder.encode(USER_DEFAULT_PASSWORD));
        user.setPasswordInitialized(true);
        userRepository.save(user);
    }

    @Transactional
    @Override
    public void initializeSuperUser() {
        User user = userRepository.findByUsername("admin");
        if (null == user) {
            user = new User();
            user.setUsername("admin");
            user.setName("超级用户");
            String password = USER_DEFAULT_PASSWORD;
            log.error("system super user [admin] password initialized ! password is " + password + " ! please change now !");
            user.setPassword(passwordEncoder.encode(password));
            user.setPasswordInitialized(true);
            user.setRegionCode("420000");
            user.setRegionType(1);
            userRepository.save(user);

        }
//        } else if (BooleanUtils.isTrue(user.getPasswordInitialized())) {
//            String password = USER_DEFAULT_PASSWORD;
//            log.error("system super user [admin] password initialized ! password is " + password + " ! please change now !");
//            user.setPassword(passwordEncoder.encode(password));
//            user.setPasswordInitialized(true);
//            userRepository.save(user);
//        }
    }

    @Override
    public Pagination<UserInfoDto> findSingalUserInfo(UserQueryDto query, Integer page, Integer size) {
        Page<User> pageUsers = userRepository.findAll((Root<User> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();
            if (null != query.getUserId()) {
                predicates.add(criteriaBuilder.equal(root.get("userId"), query.getUserId()));
            }
            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        }, PageRequest.of(page, size, Sort.Direction.DESC, "userId"));
        Pagination<UserInfoDto> pagination = new Pagination<>();
        List<UserInfoDto> data = new ArrayList<>();
        for (User user : pageUsers.getContent()) {
            UserInfoDto info = new UserInfoDto();
            //获取相应的地市编码
            String  regionCode=user.getRegionCode();
            String regionName=areaCodeConfigRepository.findByCode(regionCode).getName();
            info.setRegionName(regionName);
            BeanUtils.copyProperties(user, info);
            data.add(info);
        }
        pagination.setData(data);
        pagination.setTotal(pageUsers.getTotalElements());
        pagination.setCount(pageUsers.getNumberOfElements());
        return pagination;
    }
}
