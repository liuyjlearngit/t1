package com.cmdi.dims.domain.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmdi.dims.domain.LockService;
import com.cmdi.dims.sdk.api.LockRestApi;
import com.cmdi.dims.sdk.model.LockDto;

@Service
public class LockServieImpl implements LockService {

    @Autowired
    private LockRestApi lockRestApi;

    @Override
    public boolean hasTaskLock(String province, String specialityName) {
        return lockRestApi.hasTaskLockUsingGET(new LockDto().province(province).speciality(specialityName)).isData();
    }

    @Override
    public void tryLockTask(String province, String specialityName, Date lockedAt) {
        lockRestApi.tryLockTaskUsingPOST(new LockDto().province(province).speciality(specialityName).lockedAt(lockedAt));
    }

    @Override
    public void unlockTask(String province, String specialityName, Date lockedAt) {
        lockRestApi.unlockTaskUsingPOST(new LockDto().province(province).speciality(specialityName).lockedAt(lockedAt));
    }
}
