package com.kh.bbang.user.service;

import com.kh.bbang.user.domain.LoginDTO;
import com.kh.bbang.user.domain.User;

public interface UserService {
	public int registerUser(User user);

	public User loginUser(LoginDTO loginDTO);

	public User printOneById(String userId);

	public int modifyUser(User user);

	public int removeUser(String userId);
	
}
