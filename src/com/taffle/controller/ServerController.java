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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.jdbc.StringUtils;
import com.taffle.pojo.Blog;
import com.taffle.pojo.Category;
import com.taffle.pojo.Contact;
import com.taffle.pojo.Goods;
import com.taffle.pojo.User;
import com.taffle.service.ClientService;
import com.taffle.service.ServerService;
import com.taffle.service.UserService;
import com.taffle.pojo.Bill;

@Controller
@RequestMapping("/server")
public class ServerController {
	@Resource
	private ServerService serverService;
	@Resource
	private ClientService clientService;
	@Resource
	private UserService userService;

	// 跳转到后台首页server_index 页面
	@RequestMapping(value = "/server_index", method = RequestMethod.GET)
	public String serverIndex() {
		return "server_index";
	}

	// 跳转到商品添加页面
	@RequestMapping(value = "/addgoods", method = RequestMethod.GET)
	public String serverAddGoods(Model model) {
		List<Category> categorys = serverService.findAllCategory();
		model.addAttribute("categorys", categorys);
		return "server_addgoods";
	}

	// 实现商品添加功能
	@RequestMapping(value = "/addgoods2", method = RequestMethod.POST)
	public String serverAddGoods(Goods goods, MultipartFile andgoodsPhoto, RedirectAttributes redirectAttributes,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {
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
			redirectAttributes.addFlashAttribute("messg", "您好！商品图片不能为空");
			return "redirect:/server/addgoods";
		}
		if (StringUtils.isNullOrEmpty(goods.getGoodsName())) {
			redirectAttributes.addFlashAttribute("messg", "您好！商品名称不能填写为空");
			return "redirect:/server/addgoods";
		}
		if (StringUtils.isNullOrEmpty(goods.getGoodsMessage())) {
			redirectAttributes.addFlashAttribute("messg", "您好！商品描述不能填写为空");
			return "redirect:/server/addgoods";
		}
		if (goods.getGoodsPrice() == 0) {
			redirectAttributes.addFlashAttribute("messg", "您好！商品单价不能填写为空");
			return "redirect:/server/addgoods";
		}
		if (goods.getCategory().getCategoryId() == 0) {
			redirectAttributes.addFlashAttribute("messg", "您好！商品分类不能为空");
			return "redirect:/server/addgoods";
		}
		Goods res = serverService.findGoodsByGoodsName(goods.getGoodsName());
		if (res != null) {
			redirectAttributes.addFlashAttribute("messg", "您好！商品名称不能相同");
			return "redirect:/server/addgoods";
		}
		// 把 goods信息保存到数据库中
		serverService.addGoods(goods);
		return "redirect:/server/viewgoods";
	}

	// 跳转到商品管理页面
	@RequestMapping(value = "/viewgoods", method = RequestMethod.GET)
	public String viewGoods(Model model) {
		List<Goods> goods = serverService.findAllServerGoods();
		model.addAttribute("goods", goods);
		return "server_viewgoods";
	}

