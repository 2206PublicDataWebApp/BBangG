package com.kh.bbang.store.store;

import java.util.List;

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
	public List<Store> selectAllStore(SqlSession session);
	// selectOneStoreById
	public void selectOneStoreById();
	// selectSearchedStore
	public void selectSearchedStore();
}
