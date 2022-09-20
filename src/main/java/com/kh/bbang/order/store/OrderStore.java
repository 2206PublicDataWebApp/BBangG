package com.kh.bbang.order.store;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bbang.order.domain.Order;
import com.kh.bbang.order.domain.OrderProduct;
import com.kh.bbang.product.domain.Product;
import com.kh.bbang.store.domain.Store;


public interface OrderStore {
	public List<Order> selectOrderByDate(SqlSession session, String orderDate);
	public List<Order> selectOrderById(SqlSession session, String userId);
	public Order selectOneOrder(SqlSession session, int orderNo);
	public List<Product> selectAllProduct(SqlSession session, int storeNo);
	public int insertOrder(SqlSession session, Order order);
	public int updateOrder(SqlSession session, Order order);
	public int deleteOrder(SqlSession session, int orderNo);
	public int deleteOrderRequest(SqlSessionTemplate session, int orderNo);
	public int changeOrdeState(SqlSession session, int orderNo);
	public List<OrderProduct> selectOrderProductList(SqlSession session, int orderNo);
	public Store selectStore(SqlSession session, int storeNo);
	
}
