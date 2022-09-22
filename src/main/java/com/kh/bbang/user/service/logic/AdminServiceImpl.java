package com.kh.bbang.user.service.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bbang.user.domain.User;
import com.kh.bbang.user.service.AdminService;
import com.kh.bbang.user.store.AdminStore;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private AdminStore aStore;

	@Override
	public List<User> printAllUser(int currentPage, int limit) {
		List<User> uList = aStore.selectAllUser(session, currentPage, limit);
		return uList;
	}

	@Override
	public int getTotalCount(String searchCondition, String searchValue) {
		int totalCount = aStore.selectTotalCount(session, searchCondition, searchValue);
		return totalCount;
	}

	@Override
	public List<User> printAllbyValue(String searchCondition, String searchValue, int currentPage, int boardLimit) {
		List<User> uList = aStore.selectAllbyValue(session, searchCondition, searchValue, currentPage, boardLimit);
		return uList;
	}


}
