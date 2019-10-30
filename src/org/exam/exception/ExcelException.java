package org.exam.exception;

import org.exam.enmus.ResponseStatus;

public class ExcelException extends RuntimeException {
	
	private Integer code;
	
	public ExcelException(ResponseStatus responseStatus) {
		super(responseStatus.getMessage());
		this.code = responseStatus.getCode();
	}
	
	public ExcelException(Integer code, String message) {
		super(message);
		this.code = code;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

}
