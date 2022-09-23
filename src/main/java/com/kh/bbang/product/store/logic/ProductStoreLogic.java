package com.kh.bbang.product.store.logic;

import java.util.HashMap;
import java.util.List;

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

	@Override
	public List<Product> selectAllProduct(SqlSession session, Integer refStoreNo) {	
		List<Product> pList = session.selectList("ProductMapper.selectAllProduct", refStoreNo);
		return pList;
	}

	@Override
	public int deleteProduct(SqlSession session, Integer productCode, Integer refStoreNo) {
		HashMap<String, Integer> paraMap = new HashMap<String, Integer>();
		paraMap.put("productCode", productCode);
		paraMap.put("refStoreNo", refStoreNo);
		
		int result = session.delete("ProductMapper.deleteProduct", paraMap);
		return result;
	}
	

}
