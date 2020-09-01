package com.cmdi.dims.task;

public class TaskConcurrentControlException extends RuntimeException {

    public TaskConcurrentControlException(String message) {
        super(message);
    }

    public TaskConcurrentControlException(String message, Throwable e) {
        super(message, e);
    }
}
