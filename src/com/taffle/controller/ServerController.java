package com.taffle.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.taffle.pojo.Blog;
import com.taffle.pojo.Category;
import com.taffle.pojo.Goods;
import com.taffle.service.ClientService;
import com.taffle.service.ServerService;

@Controller
@RequestMapping("/server")
public class ServerController {
	@Resource
	private ServerService serverService;
@Resource
private  ClientService clientService;
	// 跳转到商品添加页面
	@RequestMapping(value = "/addgoods", method = RequestMethod.GET)
	public String serverAddGoods(Model model) {
		List<Category> categorys = serverService.findAllCategory();
		model.addAttribute("categorys", categorys);
		return "server_addgoods";
	}

	// 实现商品添加功能
	@RequestMapping(value = "/addgoods2", method = RequestMethod.POST)
	public String serverAddGoods(Goods goods, MultipartFile andgoodsPhoto, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {
		// 处理文件上传
		String path = request.getServletContext().getRealPath("/statics/file/");
		// 商品照片不为空则上传
		if (!andgoodsPhoto.isEmpty()) {
			// 上传文件名
			String filename = andgoodsPhoto.getOriginalFilename();
			filename = "goodsPhoto" + new Date().getTime() + filename.substring(filename.lastIndexOf("."));
			// 将上传文件保存到一个目标文件当中
			andgoodsPhoto.transferTo(new File(path + File.separator + filename));
			// 使用文件名替换 goods 中的 goodsPhoto 属性值
			goods.setGoodsPhoto(filename);
		} else {
			// 商品照片如果为空则设置属性为 null
			goods.setGoodsPhoto(null);
		}
		// 把 goods信息保存到数据库中
		serverService.addGoods(goods);
		return "redirect:./addgoods";
	}

	// 跳转到商品管理页面
	@RequestMapping(value = "/viewgoods", method = RequestMethod.GET)
	public String viewGoods(Model model) {
		List<Goods> goods = serverService.findAllGoods();
		model.addAttribute("goods", goods);
		return "server_viewgoods";
	}

	// 实现商品删除功能
	@RequestMapping(value = "deleteGoods/{goodsId}", method = RequestMethod.GET)
	public String deleteGoods(Model model, @PathVariable Integer goodsId) {
		serverService.deleteGoodsByGoodsId(goodsId);
		model.addAttribute("message", "删除成功");
		return "redirect:/server/viewgoods";
	}

	// 跳转到商品修改页面
	@RequestMapping(value = "updateGoods/{goodsId}", method = RequestMethod.GET)
	public String updateGoods(Model model, @PathVariable Integer goodsId) {
		Goods goods = serverService.findGoodsByGoodsId(goodsId);
		model.addAttribute("goods", goods);
		List<Category> categorys = serverService.findAllCategory();
		model.addAttribute("categorys", categorys);
		return "server_updategoods";
	}

	// 实现商品修改功能
	@RequestMapping(value = "/updateGoods", method = RequestMethod.POST)
	public String updateGoods(Goods goods, MultipartFile andgoodsPhoto, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {
		// 处理文件上传
		String path = request.getServletContext().getRealPath("/statics/file/");
		// 商品照片不为空则上传
		if (!andgoodsPhoto.isEmpty()) {
			// 上传文件名
			String filename = andgoodsPhoto.getOriginalFilename();
			filename = "goodsPhoto" + new Date().getTime() + filename.substring(filename.lastIndexOf("."));
			// 将上传文件保存到一个目标文件当中
			andgoodsPhoto.transferTo(new File(path + File.separator + filename));
			// 使用文件名替换 goods 中的 goodsPhoto 属性值
			goods.setGoodsPhoto(filename);
		} else {
			// 商品照片如果为空则设置属性为 null
			goods.setGoodsPhoto(null);
		}
		// 把 goods信息保存到数据库中
		serverService.updateGoodsByGoodsId(goods);
		return "redirect:/updateGoods" + goods.getCategory().getCategoryId();
	}

	// 添加新用户
	@RequestMapping(value = "/serverblogadd", method = RequestMethod.GET)
	public String serverblogadd() {
		return "server_addblog";
	}

	// 添加新用户
	@RequestMapping(value = "/serverblogadd", method = RequestMethod.POST)
	public String serverblogadd(Blog blog, MultipartFile bbPhoto, HttpServletRequest request)
			throws IllegalStateException, IOException {
		// 处理文件上传
		String path = request.getServletContext().getRealPath("/statics/file/");
		// 上传证件照
		// 上传文件名
		String filename = bbPhoto.getOriginalFilename();
		filename = "blog" + new Date().getTime() + filename.substring(filename.lastIndexOf("."));
		// 将上传文件保存到一个目标文件当中
		bbPhoto.transferTo(new File(path + File.separator + filename));
		// 使用文件名替换 user 中的 idPicPath 属性值
		blog.setBlogPhoto(filename);
		System.out.println(blog.getBlogMessage());
		blog.setBlogCreateDate(new Date());
		serverService.addblog(blog);
		return "server_addblog";
	}

	@RequestMapping(value = "/server_del_blog", method = RequestMethod.GET)
	public String serverdelblog(Model model) {
	
		return "server_index";
	}

}
