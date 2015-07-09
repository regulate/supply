package org.crud.controller;

import org.crud.entity.Product;
import org.crud.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/main/product/add", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product) {
		productService.createProduct(product);
		return "redirect:/main/";
	}

	@RequestMapping(value = "/main/product/{productId}/remove", method = RequestMethod.POST)
	public String deleteProduct(@PathVariable("productId") Integer id) {
		productService.deleteProduct(id);
		return "redirect:/main/";
	}

	@RequestMapping(value = "/main/product/{productId}/edit", method = RequestMethod.POST)
	public String editProduct(@PathVariable("productId") Integer id,
			@ModelAttribute("product") Product product) {
		product.setId(id);
		productService.updateProduct(product);
		return "redirect:/main/";
	}

}