	// 实现商品删除功能
	@RequestMapping(value = "deleteGoods/{goodsId}", method = RequestMethod.GET)
	public String deleteGoods(Model model, @PathVariable Integer goodsId, RedirectAttributes redirectAttributes) {
		serverService.deleteGoodsByGoodsId(goodsId);
		redirectAttributes.addFlashAttribute("messg", "删除成功");
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
	public String updateGoods(Goods goods, String goodsPhotostr, MultipartFile reandgoodsPhoto,
			RedirectAttributes redirectAttributes, Model model, HttpServletRequest request, HttpSession session)
			throws Exception {
		// 处理文件上传
		String path = request.getServletContext().getRealPath("/statics/file/");
		// 商品照片不为空则上传
		if (!reandgoodsPhoto.isEmpty()) {
			// 上传文件名
			String filename = reandgoodsPhoto.getOriginalFilename();
			filename = "goodsPhoto" + new Date().getTime() + filename.substring(filename.lastIndexOf("."));
			// 将上传文件保存到一个目标文件当中
			reandgoodsPhoto.transferTo(new File(path + File.separator + filename));
			// 使用文件名替换 goods 中的 goodsPhoto 属性值
			goods.setGoodsPhoto(filename);
		} else {
			// 商品照片如果为空则设置属性为 null
			goods.setGoodsPhoto(goodsPhotostr);
		}
		if (StringUtils.isNullOrEmpty(goods.getGoodsName())) {
			redirectAttributes.addFlashAttribute("messg", "您好！商品名称不能填写为空");
			return "redirect:/server/updateGoods/" + goods.getGoodsId();
		}
		if (StringUtils.isNullOrEmpty(goods.getGoodsMessage())) {
			redirectAttributes.addFlashAttribute("messg", "您好！商品描述不能填写为空");
			return "redirect:/server/updateGoods/" + goods.getGoodsId();
		}
		if (goods.getGoodsPrice() == 0) {
			redirectAttributes.addFlashAttribute("messg", "您好！商品单价不能填写为空");
			return "redirect:/server/updateGoods/" + goods.getGoodsId();
		}
		// 判断shell值大于0小于100
		if (goods.getGoodsSell() < 0 || goods.getGoodsSell() >= 100) {
			redirectAttributes.addFlashAttribute("messg", "您好！促销折扣必须在0到100之间");
			return "redirect:/server/updateGoods/" + goods.getGoodsId();
		}
		// 把 goods信息保存到数据库中
		serverService.updateGoodsByGoodsId(goods);
		redirectAttributes.addFlashAttribute("messg", "已修改成功");
		return "redirect:/server/updateGoods/" + goods.getGoodsId();
	}

	// 跳转到添加博客页面
	@RequestMapping(value = "/serverblogadd", method = RequestMethod.GET)
	public String serverblogadd() {
		return "server_addblog";
	}

	// 实现添加博客功能
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
		blog.setBlogCreateDate(new Date());
		serverService.addblog(blog);
		return "redirect:/server/server_list_blog";
	}

	// 跳转到博客显示页面
	@RequestMapping(value = "/server_list_blog", method = RequestMethod.GET)
	public String serverdelblog(Model model) {
		// 获取所有博客
		List<Blog> blogs = clientService.findlistblog();
		model.addAttribute("listblogss", blogs);
		return "server_deleteblog";
	}

	// 删除博客
	@RequestMapping(value = "/server_del_blog/{blogId}", method = RequestMethod.GET)
	public String delInvitationById(@PathVariable Integer blogId) {
		serverService.delBlogById(blogId);
		return "redirect:/server/server_list_blog";
	}

	// 获取联系我们信息
	@RequestMapping(value = "/server_contact", method = RequestMethod.GET)
	public String servercontact(Model model) {
		// 获取所有联系我们信息
		List<Contact> contacts = serverService.findlistcontact();
		model.addAttribute("listcontacts", contacts);
		return "server_contact";
	}

	// 跳转商品分类列表页面
	@RequestMapping(value = "/category")
	public String serverCategory(Model model) {

		model.addAttribute("categories", serverService.findCategoryAll());

		return "server_category";
	}

	// 跳转添加商品分类页面
	@RequestMapping(value = "/addcategory", method = RequestMethod.GET)
	public String serverAddCategory() {

		return "server_addcategory";
	}

	// 跳转添加商品分类页面
	@RequestMapping(value = "/add_category", method = RequestMethod.POST)
	public String AddCategory(String category, Model model) {

		Category sd = serverService.findCategory(category);

		if (sd != null) {
			model.addAttribute("error", "不同添加相同的分类名称");
			return "server_addcategory";

		}

		// 添加
		model.addAttribute("error", "添加成功");
		serverService.addNewCategory(category);

		return "server_addcategory";

	}

	// 跳转修改分类界面
	@RequestMapping(value = "/update/{categoryId}")
	public String upda(@PathVariable Integer categoryId, Model model) {
		// 通过categoryId查找分类
		Category category = serverService.findCategoryById(categoryId);
		model.addAttribute("category", category);
		return "server_altcategory";
	}

