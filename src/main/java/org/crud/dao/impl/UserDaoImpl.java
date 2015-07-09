package org.crud.dao.impl;

import org.crud.dao.UserDao;
import org.crud.entity.User;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("userDao")
@Transactional
public class UserDaoImpl extends GenericDaoImpl<User> implements UserDao {
	
	public UserDaoImpl() {
		super(User.class);
	}

	@Override
	public User findUserByEmail(String email) {
		User user = null;
		Session session = this.sessionFactory.openSession();
		
		session.beginTransaction();
		String hql = "FROM User u WHERE u.email = :email";
		Query query = session.createQuery(hql);
		query.setParameter("email", email);

		if(query.list().size()<1){
			return null;
		}
		
		user = (User)query.list().get(0);
		
		Hibernate.initialize(user.getRole());
		
		session.getTransaction().commit();
		
		session.close();
		
		return user;
	}

}
