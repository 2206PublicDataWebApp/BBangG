package com.kh.bbang.product.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bbang.product.domain.Product;
import com.kh.bbang.product.service.ProductService;
import com.kh.bbang.product.store.ProductStore;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private SqlSession session;
	
	@Autowired
	private ProductStore pStore;

	@Override
	public int registProduct(Product product) {
		int result = pStore.insertProduct(session, product);
		return result;
	}

	@Override
	public List<Product> printAllProduct() {
		List<Product> pList = pStore.selectAllProduct(session);
		return pList;
	}

	@Override
	public int removeProduct(String productCode) {
		int result = pStore.deleteProduct(session, productCode);
		return result;
	}
}
