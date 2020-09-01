package com.cmdi.dims.domain;

import java.util.Date;

public interface LockService {

    boolean hasTaskLock(String province, String specialityName);

    void tryLockTask(String province, String specialityName, Date lockedAt);

    void unlockTask(String province, String specialityName, Date lockedAt);

}
