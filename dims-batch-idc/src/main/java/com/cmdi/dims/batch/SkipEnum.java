package com.cmdi.dims.batch;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;

@Getter
@AllArgsConstructor
public enum SkipEnum {

    NON_SKIP(0, false),
    ERROR_SKIP(1, true),
    COMPARE_SKIP(2, true);
    private int code;
    private boolean skip;

    @NonNull
    public static SkipEnum get(int code) {
        for (SkipEnum s : SkipEnum.values()) {
            if (s.code == code) {
                return s;
            }
        }
        return NON_SKIP;
    }
}
