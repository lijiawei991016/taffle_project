package com.taffle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.taffle.pojo.User;

public interface UserMapper {
	User findUserByIdAndPsw(@Param("userId") String userId, @Param("userPsw") String userPsw);

	User findUserById(String userId);

	int addNewUser(User user);

	int updateUserPswById(User ue);

	int updateUserMsgByUserId(User user);

	int updateUserPhotoById(@Param("userId") String userId, @Param("userPhoto") String userPhoto);

	// <!-- 查询所有用户信息 -->
	List<User> findAllUser();

	// <!-- 根据userid修改用户屏蔽 -->
	int updateisEnableByuserId1(String userId);

	// <!-- 根据userid修改用户成不屏蔽 -->
	int updateisEnableByuserId0(String userId);

	// <!-- 根据userid修改用户积分 -->
	int upuserScore(@Param("userScore") double userScore, @Param("userId") String userId);

}
