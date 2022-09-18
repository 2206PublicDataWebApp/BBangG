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
	public void updateStore();
	// selectAllStore
	public List<Store> selectAllStore(SqlSession session);
	// selectOneStoreById
	public Store selectOneStoreById(SqlSession session, Integer storeNo);
	// selectSearchedStore
	public void selectSearchedStore();
}
