package com.mspr.back.custom_exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CustomExceptionHandler {

    @ExceptionHandler({EntityNotFoundException.class})
    public ResponseEntity<ApiErrorCode> entityNotFoundException(EntityNotFoundException e){
        return new ResponseEntity<>(new ApiErrorCode( 404, e.getMessage()), HttpStatus.NOT_FOUND );
    }

    @ExceptionHandler({EntityAlreadyExistsException.class})
    public ResponseEntity<ApiErrorCode> entityAlreadyExistsException(EntityAlreadyExistsException e) {
        return new ResponseEntity<>(new ApiErrorCode( 409, e.getMessage()), HttpStatus.CONFLICT );
    }
}
