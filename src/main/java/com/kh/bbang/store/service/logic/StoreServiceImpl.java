package com.kh.bbang.store.service.logic;

import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bbang.store.domain.Store;
import com.kh.bbang.store.domain.StoreImage;
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
	public int registStoreImage(StoreImage sImage) {
		int result = sStore.insertStoreImage(session, sImage);
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
	public int modifyStoreImage(StoreImage sImage) {
		int result = sStore.updateStoreImage(session, sImage);
		return result;
	}
	
	@Override
	public List<Store> showAllStore(int currentPage, int storeLimit) {
		List<Store> sList = sStore.selectAllStore(session, currentPage, storeLimit);
		return sList;
	}

	@Override
	public Store showOneStoreById(Integer storeNo) {
		Store store = sStore.selectOneStoreById(session, storeNo);
		return store;
	}

	@Override
	public List<Store> showSearchedStore(String searchCondition, String searchValue, int currentPage, int storeLimit) {
		List<Store> sList = sStore.selectSearchedStore(session, searchCondition, searchValue, currentPage, storeLimit);
		return sList;
	}

	@Override
	public int getTotalCount(String searchCondition, String searchValue) {
		int totalCount = sStore.selecTotalCount(session, searchCondition, searchValue);
		return totalCount;
	}

	@Override
	public int getSortCount(String region1, String region2) {
		int sortCount = sStore.selectSortCount(session, region1, region2);
		return sortCount;
	}

	@Override
	public List<Store> showSortedStore(String region1, String region2, int currentPage, int storeLimit) {
		List<Store> sList = sStore.selectSortedStore(session, region1, region2, currentPage, storeLimit);
		return sList;
	}



}
