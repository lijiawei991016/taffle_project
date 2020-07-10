package com.taffle.dao;

import java.util.List;

import com.taffle.pojo.BlogSay;

public interface BlogSayMapper {
	// 添加博客评论
	int addblogsay(BlogSay blogSay);

	// 根据blogid 获取其所有对应的博客
	List<BlogSay> findblogsayByblogId(Integer blogId);
}
