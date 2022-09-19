package com.kh.bbang.user.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.bbang.user.domain.LoginDTO;
import com.kh.bbang.user.domain.User;

public interface UserStore {
	
	public int insertUser(SqlSession session, User user);

	public User selectLoginUser(SqlSession session, LoginDTO loginDTO);

	public User selectOneById(SqlSession session, String userId);

	public int updateUser(SqlSession session, User user);
	
	public int deleteUser(SqlSession session, String userId);
	
}
