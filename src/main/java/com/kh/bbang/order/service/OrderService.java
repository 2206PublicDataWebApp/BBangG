package com.kh.bbang.order.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.bbang.order.domain.Order;
import com.kh.bbang.order.domain.SearchBasic;
import com.kh.bbang.product.domain.Product;
import com.kh.bbang.store.domain.Store;

@Service
public interface OrderService {
	public List<Order> findOrderById(SearchBasic sd);

	public List<Product> findAllProduct(int refStoreNo);

	public List<Order> printAllByValue(Order order, int currentPage, int boardLimit);

	public Order findOneOrder(int orderNo);

	public Store findStore(int storeNo);

	public int registerOrder(Order order);

	public int modifyOrder(Order order);

	public int removeOrder(int orderNo);

	public int removeOrderRequest(int orderNo);

	public int changeOrdeState(int orderNo);

	public int getTotalOrderCountByValue(Order order);

}
