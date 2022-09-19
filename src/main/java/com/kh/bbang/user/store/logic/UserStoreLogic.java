package com.kh.bbang.user.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bbang.user.domain.LoginDTO;
import com.kh.bbang.user.domain.User;
import com.kh.bbang.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore{

	@Override
	public int insertUser(SqlSession session, User user) {
		int result = session.insert("UserMapper.insertUser", user);
		return result;
	}

	@Override
	public User selectLoginUser(SqlSession session, LoginDTO loginDTO) {
		System.out.println("DAOloginDTO"+loginDTO.getUserPdw());
		User user = session.selectOne("UserMapper.loginUser", loginDTO);
		return user;
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


}
