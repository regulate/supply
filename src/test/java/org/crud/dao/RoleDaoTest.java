package org.crud.dao;

import static org.junit.Assert.*;

import org.crud.entity.Role;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

@ContextConfiguration(locations="classpath:applicationContext.xml")
public class RoleDaoTest extends DaoBaseTest {
	
	@Autowired
	private RoleDao roleDao;

	@Test
	public void testFind(){
		Role admin = roleDao.findRole(1);
		Role user = roleDao.findRole(2);
		assertTrue(admin.getRoleName().equals("ADMIN"));
		assertTrue(user.getRoleName().equals("USER"));
	}
	
}
