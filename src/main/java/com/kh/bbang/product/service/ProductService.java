package com.kh.bbang.product.service;

import java.util.List;

import com.kh.bbang.product.domain.Product;

public interface ProductService {
	public int registProduct(Product product);
	
	public List<Product> printAllProduct();
	
	public int removeProduct(Integer productCode, Integer refStoreNo);
}
