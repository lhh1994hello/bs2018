//创建时间：2018年3月30日,下午1:48:44
package com.huat.bs.bean;

import java.io.Serializable;

public class UserException extends Exception implements Serializable{

	private static final long serialVersionUID = 1L;

	public UserException() {
		super();
	}

	public UserException(String message) {
		super(message);
	}

}
