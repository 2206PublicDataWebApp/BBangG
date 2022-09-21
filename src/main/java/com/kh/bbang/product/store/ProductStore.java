package com.kh.bbang.product.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bbang.product.domain.Product;

public interface ProductStore {

	public int insertProduct(SqlSession session, Product product);
	
	public List<Product> selectAllProduct(SqlSession session);
	
	public int deleteProduct(SqlSession session, String productCode);
	

}
