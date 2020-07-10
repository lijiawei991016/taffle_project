package com.taffle.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;

import com.taffle.dao.UserMapper;
import com.taffle.pojo.User;
import com.taffle.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper userMapper;

	// 根据用户名和密码查找
	@Override
	public User findUserByIdAndPsw(String userId, String userPsw) {
		User result = userMapper.findUserByIdAndPsw(userId, DigestUtils.md5Hex(userPsw));

		return result;
	}

	// 根据userId查找用户
	@Override
	public User findUserById(String userId) {
		return userMapper.findUserById(userId);
	}

	@Override
	public int addNewUser(User user) {

		user.setUserPsw(DigestUtils.md5Hex(user.getUserPsw()));
		return userMapper.addNewUser(user);
	}

	// 根据userId修改userPsw
	@Override
	public int updateUserPswById(User ue) {
		// 取出新密码并加密再设值
		ue.setUserPsw(DigestUtils.md5Hex(ue.getUserPsw()));
		return userMapper.updateUserPswById(ue);
	}

	// 根据userId修改用户部分信息
	@Override
	public int updateUserMsgByUserId(User user) {
		return userMapper.updateUserMsgByUserId(user);
	}

	// 根据 userId 修改 userPhoto
	@Override
	public int updateUserPhotoById(String userId, String userPhoto) {
		return userMapper.updateUserPhotoById(userId, userPhoto);
	}

	// <!-- 查询所有用户信息 -->
	@Override
	public List<User> findAllUser() {
		return userMapper.findAllUser();
	}

	// <!-- 根据userid修改用户屏蔽 -->
	@Override
	public int updateisEnableByuserId1(String userId) {
		return userMapper.updateisEnableByuserId1(userId);
	}

	// <!-- 根据userid修改用户成不屏蔽 -->
	@Override
	public int updateisEnableByuserId0(String userId) {
		return userMapper.updateisEnableByuserId0(userId);
	}

}
