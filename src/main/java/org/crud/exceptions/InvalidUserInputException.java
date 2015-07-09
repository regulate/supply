package org.crud.exceptions;

public class InvalidUserInputException extends Exception {

	private static final long serialVersionUID = -6256689282428432862L;
	private static final String message = "Invalid user input data found: ";

	public InvalidUserInputException() {
	}

	public InvalidUserInputException(String value) {
		super(message + value);
	}

	public InvalidUserInputException(Throwable cause) {
		super(cause);
	}

	public InvalidUserInputException(String value, Throwable cause) {
		super(message + value, cause);
	}

}
