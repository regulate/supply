package org.crud.dao;
import org.crud.entity.Product;

public interface ProductDao extends GenericDao<Product>{
	public Product findProductByName(String name);
}
