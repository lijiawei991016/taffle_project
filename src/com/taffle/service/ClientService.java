package com.taffle.service;

import java.util.List;

import com.taffle.pojo.Blog;
import com.taffle.pojo.Contact;

public interface ClientService {
	int addContactMsg(Contact contact);
	//获取所有博客
	List<Blog> findlistblog();
	//根据id 查找对应的博客列表
	Blog findblogByblogId(Integer blogId);
}
