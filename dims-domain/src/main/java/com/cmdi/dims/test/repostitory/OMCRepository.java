package com.cmdi.dims.test.repostitory;

import com.cmdi.dims.test.entity.OMC;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OMCRepository extends JpaRepository<OMC, Long> {
    //List<OMC> findByZhLable(String zh_lable);
}