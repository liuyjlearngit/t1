package com.cmdi.dims.task.serivce;

import java.util.Date;

public interface LockService {

    void cleanLockAfterStartup();

    boolean hasTaskLock(String province, String specialityName);

    void tryLockTask(String province, String specialityName, Date lockedAt);

    void unlockTask(String province, String specialityName, Date lockedAt);
}
