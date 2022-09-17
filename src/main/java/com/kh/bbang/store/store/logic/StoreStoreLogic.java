package com.kh.bbang.store.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bbang.store.domain.Store;
import com.kh.bbang.store.store.StoreStore;

@Repository
public class StoreStoreLogic implements StoreStore {

	@Override
	public int insertStore(SqlSession session, Store store) {
		int result = session.insert("StoreMapper.insertStore", store);
		return result;
	}

	@Override
	public int deleteStore(SqlSession session) {
		int result = session.delete("StoreMapper.deleteStore");
		return result;
	}

	@Override
	public void updateStore() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Store> selectAllStore(SqlSession session) {
		List<Store> sList = session.selectList("StoreMapper.selectAllStore");
		return sList;
		
	}

	@Override
	public void selectOneStoreById() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectSearchedStore() {
		// TODO Auto-generated method stub
		
	}

}
