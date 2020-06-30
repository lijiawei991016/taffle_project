package com.taffle.dao;



import org.apache.ibatis.annotations.Param;

import com.taffle.pojo.User;

public interface UserMapper {
	User findUserByIdAndPsw(@Param("userId") String userId,
			@Param("userPsw") String userPsw);

		User	findUserById(String userId);
		int  addNewUser(User user);
		int  updateUserPswById(User ue);
}
