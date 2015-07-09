package org.crud.dao;

import org.crud.entity.User;

public interface UserDao extends GenericDao<User>{
	public User findUserByEmail(String email);
}
