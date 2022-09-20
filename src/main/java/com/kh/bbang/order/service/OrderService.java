package com.kh.bbang.order.service;

import java.sql.Array;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.kh.bbang.order.domain.Order;
import com.kh.bbang.order.domain.OrderProduct;
import com.kh.bbang.product.domain.Product;
import com.kh.bbang.store.domain.Store;

@Service
public interface OrderService {
	public List<Order> findOrderByDate(String orderDate);
	public List<Order> findOrderById(String userId);
	public Order findOneOrder(int orderNo);
	public List<Product> findAllProduct(int storeNo);
	public List<OrderProduct> findOrderProductList(int orderNo);
	public int registerOrder(Order order);
	public int modifyOrder(Order order);
	public int removeOrder(int orderNo);
	public int removeOrderRequest(int orderNo);
	public int changeOrdeState(int orderNo);
	public Store findStore(int storeNo);
	

	
}
