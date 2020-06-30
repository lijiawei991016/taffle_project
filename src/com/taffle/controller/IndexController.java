package com.taffle.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class IndexController {

	// 访问 index 页面
	@RequestMapping("/")
	public String index(Integer plateId,Integer categoryId,Model model) {
		
		return "server_index";
	}

}






