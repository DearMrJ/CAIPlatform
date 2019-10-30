package org.exam.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

/**
 * 全局异常控制
 * @author Lynch
 *
 */
@ControllerAdvice
public class SpringExceptionHandler {
	/** 
     * 全局处理RuntimeException 
     * 异常的情况下返回500 
     * @return 
     */  
    @ExceptionHandler(value = {RuntimeException.class})  
    public ModelAndView handleRuntimeExceptions() {  
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("error/500");
    	return mv;
    }  
    
}
