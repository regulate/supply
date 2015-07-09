package org.crud.validation;

import org.crud.entity.User;
import org.crud.exceptions.NoSuchPasswordException;
import org.crud.exceptions.NoSuchUserException;
import org.crud.exceptions.UserExistException;

public final class UserValidation {
	
	public static boolean isPasswordEquals(User user, String password) throws NoSuchPasswordException{
		if (!password.equals(user.getPassword()))
			throw new NoSuchPasswordException(password);
		return true;
	}
	
	public static boolean isUserExists(User user) throws UserExistException{
		if(user!=null)
			throw new UserExistException(user.getEmail());
		return false;
	}
	
	public static boolean isUserPresent(String email ,User user) throws NoSuchUserException{
		if(user==null)
			throw new NoSuchUserException(email);
		return true;
	}
}
