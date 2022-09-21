package com.kh.bbang.store.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bbang.store.domain.Store;

public interface StoreStore {
	// insertStore
	public int insertStore(SqlSession session, Store store);
	// deleteStore
	public int deleteStore(SqlSession session, Integer storeNo);
	// updateStore
	public int updateStore(SqlSession session, Store store);
	// selectAllStore
	public List<Store> selectAllStore(SqlSession session, int currentPage, int storeLimit);
	// selectOneStoreById
	public Store selectOneStoreById(SqlSession session, Integer storeNo);
	// selectSearchedStore
	public List<Store> selectSearchedStore(SqlSession session, String searchCondition, String searchValue, int currentPage, int storeLimit);
	// selectTotalCount
	public int selecTotalCount(SqlSession session, String searchCondition, String searchValue);
}
