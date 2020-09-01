package com.cmdi.dims.task.serivce.impl;

import java.util.Date;
import java.util.List;
import java.util.Objects;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import com.cmdi.dims.common.util.DateFormatUtil;
import com.cmdi.dims.task.TaskConcurrentControlException;
import com.cmdi.dims.task.entity.TaskLock;
import com.cmdi.dims.task.repository.TaskLockRepository;
import com.cmdi.dims.task.serivce.LockService;

@Slf4j
@Service
public class LockServiceImpl implements LockService {

    @Autowired
    private TaskLockRepository taskLockRepository;

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public void cleanLockAfterStartup() {
        List<TaskLock> locks = taskLockRepository.findAll();
        if (CollectionUtils.isNotEmpty(locks)) {
            taskLockRepository.deleteInBatch(locks);
        }
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public boolean hasTaskLock(String province, String specialityName) {
        return CollectionUtils.isNotEmpty(taskLockRepository.findByProvinceAndSpecialityName(province, specialityName));
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public void tryLockTask(String province, String specialityName, Date lockedAt) {
        log.warn("任务" + province + " - " + specialityName + "在" + DateFormatUtil.toDatetimeString(lockedAt) + "开始尝试锁定任务");
        List<TaskLock> locks = taskLockRepository.findByProvinceAndSpecialityName(province, specialityName);
        if (CollectionUtils.isEmpty(locks)) {
            try {
                TaskLock lock = new TaskLock();
                lock.setLockedAt(lockedAt);
                lock.setProvince(province);
                lock.setSpecialityName(specialityName);
                taskLockRepository.save(lock);
            } catch (Exception e) {
                log.error(e.getMessage(), e);
                locks = taskLockRepository.findByProvinceAndSpecialityName(province, specialityName);
                if (CollectionUtils.isNotEmpty(locks)) {
                    TaskLock lock = locks.get(0);
                    if (Objects.equals(province, lock.getProvince()) && Objects.equals(specialityName, lock.getSpecialityName()) && Objects.equals(lockedAt, lock.getLockedAt())) {
                        log.warn("already locked by task " + province + " - " + specialityName);
                    } else {
                        throw new TaskConcurrentControlException("任务" + lock.getProvince() + " - " + lock.getSpecialityName() + "于" + DateFormatUtil.toDatetimeString(lock.getLockedAt()) + "开始正在执行中，请在该任务执行结束后重试！", e);
                    }
                } else {
                    throw new TaskConcurrentControlException("任务锁定失败，请稍后尝试！", e);
                }
            }
        } else {
            TaskLock lock = locks.get(0);
            if (Objects.equals(province, lock.getProvince()) && Objects.equals(specialityName, lock.getSpecialityName()) && Objects.equals(lockedAt, lock.getLockedAt())) {
                log.warn("already locked by task " + province + " - " + specialityName);
            } else {
                throw new TaskConcurrentControlException("任务" + lock.getProvince() + " - " + lock.getSpecialityName() + "于" + DateFormatUtil.toDatetimeString(lock.getLockedAt()) + "开始正在执行中，请在该任务执行结束后重试！");
            }
        }
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public void unlockTask(String province, String specialityName, Date lockedAt) {
        log.warn("任务" + province + " - " + specialityName + "锁定时间为" + DateFormatUtil.toDatetimeString(lockedAt) + "开始尝试解锁！");
        List<TaskLock> locks = taskLockRepository.findByProvinceAndSpecialityName(province, specialityName);
        if (CollectionUtils.isEmpty(locks)) {
            throw new TaskConcurrentControlException("当前任务未锁定，无需解锁！");
        }
        TaskLock lock = locks.get(0);
        if (Objects.equals(province, lock.getProvince()) && Objects.equals(specialityName, lock.getSpecialityName()) && Objects.equals(lockedAt, lock.getLockedAt())) {
            try {
                taskLockRepository.deleteInBatch(locks);
            } catch (Exception e) {
                throw new TaskConcurrentControlException("任务" + lock.getProvince() + " - " + lock.getSpecialityName() + "解锁失败，请稍后尝试", e);
            }
        } else {
            throw new TaskConcurrentControlException("任务" + lock.getProvince() + " - " + lock.getSpecialityName() + "于" + DateFormatUtil.toDatetimeString(lock.getLockedAt()) + "开始正在执行中，当前任务未锁定，无需解锁！");
        }
    }
}
