package com.kh.bbang.user.service;

import com.kh.bbang.user.domain.User;

public interface UserService {
	public int registerUser(User user);

	public User loginUser(User user);

	public User printOneById(String userId);

}
