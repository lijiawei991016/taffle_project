package com.taffle.dao;

import java.util.List;

import com.taffle.pojo.Contact;

public interface ContactMapper {
	int addContactMsg(Contact contact);

	// 获取联系我们信息
	List<Contact> findlistcontact();
}
