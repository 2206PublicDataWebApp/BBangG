package com.kh.bbang.user.service;

import java.util.Date;

import com.kh.bbang.user.domain.LoginVO;
import com.kh.bbang.user.domain.User;

public interface UserService {
	
	public int registerUser(User user);

	public User login(LoginVO loginVO)throws Exception;

	public User printOneById(String userId);

	public int modifyUser(User user);

	public int removeUser(String userId);
	
	public void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception;

	public User checkLoginBefore(String value) throws Exception;

}
