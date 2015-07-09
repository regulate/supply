package org.crud.exceptions;

public class NoSuchPasswordException extends Exception {

	private static final long serialVersionUID = 4812415955570673826L;
	private static final String message = "Specified password doesn't match user's password: ";
	
	public NoSuchPasswordException() {
	}

	public NoSuchPasswordException(String value) {
		super(message+value);
	}

	public NoSuchPasswordException(Throwable cause) {
		super(cause);
	}

	public NoSuchPasswordException(String value, Throwable cause) {
		super(message+value, cause);
	}

}
