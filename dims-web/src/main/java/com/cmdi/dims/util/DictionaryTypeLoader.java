package com.cmdi.dims.util;

import com.cmdi.dims.meta.entity.DictionaryType;

public interface DictionaryTypeLoader {

    DictionaryType load(String dictionaryTypeCode);
}
