package org.crud.service.impl;

import org.crud.dao.RoleDao;
import org.crud.dao.UserDao;
import org.crud.entity.User;
import org.crud.exceptions.InvalidUserInputException;
import org.crud.exceptions.UserExistException;
import org.crud.service.AdminService;
import org.crud.utils.PasswordEncoder;
import org.crud.validation.InputValidation;
import org.crud.validation.UserValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	
	public static final int ROLE_ADMIN = 1;
	
	@Autowired
	UserDao userDao;
	@Autowired
	RoleDao roleDao;

	@Override
	public void createAdmin(User user) throws InvalidUserInputException {
		if (InputValidation.isRegInputValid(user)) {
			User loaded = userDao.findUserByEmail(user.getEmail());
			try {
				if (!UserValidation.isUserExists(loaded)) {
					loaded.setRole(roleDao.findRole(ROLE_ADMIN));
					user.setPassword(PasswordEncoder.getHashedPassword(user.getPassword()));
					userDao.add(user);
				}
			} catch (UserExistException e) {
				e.printStackTrace();
			}
		}
	}

}
