package com.kh.bbang.product.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.bbang.product.domain.Product;

public interface ProductStore {

	int insertProduct(SqlSession session, Product product);

}
