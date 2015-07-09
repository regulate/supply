package org.crud.controller;

import java.util.List;

import org.crud.entity.Product;
import org.crud.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/main/", method = RequestMethod.GET)
	public ModelAndView displayAllContent() {
		List<Product> products = productService.findAllProducts();
		ModelAndView model = new ModelAndView("main");
		model.addObject("products", products);
		return model;
	}

}
