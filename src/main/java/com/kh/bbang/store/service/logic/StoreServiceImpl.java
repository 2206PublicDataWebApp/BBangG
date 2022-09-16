package com.kh.bbang.store.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bbang.store.domain.Store;
import com.kh.bbang.store.service.StoreService;
import com.kh.bbang.store.store.StoreStore;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private SqlSession session;
	
	@Autowired
	private StoreStore sStore;
	
	@Override
	public int registStore(Store store) {
		int result = sStore.insertStore(session, store);
		return result;
	}

	@Override
	public int removeStore() {
		int result = sStore.deleteStore(session);
		return result;
	}

	@Override
	public void modifyStore() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void showAllStore() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void showOneStoreById() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void showSearchedStore() {
		// TODO Auto-generated method stub
		
	}
	
}
