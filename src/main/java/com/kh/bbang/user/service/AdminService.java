package com.kh.bbang.user.service;

import java.util.List;

import com.kh.bbang.user.domain.User;

public interface AdminService {
	
	public List<User> printAllUser(int currentPage, int limit);

	public int getTotalCount(String searchCondition, String searchValue);

	public List<User> printAllbyValue(String searchCondition, String searchValue, int currentPage, int boardLimit);

	public int removeUser(String userId);

}
