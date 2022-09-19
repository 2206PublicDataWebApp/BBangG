package com.kh.bbang.store.service;

import java.util.List;

import com.kh.bbang.store.domain.Store;

public interface StoreService {
	
	// registStore
	public int registStore(Store store);
	// removeStore
	public int removeStore(Integer storeNo);
	// modifyStore
	public int modifyStore(Store store);
	// showAllStore
	public List<Store> showAllStore();
	// showOneStoreById
	public Store showOneStoreById(Integer storeNo);
	// showSearchedStore
	public void showSearchedStore();
}
