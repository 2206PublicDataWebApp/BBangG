package com.kh.bbang.user.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.bbang.user.domain.User;

public interface AdminStore {

	public List<User> selectAllUser(SqlSession session, int currentPage, int limit);

	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue);

	public List<User> selectAllbyValue(SqlSession session, String searchCondition, String searchValue,
			int currentPage, int boardLimit);

	public int deleteUser(SqlSession session, String userId);

}
