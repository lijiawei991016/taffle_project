package com.taffle.controller;

import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.mysql.jdbc.StringUtils;
import com.taffle.pojo.Blog;
import com.taffle.pojo.Contact;
import com.taffle.service.ClientService;

@Controller
@RequestMapping(value="/client")
public class ClientController {
	@Resource
	private ClientService clientService;
	// 跳转到 client_contact 页面
	@RequestMapping(value="/client_view_contact",method=RequestMethod.GET)
	public String clientViewContact() {
		return "client_contact";
	}
	// 添加联系我们用户信息(AJAX)
	@RequestMapping(value="/client_view_contact",method=RequestMethod.POST)
	@ResponseBody
	public Object clientViewContact(Contact contact) {
		HashMap<String,String> status = new HashMap<String,String>();
		// 判断内容是否为空
		if(StringUtils.isNullOrEmpty(contact.getContactName()) 
				|| StringUtils.isNullOrEmpty(contact.getContactMessage()) 
				|| StringUtils.isNullOrEmpty(contact.getContactEmail())) {
			status.put("status","null");
        	return JSON.toJSONString(status);
		}
		// 判断邮箱格式是否正确(正则验证)
		String regEx1 = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		Pattern p = Pattern.compile(regEx1);
		Matcher m = p.matcher(contact.getContactEmail());
		if(!m.matches()){
			status.put("status","failemail");
        	return JSON.toJSONString(status);
        }
		contact.setContactName(contact.getContactName().trim());
		contact.setContactEmail(contact.getContactEmail().trim());
		contact.setContactMessage(contact.getContactMessage().trim());
		// 把封装对象数据加入到数据库
		clientService.addContactMsg(contact);
		status.put("status","success");
		return JSON.toJSONString(status);
	}
	
	
	// 跳转到 client_store_invitation 页面
			@RequestMapping(value="/client_list_blog",method=RequestMethod.GET)
			public String clientlistblog(Model model) {
				// 获取所有博客
				List<Blog> blogs = clientService.findlistblog();
				model.addAttribute("listblogs", blogs);
				return "client_blog";
			}
			// 跳转到 client_single_post.jsp 页面
			@RequestMapping(value="/client_single_post/{blogId}",method=RequestMethod.GET)
			public String clientsinglepost(@PathVariable Integer blogId,Model model) {
				// 根据 id 查找 blog
				Blog result = clientService.findblogByblogId(blogId);
				model.addAttribute("blogs", result);
				return "client_single_post"; 
			}
			@RequestMapping(value="/client_cart",method=RequestMethod.GET)
			public String clientcart(Model model) {
				
				return "client_cart";
			}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
