package com.cmdi.dims.sdk;

import com.fasterxml.jackson.databind.util.StdDateFormat;
import feign.Param;

import java.util.Date;

/**
 * Param Expander to convert {@link Date} to RFC3339
 */
public class ParamExpander implements Param.Expander {

    @Override
    public String expand(Object value) {
        if (value instanceof Date) {
            return StdDateFormat.getInstance().format(value);
        }
        return value.toString();
    }
}
