package com.kh.bbang.product.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bbang.product.domain.Product;
import com.kh.bbang.product.store.ProductStore;

@Repository
public class ProductStoreLogic implements ProductStore{

	@Override
	public int insertProduct(SqlSession session, Product product) {
		int result = session.insert("ProductMapper.insertProduct", product);
		return result;
	}
	

}