	// 实现修改分类功能
	@RequestMapping(value = "/updateCategory", method = RequestMethod.POST)
	public String manageAlterCategory(@ModelAttribute Category category, Model model) {
		// 根据标题获取分类类型
		Category result = serverService.findCategory(category.getCategory());
		// 判断输入的新标题是否跟其他的标题同名
		if (result != null && result.getCategoryId() != category.getCategoryId()) {
			model.addAttribute("error", "此分类已经存在");
			return "server_altcategory";
		}
		// 修改分类名称
		serverService.updateCategoryById(category);
		model.addAttribute("error", "修改分类名称成功");
		return "server_altcategory";
	}

	// 删除分类
	@RequestMapping(value = "/del_category/{categoryId}", method = RequestMethod.GET)
	public String delCategory(@PathVariable Integer categoryId, RedirectAttributes redirectAttributes) {
		if (serverService.findGoodsByCategory(categoryId) != null) {
			redirectAttributes.addFlashAttribute("bug", "分类下有商品");
			return "redirect:/server/category";
		}
		serverService.delCategoryById(categoryId);
		redirectAttributes.addFlashAttribute("bug", "删除成功");
		return "redirect:/server/category";
	}

	// 跳转订单管理页面并且查询所有订单进行分页
	@RequestMapping(value = "/server_bill", method = RequestMethod.GET)
	public String findAllBill(Model model) {
		List<Bill> list = serverService.findAllBill();
		model.addAttribute("bills", list);
		return "server_bill";
	}

	// 修改订单状态后跳转到查询所有订单控制器再跳转到订单管理页面
	@RequestMapping(value = "/updatefindBillCodetoone/{billCode}", method = RequestMethod.GET)
	public String updatefindBillCodetoone(@PathVariable String billCode) {
		// 查询订单号对应的状态值
		Bill bill = serverService.findstatus(billCode);
		if (bill.getStatus() == 1) {
			// 修改订单状态值为2
			serverService.updatefindBillCodetoone(billCode);
			return "redirect:/server/server_bill";
		}

		else {
			return "redirect:/server/server_bill";
		}
	}

	@RequestMapping(value = "/updatefindBillCodetotwo/{billCode}", method = RequestMethod.GET)
	public String updatefindBillCodetotwo(@PathVariable String billCode) {
		// 查询订单号对应的状态值
		Bill bill = serverService.findstatus(billCode);
		if (bill.getStatus() == 3 || bill.getStatus() == 2) {
			// 修改订单状态值为4
			serverService.updatefindBillCodetotwo(billCode);
			return "redirect:/server/server_bill";
		}

		else {
			return "redirect:/server/server_bill";
		}
	}

	@RequestMapping(value = "/deletBillCodebystatus", method = RequestMethod.GET)
	public String deletBillCodebystatus(String billCode, String userId) {
		// 查询订单号对应的状态值
		Bill bill = serverService.findstatus(billCode);
		// 删除订单
		if (bill.getStatus() == 3 || bill.getStatus() == 4) {
			serverService.deletBillCodebystatus(billCode);
			clientService.defindcartByIDCode(userId, billCode);
			return "redirect:/server/server_bill";
		} else {
			return "redirect:/server/server_bill";
		}

	}

	// 获取所有用户信息
	@RequestMapping(value = "/server_userManage", method = RequestMethod.GET)
	public String serveruserManage(Model model) {
		List<User> users = userService.findAllUser();
		model.addAttribute("users", users);
		return "server_userManage";
	}

	// 根据用户id跳转到用户详情
	@RequestMapping(value = "server_userMessage/{userId}", method = RequestMethod.GET)
	public String serveruserMessage(Model model, @PathVariable String userId) {

		User user = userService.findUserById(userId);
		model.addAttribute("user", user);
		return "server_userMessage";
	}

	// 把用户改为屏蔽
	@RequestMapping(value = "updateisEnable1/{userId}", method = RequestMethod.GET)
	public String updateisEnable1(Model model, @PathVariable String userId) {
		userService.updateisEnableByuserId1(userId);
		return "redirect:/server/server_userManage";
	}

	// 取消用户屏蔽
	@RequestMapping(value = "updateisEnable0/{userId}", method = RequestMethod.GET)
	public String updateisEnable0(Model model, @PathVariable String userId) {
		userService.updateisEnableByuserId0(userId);
		return "redirect:/server/server_userManage";
	}
}
