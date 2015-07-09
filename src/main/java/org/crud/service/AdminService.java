package org.crud.service;

import org.crud.entity.User;
import org.crud.exceptions.InvalidUserInputException;
import org.springframework.transaction.annotation.Transactional;

public interface AdminService {
	@Transactional
	public void createAdmin(User user) throws InvalidUserInputException;
}
