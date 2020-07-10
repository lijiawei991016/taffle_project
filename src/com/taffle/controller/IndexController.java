package com.taffle.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.taffle.pojo.Blog;
import com.taffle.service.ClientService;

@Controller
public class IndexController {
	@Resource
	private ClientService clientService;

	// 访问 index 页面
	@RequestMapping("/")
	public String index(Integer plateId, Integer categoryId, Model model) {
		// 首页显示博客
		List<Blog> blogs = clientService.findlistblog();
		model.addAttribute("listblogs", blogs);
		return "client_index";
	}

}
