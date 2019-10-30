package org.exam.util;

import java.util.List;

import org.exam.vo.base.PageResultVo;
import org.exam.vo.base.ResponseVo;

import com.github.pagehelper.PageInfo;

public class ResultUtil{

	public static ResponseVo success(){
		return vo(CoreConst.SUCCESS_CODE,null,null);
	}

	public static ResponseVo success(String msg){
		return vo(CoreConst.SUCCESS_CODE, msg,null);
	}

	public static ResponseVo success(String msg, Object data){
		return vo(CoreConst.SUCCESS_CODE, msg, data);
	}

	public static ResponseVo error(){
		return vo(CoreConst.FAIL_CODE,null,null);
	}

	public static ResponseVo error(String msg){
		return vo(CoreConst.FAIL_CODE, msg,null);
	}

	public static ResponseVo error(String msg, Object data){
		return vo(CoreConst.FAIL_CODE, msg,data);
	}

	public static PageResultVo table( List<?> list, Long total, PageInfo<?> pageInfo){
		return new PageResultVo(list, total, pageInfo);
	}
	
	public static ResponseVo vo(Integer status, String message, Object data) {
		return new ResponseVo<>(status, message, data);
	}



}
