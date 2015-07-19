package org.crud.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public abstract class PasswordEncoder {
	private final static BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	public static String getHashedPassword(CharSequence rawPass){
		return encoder.encode(rawPass);
	}
	
	public static Boolean matches(String rawPassword, String encodedPassword){
		return encoder.matches(rawPassword, encodedPassword);
	}
	
}
