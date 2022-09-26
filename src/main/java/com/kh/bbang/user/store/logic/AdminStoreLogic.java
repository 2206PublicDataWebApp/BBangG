package com.kh.bbang.user.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bbang.user.domain.User;
import com.kh.bbang.user.store.AdminStore;

@Repository
public class AdminStoreLogic implements AdminStore{

	@Override
	public List<User> selectAllUser(SqlSession session, int currentPage, int limit) {
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<User> uList = session.selectList("UserMapper.selectAllUser", null, rowBounds);
		return uList;
	}

	@Override
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		int totalCount = session.selectOne("UserMapper.selectTotalCount", paramMap);
		return totalCount;
	}

	@Override
	public List<User> selectAllbyValue(SqlSession session, String searchCondition, String searchValue, int currentPage,
			int boardLimit) {
		int offset = (currentPage-1)*boardLimit;
		RowBounds rowBounds = new RowBounds(offset, boardLimit);
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		List<User> uList = session.selectList("UserMapper.selectAllByValue", paramMap, rowBounds);
		return uList;
	}

	@Override
	public int deleteUser(SqlSession session, String userId) {
		int result = session.insert("UserMapper.deleteUser", userId);
		return result;
	}



}
