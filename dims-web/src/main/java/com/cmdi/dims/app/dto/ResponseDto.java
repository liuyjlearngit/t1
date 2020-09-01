package com.cmdi.dims.app.dto;

import java.util.List;

import org.springframework.http.HttpStatus;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ResponseDto<T> {

    private Integer status;

    private String message;

    private T data;

    private Long total;

    private Integer count;

    public static ResponseDto<Void> failure(int status, String message) {
        ResponseDtoBuilder<Void> builder = ResponseDto.builder();
        return builder.status(status)
                .message(message)
                .build();
    }

    public static ResponseDto<Void> success() {
        ResponseDtoBuilder<Void> builder = ResponseDto.builder();
        return builder.status(HttpStatus.OK.value())
                .message(HttpStatus.OK.getReasonPhrase())
                .build();
    }

    public static <T> ResponseDto<T> success(T data) {
        ResponseDtoBuilder<T> builder = ResponseDto.builder();
        return builder.status(HttpStatus.OK.value())
                .message(HttpStatus.OK.getReasonPhrase())
                .data(data)
                .build();
    }

    public static <T> ResponseDto<List<T>> success(List<T> data, Long total, Integer count) {
        ResponseDtoBuilder<List<T>> builder = ResponseDto.builder();
        return builder.status(HttpStatus.OK.value())
                .message(HttpStatus.OK.getReasonPhrase())
                .data(data)
                .total(total)
                .count(count)
                .build();
    }
}
