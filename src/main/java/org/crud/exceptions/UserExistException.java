package org.crud.exceptions;

public class UserExistException extends Exception {
	private static final long serialVersionUID = 7977816668675087290L;
	private static final String message = "User with the same email already exists: ";

	public UserExistException() {
	}

	public UserExistException(String value) {
		super(message+value);
	}

	public UserExistException(Throwable cause) {
		super(cause);
	}

	public UserExistException(String value, Throwable cause) {
		super(message+value, cause);
	}
}
