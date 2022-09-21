package com.kh.bbang.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bbang.product.domain.Product;
import com.kh.bbang.product.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService pService;
	
	// 상품등록화면
	@RequestMapping(value="/product/productRegistForm.kh", method=RequestMethod.GET)
	public ModelAndView productRegistForm(
			ModelAndView mv,
			@RequestParam Integer storeNo,
			@RequestParam String storeName) {
		System.out.println(storeNo);
		System.out.println(storeName);
		mv.addObject("storeNo", storeNo);
		mv.addObject("storeName", storeName);
		mv.setViewName("/product/productRegistForm");
		return mv;
	}
	
	// 상품등록
	@RequestMapping(value="/product/registProduct.kh", method=RequestMethod.POST)
	public ModelAndView registProduct(
			ModelAndView mv,
			@ModelAttribute Product product) {
		
		int result = pService.registProduct(product);
		if(result > 0) {
			mv.setViewName("/store/adminStoreList");
		}
		
		return mv;
	}
	
	// 상품리스트
	
	public ModelAndView showProductList(ModelAndView mv) {
		return mv;
	}
}
