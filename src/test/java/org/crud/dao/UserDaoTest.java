package org.crud.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.List;

import org.apache.log4j.Logger;
import org.crud.entity.User;
import org.crud.service.impl.UserServiceImpl;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

@ContextConfiguration(locations="classpath:applicationContext.xml")
public class UserDaoTest extends DaoBaseTest {
	
	@Autowired
	UserDao userDao;
	@Autowired
	RoleDao roleDao;
	
	private static final Logger l = Logger.getLogger(UserDaoTest.class);
	
	private User getInitUser(){
		User u = new User();
		u.setEmail("test@test.test");
		u.setFirstName("test");
		u.setLastName("test");
		u.setPassword("Test_367");
		u.setRole(roleDao.findRole(UserServiceImpl.USER_ROLE));
		l.debug("User initialized");
		return u;
	}
	
	@Test
	public void testAdd(){
		int size = userDao.list().size();
		User u = getInitUser();
		userDao.add(u);
		//list should have one more user now
		assertTrue(size<userDao.list().size());
		//check if regDate was set in db
		assertTrue(userDao.find(u.getUserId()).getRegDate()!=null);
	}
	
	@Test
	public void testFind(){
		User u = getInitUser();
		userDao.add(u);
		User loaded = userDao.find(u.getUserId());
		//comparing properties separately avoiding regDate field
		//regDate field was set in database
		assertEquals(u.getUserId(), loaded.getUserId());
		assertEquals(u.getFirstName(), loaded.getFirstName());
		assertEquals(u.getLastName(), loaded.getLastName());
		assertEquals(u.getPassword(), loaded.getPassword());
		assertEquals(u.getEmail(), loaded.getEmail());
		assertEquals(u.getRole().getId(), loaded.getRole().getId());
		//verify that date was set in database
		assertTrue(loaded.getRegDate()!=null);
	}
	
	@Test
	public void testUpdate(){
		User u = getInitUser();
		userDao.add(u);
		u.setPassword("Changed_000");
		userDao.update(u);
		User loaded = userDao.find(u.getUserId());
		assertEquals("Changed_000", loaded.getPassword());
	}
	
	@Test
	public void testList(){
		assertEquals(0, userDao.list().size());
		//creating 3 users
		User u1 = getInitUser();
		u1.setFirstName("test-user1");
		User u2 = getInitUser();
		u2.setFirstName("test-user2");
		User u3 = getInitUser();
		u3.setFirstName("test-user3");
		//put them to list
		List<User> list = Arrays.asList(u1, u2, u3);
		//persist all
		for(User u : list){
			userDao.add(u);
		}
		//load all products
		List<User> loaded = userDao.list();
		//compare size of added to loaded
		assertEquals(3, loaded.size());
		//verify if loaded list contains users
		for(User u : loaded){
			assertTrue(loaded.contains(u));
		}
	}
	
	@Test
	public void testRemove(){
		User u = getInitUser();
		userDao.add(u);
		int size = userDao.list().size();
		userDao.remove(u.getUserId());
		assertTrue(userDao.list().size()<size);
	}
	
	@Test
	public void testFindUserByEmail(){
		User u = getInitUser();
		userDao.add(u);
		User loaded = userDao.findUserByEmail(u.getEmail());
		assertEquals(u.getEmail(), loaded.getEmail());
	}
	
}
