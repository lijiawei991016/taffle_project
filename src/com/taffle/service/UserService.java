package com.taffle.service;

import com.taffle.pojo.User;

public interface UserService {
	User findUserByIdAndPsw(String userId,String userPsw);
	User  findUserById(String  userId);
	int addNewUser(User user);
	int  updateUserPswById(User ue);
}
