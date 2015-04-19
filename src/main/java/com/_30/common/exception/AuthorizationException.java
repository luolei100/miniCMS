package com._30.common.exception;

/**
 * @Description: 授权异常
 * @author: Lance.Wang
 * @date: 2013-7-2
 * @version: V1.0
 */
public class AuthorizationException extends AbstractException {

	private static final String msg = "对不起，您没有权限访问该功能！";

	private static final long serialVersionUID = 1L;

	public AuthorizationException() {
		super(AuthorizationException.msg, new RuntimeException());
	}

}
