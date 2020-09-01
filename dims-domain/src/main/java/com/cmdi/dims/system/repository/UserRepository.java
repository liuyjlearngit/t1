package com.cmdi.dims.system.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.cmdi.dims.system.entity.User;

/**
 * @author ZhongnanLI
 * @since 2018/7/29
 */
public interface UserRepository extends JpaRepository<User, Long>, JpaSpecificationExecutor<User> {

    User findByUsername(String username);
    User findByUserId(Long userid);
}
