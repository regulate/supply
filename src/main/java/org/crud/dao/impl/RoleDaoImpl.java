package org.crud.dao.impl;

import org.crud.dao.RoleDao;
import org.crud.entity.Role;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("roleDao")
@Transactional
public class RoleDaoImpl extends GenericDaoImpl<Role> implements RoleDao{
	
	public RoleDaoImpl() {
		super(Role.class);
	}
	
	@Override
	public Role findRole(int roleId) {
		Role role = null;
		Session session = this.sessionFactory.openSession();
		
		session.beginTransaction();
		role = (Role)session.get(type, roleId);
		Hibernate.initialize(role.getUsers());
		session.getTransaction().commit();
		
		session.close();
		return role;
	}

}
