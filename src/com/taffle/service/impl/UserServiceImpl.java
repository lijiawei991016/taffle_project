package com.taffle.service.impl;


import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;

import com.taffle.dao.UserMapper;
import com.taffle.pojo.User;
import com.taffle.service.UserService;



@Service("userService")
public class UserServiceImpl implements UserService {
@Resource
private  UserMapper userMapper;
	
	//根据用户名和密码查找
	@Override
	public User findUserByIdAndPsw(String userId, String userPsw) {
		User result = userMapper.findUserByIdAndPsw(userId, DigestUtils.md5Hex(userPsw));
		
		
		return result;
	}
	//根据userId查找用户
	@Override
	public User findUserById(String userId) {
		return userMapper.findUserById(userId);
	}
	@Override
	public int addNewUser(User user) {
		
		user.setUserPsw(DigestUtils.md5Hex(user.getUserPsw()));
		return userMapper.addNewUser(user);
	}
	@Override
	public int updateUserPswById(User ue) {
		ue.setUserPsw(DigestUtils.md5Hex(ue.getUserPsw()));
		return userMapper.updateUserPswById(ue);
	}
	
	
}
