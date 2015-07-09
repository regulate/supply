package org.crud.dao.impl;

import org.crud.dao.ProductDao;
import org.crud.entity.Product;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("productDao")
@Transactional
public class ProductDaoImpl extends GenericDaoImpl<Product> implements ProductDao {
	
	public ProductDaoImpl() {
		super(Product.class);
	}

	@Override
	public Product findProductByName(String name) {
		Product product = null;
		Session session = this.sessionFactory.openSession();
		
		session.beginTransaction();
		String hql = "FROM Product p WHERE p.name = :name";
		Query query = session.createQuery(hql);
		query.setParameter("name",name);
		
		if(query.list().size()>0){
			product = (Product)query.list().get(0);			
		}
		
		session.getTransaction().commit();
		
		session.close();
		
		return product;
	}

}
