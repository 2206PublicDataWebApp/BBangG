package com.kh.bbang.store.service;

import com.kh.bbang.store.domain.Store;

public interface StoreService {
	
	// registStore
	public int registStore(Store store);
	// removeStore
	public int removeStore();
	// modifyStore
	public void modifyStore();
	// showAllStore
	public void showAllStore();
	// showOneStoreById
	public void showOneStoreById();
	// showSearchedStore
	public void showSearchedStore();
}
