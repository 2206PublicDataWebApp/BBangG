package com.kh.bbang.store.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.bbang.store.domain.Store;

public interface StoreStore {
	// insertStore
	public int insertStore(SqlSession session, Store store);
	// deleteStore
	public int deleteStore(SqlSession session);
	// updateStore
	public void updateStore();
	// selectAllStore
	public void selectAllStore();
	// selectOneStoreById
	public void selectOneStoreById();
	// selectSearchedStore
	public void selectSearchedStore();
}
