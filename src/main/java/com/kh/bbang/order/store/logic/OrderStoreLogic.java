package com.kh.bbang.order.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bbang.order.domain.Order;
import com.kh.bbang.order.domain.SearchBasic;
import com.kh.bbang.order.store.OrderStore;
import com.kh.bbang.product.domain.Product;
import com.kh.bbang.store.domain.Store;

@Repository
public class OrderStoreLogic implements OrderStore {

	@Override
	public List<Order> selectOrderById(SqlSession session, SearchBasic sd) {

		List<Order> oList = session.selectList("OrderMapper.selectOrderById", sd);
		return oList;
	}

	@Override
	public List<Product> selectAllProduct(SqlSession session, int refStoreNo) {
		List<Product> pList = session.selectList("OrderMapper.selectAllProduct", refStoreNo);
		return pList;
	}

	@Override
	public List<Order> selecAllByValue(SqlSession session, Order order, int currentPage, int boardLimit) {
		int offset = (currentPage - 1) * boardLimit;
		RowBounds rowBounds = new RowBounds(offset, boardLimit);
		List<Order> oList = session.selectList("OrderMapper.selectAllByValue", order, rowBounds);
		return oList;
	}

	@Override
	public Order selectOneOrder(SqlSession session, int orderNo) {
		Order order = session.selectOne("OrderMapper.selectOneOrder", orderNo);
		return order;
	}

	@Override
	public Store selectStore(SqlSession session, int storeNo) {
		Store store = session.selectOne("OrderMapper.selectStore", storeNo);
		return store;
	}

	@Override
	public int insertOrder(SqlSession session, Order order) {
		int orderNo = session.insert("OrderMapper.insertOrder", order);
		return orderNo;
	}

	@Override
	public int updateOrder(SqlSession session, Order order) {
		int result = session.update("OrderMapper.updateOrder", order);
		return result;
	}

	@Override
	public int deleteOrder(SqlSession session, int orderNo) {
		int result = session.delete("OrderMapper.deleteOrder", orderNo);
		return result;
	}

	@Override
	public int deleteOrderRequest(SqlSessionTemplate session, int orderNo) {
		int result = session.update("OrderMapper.deleteOrderRequest", orderNo);
		return result;
	}

	@Override
	public int changeOrdeState(SqlSession session, int orderNo) {
		int result = session.update("OrderMapper.changeOrdeState", orderNo);
		return result;
	}

	@Override
	public int selectTotalOrderCountByValue(SqlSession session, Order order) {
		int totalCount = session.selectOne("OrderMapper.selectTotalOrderCountByValue", order);
		return totalCount;
	}

}
