package org.crud.exceptions;

public class NoSuchUserException extends Exception {

	private static final long serialVersionUID = 2057791516097661289L;
	private static final String message = "User with specified email doesn't exist: ";

	public NoSuchUserException() {
	}

	public NoSuchUserException(String value) {
		super(message+value);
	}

	public NoSuchUserException(Throwable cause) {
		super(cause);
	}

	public NoSuchUserException(String value, Throwable cause) {
		super(message+value, cause);
	}
}
