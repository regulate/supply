package org.crud.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.crud.dao.RoleDao;
import org.crud.dao.UserDao;
import org.crud.entity.User;
import org.crud.exceptions.InvalidUserInputException;
import org.crud.exceptions.NoSuchPasswordException;
import org.crud.exceptions.UserExistException;
import org.crud.service.UserService;
import org.crud.validation.InputValidation;
import org.crud.validation.UserValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {

	public static final int USER_ROLE = 2;
	private static final Logger logger = Logger.getLogger(UserServiceImpl.class);
	
	@Autowired
	private UserDao userDao;
	@Autowired
	private RoleDao roleDao;

	@Override
	public void createUser(User user) throws UserExistException, InvalidUserInputException {
		if (InputValidation.isRegInputValid(user)) {
			User loaded = userDao.findUserByEmail(user.getEmail());
			if (!UserValidation.isUserExists(loaded)) {
				user.setRole(roleDao.findRole(USER_ROLE));
				userDao.add(user);
			}
		}
	}

	@Override
	public List<User> findAllUsers() {
		return userDao.list();
	}

	@Override
	public User findUserById(Integer userId) {
		return userDao.find(userId);
	}

	@Override
	public User findUserByEmail(String email) {
		return userDao.findUserByEmail(email);
	}
	
	/**
	 * This method is an implementation of UserDetailsService, which is used 
	 * as authentication-provider by spring security authentication-manager
	 * @return user details used in authorization
	 */
	@Override
	public UserDetails loadUserByUsername(String email)
			throws UsernameNotFoundException {
		User user = userDao.findUserByEmail(email);
		Set<GrantedAuthority> roles = new HashSet<>();
        roles.add(new SimpleGrantedAuthority("ROLE_"+user.getRole().getRoleName()));
		UserDetails userDetails = new org.springframework.security.core.userdetails.User(
				user.getEmail(), user.getPassword(), roles);
		logger.debug("Authorization attempt: "+userDetails.getUsername()+
				"; roles: "+roles.toString());
		return userDetails;
	}

	@Override
	public void changeUsersPassword(User user, String curPass, String newPass,
			String passToCompare) throws InvalidUserInputException, NoSuchPasswordException {
		if (InputValidation.isPassChangeInputValid(user, curPass, newPass,
				passToCompare)) {
			user.setPassword(newPass);
			userDao.update(user);
		}
	}
	
	@Override
	public void changeUsersDetails(User user, String firstName, String lastName) throws InvalidUserInputException{
		if(InputValidation.isFirstNameInputValid(firstName) && 
				InputValidation.isLastNameInputValid(lastName)){
			user.setFirstName(firstName);
			user.setLastName(lastName);
			userDao.update(user);
		}
	}

}
