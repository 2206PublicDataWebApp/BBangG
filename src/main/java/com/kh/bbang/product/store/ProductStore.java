package com.kh.bbang.product.store;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bbang.product.domain.Product;

public interface ProductStore {

	public int insertProduct(SqlSession session, Product product);
	
	public List<Product> selectAllProduct(SqlSession session, Integer refStoreNo);
	
	public int deleteProduct(SqlSession session, Integer productCode, Integer refStoreNo);
	

}
