package com.kh.bbang.product.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
			@RequestParam String storeName
			, HttpServletRequest request) {
		try {
			mv.addObject("storeNo", storeNo);
			mv.addObject("storeName", storeName);
			mv.setViewName("/product/productRegistForm");
		} catch (Exception e) {
			mv.addObject("msg").setViewName("/common/errorPage");
		}
		return mv;
	}
	
	// 상품등록
	@RequestMapping(value="/product/registProduct.kh", method=RequestMethod.POST) 
	public ModelAndView registProduct(
			ModelAndView mv,
			@ModelAttribute Product product,
			@RequestParam("refStoreNo") Integer storeNo,
			@RequestParam("storeName") String storeName
			, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
			int result = pService.registProduct(product);
			String newStoreName = URLEncoder.encode(storeName,"UTF-8");
			String url ="redirect:/product/adminProductList.kh?storeNo="+storeNo+"&storeName="+newStoreName;
			if(result > 0) {
				mv.setViewName(url);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	// 상품리스트
	
	@RequestMapping(value="/product/adminProductList.kh", method= RequestMethod.GET)
	public ModelAndView showProductList(
			ModelAndView mv,
			@RequestParam("storeNo") Integer storeNo,
			@RequestParam("storeName") String storeName
			, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
			storeName = URLEncoder.encode(storeName, "UTF-8");
			storeName = URLDecoder.decode(storeName, "UTF-8");
			List<Product> pList = pService.printAllProduct(storeNo);
			mv.addObject("storeNo", storeNo);
			mv.addObject("storeName", storeName);
			if(!pList.isEmpty()) {
				mv.addObject("pList", pList);
			}
			mv.setViewName("/product/adminProductList");
		} catch (Exception e) {
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}
	
		return mv;
	}
	
	//삭제
	@RequestMapping(value="/product/removeProduct.kh", method=RequestMethod.GET)
	public ModelAndView removeProduct(
			ModelAndView mv,
			@RequestParam("productCode") Integer productCode,
			@RequestParam("storeNo") Integer storeNo,
			@RequestParam("storeName") String storeName
			, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
			storeName = URLEncoder.encode(storeName, "UTF-8");
			storeName = URLDecoder.decode(storeName, "UTF-8");
			int result = pService.removeProduct(productCode, storeNo);
			if(result > 0) {
				mv.setViewName("redirect:/product/adminProductList.kh?storeNo="+storeNo+"&storeName="+storeName);
			}
		} catch (Exception e) {
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
}
