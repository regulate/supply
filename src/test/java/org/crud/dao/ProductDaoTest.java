package org.crud.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

import org.crud.entity.Product;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class ProductDaoTest extends DaoBaseTest {
	
	@Autowired
	ProductDao productDao;
	
	private Product getInitProduct(){
		Product p = new Product();
		p.setName("test");
		p.setPrice(new BigDecimal("100.00"));
		p.setDimensions("1x1x1");
		p.setSerial("00000021");
		p.setWeight(1f);
		p.setManufDate("2012-11-11");
		p.setExpDate("2013-11-11");
		return p;
	}
	
	@Test
	public void testAdd(){
		int size = productDao.list().size();
		Product p = getInitProduct();
		productDao.add(p);
		//list should have one more product now
		assertTrue(size<productDao.list().size());
	}
	
	@Test
	public void testFind(){
		Product p = getInitProduct();
		productDao.add(p);
		Product loaded = productDao.find(p.getId());
		assertEquals(p, loaded);
	}
	
	@Test
	public void testUpdate(){
		Product p = getInitProduct();
		productDao.add(p);
		p.setName("updated-product");
		productDao.update(p);
		Product loaded = productDao.find(p.getId());
		assertEquals("updated-product", loaded.getName());
	}
	
	@Test
	public void testList(){
		assertEquals(0, productDao.list().size());
		//creating products
		Product p1 = getInitProduct();
		p1.setName("test-product1");
		Product p2 = getInitProduct();
		p2.setName("test-product2");
		Product p3 = getInitProduct();
		p3.setName("test-product3");
		//put them to list
		List<Product> list = Arrays.asList(p1, p2, p3);
		//add them to db
		for(Product p : list){
			productDao.add(p);
		}
		//load all products
		List<Product> loaded = productDao.list();
		//compare size of added to loaded
		assertEquals(3, loaded.size());
		//verify if loaded contains products
		for(Product p : loaded){
			assertTrue(loaded.contains(p));
		}
	}
	
	@Test
	public void testRemove(){
		//creating product
		Product p = getInitProduct();
		//persisting it
		productDao.add(p);
		//load and get size, should be 1
		int size = productDao.list().size();
		//remove product
		productDao.remove(p.getId());
		//if removed, size will decrease
		assertTrue(productDao.list().size()<size);
	}
	
	@Test
	public void testLoadProductByName(){
		Product p = getInitProduct();
		productDao.add(p);
		assertEquals("test", productDao.findProductByName(p.getName()).getName());
	}
	
}
