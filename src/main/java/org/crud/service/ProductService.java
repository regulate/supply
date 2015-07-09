package org.crud.service;
import java.util.List;

import org.crud.entity.Product;
import org.springframework.transaction.annotation.Transactional;

public interface ProductService {
	@Transactional
	public void createProduct(Product p);
	@Transactional
	public void deleteProduct(Integer id);
	@Transactional
	public void updateProduct(Product p);
	@Transactional
	public Product findProduct(String name);
	@Transactional
	public List<Product> findAllProducts();
}
