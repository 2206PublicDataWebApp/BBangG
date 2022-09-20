package com.kh.bbang.store.service.logic;

import java.util.List;

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
	public int removeStore(Integer storeNo) {
		int result = sStore.deleteStore(session, storeNo);
		return result;
	}

	@Override
	public int modifyStore(Store store) {
		int result = sStore.updateStore(session, store);
		return result;
	}

	@Override
	public List<Store> showAllStore() {
		List<Store> sList = sStore.selectAllStore(session);
		return sList;
	}

	@Override
	public Store showOneStoreById(Integer storeNo) {
		Store store = sStore.selectOneStoreById(session, storeNo);
		return store;
	}

	@Override
	public void showSearchedStore() {
		// TODO Auto-generated method stub
		
	}
	
}
