package org.crud.service.impl;

import java.util.List;

import org.crud.dao.ProductDao;
import org.crud.entity.Product;
import org.crud.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductDao productDao;

	@Override
	public void createProduct(Product p) {
		productDao.add(p);
	}

	@Override
	public void deleteProduct(Integer id) {
		productDao.remove(id);
	}

	@Override
	public void updateProduct(Product p) {
		productDao.update(p);
	}

	@Override
	public Product findProduct(String name) {
		return productDao.findProductByName(name);
	}

	@Override
	public List<Product> findAllProducts() {
		return productDao.list();
	}

}
