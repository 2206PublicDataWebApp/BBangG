package com.kh.bbang.user.service.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bbang.user.domain.LoginDTO;
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
	public User loginUser(LoginDTO loginDTO) {
		User uOne = uStore.selectLoginUser(session, loginDTO);
		return uOne;
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
	

}
