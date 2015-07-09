package org.crud.service;

import java.util.List;

import org.crud.entity.User;
import org.crud.exceptions.InvalidUserInputException;
import org.crud.exceptions.NoSuchPasswordException;
import org.crud.exceptions.UserExistException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface UserService extends UserDetailsService {
	
	public void createUser(User user) throws UserExistException,
			InvalidUserInputException;

	public List<User> findAllUsers();

	public User findUserById(Integer userId);

	public User findUserByEmail(String email);

	public void changeUsersPassword(User user, String curPass, String newPass,
			String passToCompare) throws InvalidUserInputException,
			NoSuchPasswordException;
}
