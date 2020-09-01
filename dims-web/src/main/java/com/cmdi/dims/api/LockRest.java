package com.cmdi.dims.api;

import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.task.serivce.LockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/api/lock")
@RestController
public class LockRest {

    @Autowired
    private LockService lockService;

    @GetMapping("/hasTaskLock")
    public ResponseDto<Boolean> hasTaskLock(@RequestBody LockDto lock) {
        return ResponseDto.success(lockService.hasTaskLock(lock.getProvince(), lock.getSpeciality()));
    }

    @PostMapping("/tryLockTask")
    public ResponseDto<Void> tryLockTask(@RequestBody LockDto lock) {
        lockService.tryLockTask(lock.getProvince(), lock.getSpeciality(), lock.getLockedAt());
        return ResponseDto.success();
    }

    @PostMapping("/unlockTask")
    public ResponseDto<Void> unlockTask(@RequestBody LockDto lock) {
        lockService.unlockTask(lock.getProvince(), lock.getSpeciality(), lock.getLockedAt());
        return ResponseDto.success();
    }
}
