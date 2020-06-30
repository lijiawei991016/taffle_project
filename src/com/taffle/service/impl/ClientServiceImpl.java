package com.taffle.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.taffle.dao.BlogMapper;
import com.taffle.dao.ContactMapper;
import com.taffle.pojo.Blog;
import com.taffle.pojo.Contact;
import com.taffle.service.ClientService;
@Service("clientService")
public class ClientServiceImpl implements ClientService {
	@Resource
	private ContactMapper contactMapper;
	@Resource
	private BlogMapper blogMapper;
	// 添加联系我们到数据库
	@Override
	public int addContactMsg(Contact contact) {
		return contactMapper.addContactMsg(contact);
	}
	
	//显示所有博客
	@Override
	public List<Blog> findlistblog() {
		return blogMapper.findlistblog();
	}
	//根据blogId查找
	@Override
	public Blog findblogByblogId(Integer blogId) {
		return blogMapper.findblogByblogId(blogId);
	}
}
