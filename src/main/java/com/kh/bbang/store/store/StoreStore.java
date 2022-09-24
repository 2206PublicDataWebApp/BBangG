package com.kh.bbang.store.store;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bbang.store.domain.Store;
import com.kh.bbang.store.domain.StoreImage;

public interface StoreStore {
	// insertStore
	public int insertStore(SqlSession session, Store store);
	// insertStoreImage
	public int insertStoreImage(SqlSession session, StoreImage sImage);
	// deleteStore
	public int deleteStore(SqlSession session, Integer storeNo);
	// updateStore
	public int updateStore(SqlSession session, Store store);
	// updateStoreImage
	public int updateStoreImage(SqlSession session, StoreImage sImage);
	// selectAllStore
	public List<Store> selectAllStore(SqlSession session, int currentPage, int storeLimit);
	// selectOneStoreById
	public Store selectOneStoreById(SqlSession session, Integer storeNo);
	// selectSearchedStore
	public List<Store> selectSearchedStore(SqlSession session, String searchCondition, String searchValue, int currentPage, int storeLimit);
	// selectTotalCount
	public int selecTotalCount(SqlSession session, String searchCondition, String searchValue);
	// selectSortCount
	public int selectSortCount(SqlSession session, String region1, String region2);
	// selectSortedStore
	public List<Store> selectSortedStore(SqlSession session, String region1, String region2, int currentPage, int storeLimit);
}
