package com.kh.bbang.order.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.bbang.order.domain.Order;
import com.kh.bbang.order.domain.SearchBasic;
import com.kh.bbang.product.domain.Product;
import com.kh.bbang.store.domain.Store;

public interface OrderStore {
	public List<Order> selectOrderById(SqlSession session, SearchBasic sd);

	public List<Product> selectAllProduct(SqlSession session, int refStoreNo);

	public List<Order> selecAllByValue(SqlSession session, Order order, int currentPage, int boardLimit);

	public Order selectOneOrder(SqlSession session, int orderNo);

	public Store selectStore(SqlSession session, int storeNo);

	public int insertOrder(SqlSession session, Order order);

	public int updateOrder(SqlSession session, Order order);

	public int deleteOrder(SqlSession session, int orderNo);

	public int deleteOrderRequest(SqlSessionTemplate session, int orderNo);

	public int changeOrdeState(SqlSession session, int orderNo);

	public int selectTotalOrderCountByValue(SqlSession session, Order order);

}
