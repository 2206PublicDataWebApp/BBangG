package com.kh.bbang.order.service.logic;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bbang.order.domain.Order;
import com.kh.bbang.order.domain.OrderProduct;
import com.kh.bbang.order.service.OrderService;
import com.kh.bbang.order.store.OrderStore;
import com.kh.bbang.product.domain.Product;
import com.kh.bbang.store.domain.Store;
@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private OrderStore oStore;

	@Override
	public List<Order> findOrderByDate(String orderDate) {
		List<Order> oList = oStore.selectOrderByDate(session, orderDate);
		return oList;
	}

	@Override
	public List<Order> findOrderById(String userId) {
		List<Order> oList = oStore.selectOrderById(session, userId);
		return oList;
	}

	@Override
	public Order findOneOrder(int orderNo) {
		Order order = oStore.selectOneOrder(session, orderNo);
		return order;
	}

	@Override
	public int registerOrder(Order order) {
		int result = oStore.insertOrder(session, order);
		return result;
	}

	@Override
	public int modifyOrder(Order order) {
		int result = oStore.updateOrder(session, order);
		return result;
	}

	@Override
	public int removeOrder(int orderNo) {
		int result = oStore.deleteOrder(session, orderNo);
		return result;
	}
	
	@Override
	public int removeOrderRequest(int orderNo) {
		int result =oStore.deleteOrderRequest(session,orderNo);
		return result;
	}


	@Override
	public List<Product> findAllProduct(int refStoreNo) {
		List<Product> pList = oStore.selectAllProduct(session, refStoreNo);
		return pList;
	}

	@Override
	public List<OrderProduct> findOrderProductList(int orderNo) {
		List<OrderProduct> opList=oStore.selectOrderProductList(session, orderNo);
		return opList;
	}

	@Override
	public int changeOrdeState(int orderNo) {
		int result = oStore.changeOrdeState(session, orderNo);
		return result;
	}

	@Override
	public Store findStore(int storeNo) {
		Store store = oStore.selectStore(session,storeNo);
		return store;
	}





}
