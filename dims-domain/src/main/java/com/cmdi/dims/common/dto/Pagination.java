package com.cmdi.dims.common.dto;

import java.util.List;

import lombok.Data;

@Data
public class Pagination<T> {

    private List<T> data;

    private Long total;

    private Integer count;
}
