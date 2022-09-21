package com.kh.bbang.store.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
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
	public int deleteStore(SqlSession session, Integer storeNo) {
		int result = session.delete("StoreMapper.deleteStore", storeNo);
		return result;
	}

	@Override
	public int updateStore(SqlSession session, Store store) {
		int result = session.update("StoreMapper.updateStore", store);
		return result;
	}

	@Override
	public List<Store> selectAllStore(SqlSession session, int currentPage, int storeLimit) {
		int offset=(currentPage - 1) * storeLimit;
		RowBounds rowBounds = new RowBounds(offset, storeLimit);
		List<Store> sList = session.selectList("StoreMapper.selectAllStore", null, rowBounds);
		return sList;
		
	}

	@Override
	public Store selectOneStoreById(SqlSession session, Integer storeNo) {
		Store store = session.selectOne("StoreMapper.selectStoreByNo", storeNo);
		return store;
	}

	@Override
	public int selecTotalCount(SqlSession session, String searchCondition, String searchValue) {
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("searchCondition", searchCondition);
		paraMap.put("searchValue", searchValue);
		int totalCount = session.selectOne("StoreMapper.selectTotalCount", paraMap);
		return totalCount;
	}

	@Override
	public List<Store> selectSearchedStore(SqlSession session, String searchCondition, String searchValue,
			int currentPage, int storeLimit) {
		int offset = (currentPage - 1) * storeLimit;
		RowBounds rowBounds = new RowBounds(offset, storeLimit);
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("searchCondition", searchCondition);
		paraMap.put("searchValue", searchValue);
		List<Store> sList = session.selectList("StoreMapper.selectSearchedList", paraMap, rowBounds);
		return sList;
	}

}
