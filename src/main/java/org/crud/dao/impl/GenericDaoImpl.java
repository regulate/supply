package org.crud.dao.impl;

import java.util.List;

import org.crud.dao.GenericDao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("genericDao")
@Transactional
public class GenericDaoImpl<T> implements GenericDao<T>{
	
	protected Class<T> type;
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	public GenericDaoImpl(){}
	
	public GenericDaoImpl(Class<T> clazz){
		this.type = clazz;
	}
	
	protected Session currentSession(){
		return sessionFactory.getCurrentSession();
	}

	@Override
	public T add(final T newInstance) {
		Session session = this.sessionFactory.openSession();
		
		session.beginTransaction();
		session.save(newInstance);
		session.getTransaction().commit();
		
		session.close();
		
		return newInstance;
	}

	@SuppressWarnings("unchecked")
	@Override
	public T find(final int id) {
		T instance = null;
		Session session = this.sessionFactory.openSession();
		
		session.beginTransaction();
		instance = (T) session.get(type, id);
		session.getTransaction().commit();
		
		session.close();
		
		return instance;
	}

	@Override
	public void update(final T transientObject) {
		Session session = this.sessionFactory.openSession();
		
		session.beginTransaction();
		session.update(transientObject);
		session.getTransaction().commit();
		
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public void remove(final Integer id) {
		T obj = null;
		Session session = this.sessionFactory.openSession();
		
		session.beginTransaction();
		obj = (T)session.get(type, id);
		if(obj!=null){
			session.delete(obj);
		}
		session.getTransaction().commit();
		
		session.close();    
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> list() {
		return currentSession().createCriteria(type).list();
	}
	
}
