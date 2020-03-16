package com.chenhao.cms.util;

public class CmsException extends RuntimeException{

	
	    /**
	    * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	    */
	    
	private static final long serialVersionUID = 1L;
	
	private String message;
	
	public CmsException() {
		
	}
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public CmsException(String message) {
		super();
		this.message = message;
	}
	
}
