package com._30.common.exception;
/**
 * @Description: 抽象业务异常
 * @author: Lance.Wang
 * @date: 2013-7-2
 * @version: V1.0
 */
public class AbstractException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	protected int code;
	protected String namespace;

	public AbstractException() {
		super();
	}

	public AbstractException(final String message) {
		super(message);
	}

	public AbstractException(final String message, final Throwable cause) {
		super(message, cause);
	}

	public AbstractException(final Throwable cause) {
		super(cause);
	}

	public int getCode() {
		return this.code;
	}

	public String getNamespace() {
		return this.namespace;
	}

	public void setCode(final int code) {
		this.code = code;
	}

	public void setNamespace(final String namespace) {
		this.namespace = namespace;
	}

}
