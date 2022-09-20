package com.kh.bbang.user.store;

import java.util.Date;

import org.apache.ibatis.session.SqlSession;

import com.kh.bbang.user.domain.LoginVO;
import com.kh.bbang.user.domain.User;

public interface UserStore {
	
	
	public int insertUser(SqlSession session, User user);

	public User login(LoginVO loginVO)throws Exception;

	void keepLogin(String UserId, String sessionId, Date sessionLimit) throws Exception;
	
	User checkUserWithSessionKey(String value) throws Exception;

	public User selectOneById(SqlSession session, String userId);

	public int updateUser(SqlSession session, User user);
	
	public int deleteUser(SqlSession session, String userId);
	
	
}
