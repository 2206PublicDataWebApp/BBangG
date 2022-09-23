package com.kh.bbang.user.store.logic;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bbang.user.domain.LoginVO;
import com.kh.bbang.user.domain.User;
import com.kh.bbang.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore{
	
	@Autowired
	private SqlSession sqlsession;
	@Autowired
	public UserStoreLogic(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	@Override
	public int insertUser(SqlSession session, User user) {
		int result = session.insert("UserMapper.insertUser", user);
		return result;
	}

	@Override
	public User login(LoginVO loginVO)throws Exception{
		System.out.println("DAOloginVO"+loginVO.getUserPwd());
		return sqlsession.selectOne("UserMapper.login", loginVO);
	}
	
	@Override
	public User selectOneById(SqlSession session, String userId) {
		User user = session.selectOne("UserMapper.selectOneById", userId);
		return user;
	}

	@Override
	public int updateUser(SqlSession session, User user) {
		int result = session.insert("UserMapper.updateUser", user);
		return result;
	}

	@Override
	public int deleteUser(SqlSession session, String userId) {
		int result = session.insert("UserMapper.deleteUser", userId);
		return result;
	}

	@Override
	public void keepLogin(String userId,String sessionId, Date sessionLimit)throws Exception{
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userId", userId);
		paramMap.put("sessionId", sessionId);
		paramMap.put("sessionLimit", sessionLimit);
		
		sqlsession.update("UserMapper.keepLogin", paramMap);
	}
	
	@Override
	public User checkUserWithSessionKey(String value) throws Exception{
		return sqlsession.selectOne("UserMapper.check", value);
	}

	@Override
	public List<User> findId(SqlSession session, String userName, String userEmail) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("userName", userName);
		paramMap.put("userEmail", userEmail);
		List<User> uList = session.selectList("UserMapper.findId", paramMap);
		return uList;
	}

	@Override
	public int findPwd(SqlSession session, String userId, String userEmail, String userPwd) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("userId", userId);
		paramMap.put("userEmail", userEmail);
		paramMap.put("userPwd", userPwd);
		int result = session.update("UserMapper.findPwd", paramMap);
		return result;
	}


}
