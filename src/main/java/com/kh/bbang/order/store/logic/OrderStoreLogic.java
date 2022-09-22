package com.kh.bbang.order.store.logic;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bbang.order.domain.Order;
import com.kh.bbang.order.domain.OrderProduct;
import com.kh.bbang.order.store.OrderStore;
import com.kh.bbang.product.domain.Product;
import com.kh.bbang.store.domain.Store;
@Repository
public class OrderStoreLogic implements OrderStore{

	@Override
	public List<Order> selectOrderByDate(SqlSession session, String orderDate) {
		List<Order> oList = session.selectList("OrderMapper.selectOrderByDate",orderDate);
		return oList;
	}

	@Override
	public List<Order> selectOrderById(SqlSession session, String userId) {
		List<Order> oList = session.selectList("OrderMapper.selectOrderById",userId);
		return oList;
	}

	@Override
	public Order selectOneOrder(SqlSession session, int orderNo) {
		Order order = session.selectOne("OrderMapper.selectOneOrder",orderNo);
		return order;
	}

	@Override
	public int insertOrder(SqlSession session, Order order) {
		int result = session.insert("OrderMapper.insertOrder",order);
		return result;
	}

	@Override
	public int updateOrder(SqlSession session, Order order) {
		int result = session.update("OrderMapper.updateOrder", order);
		return result;
	}

	@Override
	public int deleteOrder(SqlSession session, int orderNo) {
		int result = session.delete("OrderMapper.deleteOrder",orderNo);
		return result;
	}
	@Override
	public int deleteOrderRequest(SqlSessionTemplate session, int orderNo) {
		int result = session.update("OrderMapper.deleteOrderRequest",orderNo);
		return result;
	}

	@Override
	public List<Product> selectAllProduct(SqlSession session, int storeNo) {
		List<Product> pList = session.selectList("OrderMapper.selectAllProduct", storeNo);
		return pList;
	}

	@Override
	public List<OrderProduct> selectOrderProductList(SqlSession session, int orderNo) {
		List<OrderProduct> opList=session.selectList("OrderMapper.selectOrderProductList", orderNo);
		return opList;
	}

	@Override
	public int changeOrdeState(SqlSession session, int orderNo) {
		int result = session.update("OrderMapper.changeOrdeState",orderNo);
		return result;
	}

	@Override
	public Store selectStore(SqlSession session, int storeNo) {
		Store store = session.selectOne("OrderMapper.selectStore", storeNo);
		return store;
	}






}
