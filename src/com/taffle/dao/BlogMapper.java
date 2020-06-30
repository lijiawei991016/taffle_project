package com.taffle.dao;

import java.util.List;

import com.taffle.pojo.Blog;

public interface BlogMapper {
	//添加博客
	int addblog(Blog blog);
	//获取所有博客
	List<Blog> findlistblog();
	//根据id 查找对应的博客列表
	Blog findblogByblogId(Integer blogId);
}
