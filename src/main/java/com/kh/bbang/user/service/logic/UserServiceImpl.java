package com.kh.bbang.user.service.logic;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bbang.user.domain.LoginVO;
import com.kh.bbang.user.domain.User;
import com.kh.bbang.user.service.UserService;
import com.kh.bbang.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private UserStore uStore;
	
	@Override
	public int registerUser(User user) {
		int result = uStore.insertUser(session, user);
		return result;
	}

	@Override
	public User login(LoginVO loginVO)throws Exception{
		return uStore.login(loginVO);
	}

	@Override
	public User printOneById(String userId) {
		User uOne = uStore.selectOneById(session, userId);
		return uOne;
	}

	@Override
	public int modifyUser(User user) {
		int result = uStore.updateUser(session, user);
		return result;
	}

	@Override
	public int removeUser(String userId) {
		int result = uStore.deleteUser(session, userId);
		return result;
	}

	@Override
	public void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception{
		uStore.keepLogin(userId, sessionId, sessionLimit);
	}

	public User checkLoginBefore(String value) throws Exception{
		return uStore.checkUserWithSessionKey(value);
	}

	@Override
	public List<User> findId(String userId, String userEmail) {
		List<User> uList = uStore.findId(session, userId, userEmail);
		return uList;
	}

}
