package com.taffle.controller;

import java.io.File;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.taffle.pojo.User;
import com.mysql.jdbc.StringUtils;
import com.taffle.pojo.Bill;
import com.taffle.pojo.Blog;
import com.taffle.pojo.BlogSay;
import com.taffle.pojo.Cart;
import com.taffle.pojo.Category;
import com.taffle.pojo.Contact;
import com.taffle.pojo.Goods;
import com.taffle.pojo.GoodsComment;
import com.taffle.service.ClientService;
import com.taffle.service.ServerService;
import com.taffle.service.UserService;

@Controller
@RequestMapping(value = "/client")
public class ClientController {
	@Resource
	private ClientService clientService;
	@Resource
	private ServerService serverService;
	@Resource
	private UserService userService;

	// 跳转到 client_contact 页面
	@RequestMapping(value = "/client_view_contact", method = RequestMethod.GET)
	public String clientViewContact() {
		return "client_contact";
	}

	//
	
	// 添加联系我们用户信息(AJAX)
	@RequestMapping(value = "/client_view_contact", method = RequestMethod.POST)
	@ResponseBody
	public Object clientViewContact(Contact contact) {
		HashMap<String, String> status = new HashMap<String, String>();
		// 判断内容是否为空
		if (StringUtils.isNullOrEmpty(contact.getContactName())
				|| StringUtils.isNullOrEmpty(contact.getContactMessage())
				|| StringUtils.isNullOrEmpty(contact.getContactEmail())) {
			status.put("status", "null");
			return JSON.toJSONString(status);
		}
		// 判断邮箱格式是否正确(正则验证)
		String regEx1 = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		Pattern p = Pattern.compile(regEx1);
		Matcher m = p.matcher(contact.getContactEmail());
		if (!m.matches()) {
			status.put("status", "failemail");
			return JSON.toJSONString(status);
		}
		contact.setContactName(contact.getContactName().trim());
		contact.setContactEmail(contact.getContactEmail().trim());
		contact.setContactMessage(contact.getContactMessage().trim());
		// 把封装对象数据加入到数据库
		clientService.addContactMsg(contact);
		status.put("status", "success");
		return JSON.toJSONString(status);
	}

	// 跳转到 client_store_invitation 页面
	@RequestMapping(value = "/client_list_blog", method = RequestMethod.GET)
	public String clientlistblog(Model model) {
		// 获取所有博客
		List<Blog> blogs = clientService.findlistblog();
		model.addAttribute("listblogs", blogs);
		return "client_blog";
	}

	// 跳转到 client_single_post.jsp 页面
	@RequestMapping(value = "/client_single_post/{blogId}", method = RequestMethod.GET)
	public String clientsinglepost(@PathVariable Integer blogId, Model model) {
		// 根据 id 查找 blog
		Blog result = clientService.findblogByblogId(blogId);
		model.addAttribute("blogs", result);

		List<BlogSay> listblogsay = clientService.findblogsayByblogId(blogId);
		model.addAttribute("listblogsays", listblogsay);
		
		// 获取所有博客
		List<Blog> blogs = clientService.findlistblog();
		model.addAttribute("listblogs", blogs);
		return "client_single_post";
	}

	// 添加博客评论
	@RequestMapping(value = "/client_add_blogasy/{blogId}", method = RequestMethod.POST)
	public String clientaddblogasy(RedirectAttributes redirectAttributes, BlogSay blogSay, Blog blog,
			HttpSession session, HttpServletRequest request) {
		User loginer = (User) session.getAttribute("loginer");
		if (loginer.getIsEnable() == 1) {
			redirectAttributes.addFlashAttribute("err", "您已被屏蔽发言");
			return "redirect:/client/client_single_post/{blogId}";
		}
		blogSay.setUser(loginer);
		blogSay.setSayCreateDate(new Date());
		blogSay.setBlog(blog);
		clientService.addblogsay(blogSay);
		return "redirect:/client/client_single_post/{blogId}";
	}

	/**
	 * 分页分类商品
	 */
	@RequestMapping(value = "/client_goods_by_categoryId")
	public String clientgoodsByCategoryId(Model model, Integer categoryId, String goodsName,
			@RequestParam(defaultValue = "1", required = true, value = "pageNo") Integer pageNo, HttpSession session) {
		Integer pageSize = 8;// 每页显示记录数
		// 分页查询
		PageHelper.startPage(pageNo, pageSize);
		// 去掉goodsName空格
		goodsName = goodsName.trim();
		if (!StringUtils.isNullOrEmpty(goodsName)) {
			goodsName = goodsName.toString();
		} else {
			goodsName = "search";
		}
		User loginer = (User) session.getAttribute("loginer");
		if (loginer != null) {
			model.addAttribute("userScore", loginer.getUserScore());
		} else {
			model.addAttribute("userScore", 0);
		}
		List<Goods> goods = clientService.findAllGoods(categoryId, goodsName);
		PageInfo<Goods> pageInfo = new PageInfo<Goods>(goods);
		List<Category> category = clientService.findAllCategory();
		model.addAttribute("pageInfos", pageInfo);
		model.addAttribute("categorys", category);
		model.addAttribute("categoryId", categoryId);
		model.addAttribute("goodsName", goodsName);
		return "client_goods";
	}

	// 跳转商品详情页面
	@RequestMapping(value = "/client_single_product/{goodsId}", method = RequestMethod.GET)
	public String client_single_product(@PathVariable Integer goodsId, Model model, HttpSession session) {
		User loginer = (User) session.getAttribute("loginer");
		if (loginer != null) {
			model.addAttribute("userScore", loginer.getUserScore());
		} else {
			model.addAttribute("userScore", 0);
		}
		// 根据goodsId查找商品
		Goods goods = serverService.findGoodsByGoodsId(goodsId);
		model.addAttribute("goods", goods);
		// 显示用户商品评论
		List<GoodsComment> goodsComments = clientService.findGoodsCommentBygoodsId(goodsId);
		model.addAttribute("goodsComments", goodsComments);
		return "client_single_product";
	}

	// 查询对应id下的所有商品并计算个商品小计和所有商品总价跳转购物车
	@RequestMapping(value = "/client_cart", method = RequestMethod.GET)
	public String clientcart(Model model, HttpSession session) {
		User loginer = (User) session.getAttribute("loginer");
		model.addAttribute("userScore", loginer.getUserScore());
		List<Cart> goods = clientService.findAllCart(loginer.getUserId());
		// 计算总价
		double sum = 0;
		double sum2 = 0;
		double sum3 = 0;
		if (loginer.getUserScore() >= 3000) {

			for (Cart cart : goods) {
				if (cart.getGoodsSell() <= 30) {
					double price = Math.ceil(0.7 * cart.getGoodsPrice()) * cart.getGoodsNumber();
					double sum1 = sum2 + price;
					sum2 = sum1;
					model.addAttribute("goods4", sum2);

				}

				else {
					double price = Math.ceil((1 - cart.getGoodsSell() * 0.01) * cart.getGoodsPrice())
							* cart.getGoodsNumber();
					double sum1 = sum3 + price;
					sum3 = sum1;
					model.addAttribute("goods5", sum3);
				}

			}
			model.addAttribute("goods", goods);
			return "client_cart";

		}

		for (Cart cart : goods) {
			double price = Math.ceil((1 - cart.getGoodsSell() * 0.01) * cart.getGoodsPrice()) * cart.getGoodsNumber();
			double sum1 = sum + price;
			sum = sum1;

			model.addAttribute("goods6", sum);

		}

		model.addAttribute("goods", goods);
		return "client_cart";
	}

	// 添加购物车
	@RequestMapping(value = "/addclient_cart/{goodsId}", method = RequestMethod.GET)
	public String addclientcart(@PathVariable Integer goodsId, Model model, HttpSession session) {
		// 根据goodsId查找商品
		User loginer = (User) session.getAttribute("loginer");
		if (loginer != null) {
			model.addAttribute("userScore", loginer.getUserScore());
		} else {
			model.addAttribute("userScore", 0);
		}
		Goods good = serverService.findGoodsByGoodsId(goodsId);

		// 查找到后添加进购物车表
		// 根据userID和goodsID判断数据口中该用户对应的商品是否存在
		Cart carts = clientService.findCartsByUserID(loginer.getUserId(), goodsId);
		if (carts != null) {
			Goods goods = serverService.findGoodsByGoodsId(goodsId);
			model.addAttribute("goods", goods);
			return "client_single_product";
		} else {
			Cart cart = new Cart();
			cart.setUserId(loginer.getUserId());
			cart.setGoodsPhoto(good.getGoodsPhoto());
			cart.setGoodsName(good.getGoodsName());
			cart.setGoodsPrice(good.getGoodsPrice());
			cart.setGoodsSell(good.getGoodsSell());
			cart.setGoodsId(good.getGoodsId());
			clientService.addCart(cart);
			Goods goods = serverService.findGoodsByGoodsId(goodsId);
			model.addAttribute("goods", goods);
			return "client_single_product";
		}
	}

	// 根据对应商品id和用户ID删除购物车中商品然后跳转购物车
	@RequestMapping(value = "/declient_cart/{goodsId}", method = RequestMethod.GET)
	public String declientcart(Model model, @PathVariable Integer goodsId, HttpSession session) {

		User loginer = (User) session.getAttribute("loginer");
		clientService.deCartsByUserID(loginer.getUserId(), goodsId);

		return "redirect:/client/client_cart";
	}

	// 根据对应商品id和用户ID修改购物车中商品的数量然后跳转购物车
	@RequestMapping(value = "/upclient_cart/{goodsId}", method = RequestMethod.GET)
	public String upclientcart(Model model, @PathVariable Integer goodsId, HttpSession session, Integer goodsNumber) {

		User loginer = (User) session.getAttribute("loginer");
		clientService.upCartsByUserID(loginer.getUserId(), goodsId, goodsNumber);
		return "redirect:/client/client_cart";
	}

	// 跳转到支付页面
	@RequestMapping(value = "/client_pay", method = RequestMethod.GET)
	public String upclientcart(Model model, HttpSession session) {
		User loginer = (User) session.getAttribute("loginer");
		model.addAttribute("userScore", loginer.getUserScore());
		// 根据userID查询购物车表中的用户添加的billCode等于0的商品信息
		List<Cart> goods = clientService.findAllCart(loginer.getUserId());
		// 如果查询出来不为空
		if (!goods.isEmpty()) {// 证明找到了用户添加的数据
			// 生成订单号
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Random random = new Random();
			int rannum = (int) (random.nextDouble() * (999 - 1 + 1)) + 10000;// 获取3位随机数
			String billCode = loginer.getUserId() + sdf.format(d) + rannum;
			// 把订单号保存在session当中
			session.setAttribute("billCodes", billCode);

			// 根据userID查询user表中的收获地址和联系电话
			User user = clientService.findUserInfromation(loginer.getUserId());
			String goodsNames = "";
			for (Cart cart : goods) {// 循环为每个用户添加的商品修改订单号
				Integer goodsId = cart.getGoodsId();
				// 这里的问题!这里是根据userID和goodsID修改该表中所有的订单号(已解决在sql中给与billCode=0的限制即可)
				clientService.upBillCode(billCode, loginer.getUserId(), goodsId);
				String billGoods = goodsNames + cart.getGoodsName() + ".";
				goodsNames = billGoods;

			}
			// 判断Bill表中对应的userId和billCode的订单是否纯在如果纯在不添加，
			// 如果不存在就添加
			Bill bills = clientService.findBillsByUserID(loginer.getUserId(), billCode);
			if (bills == null) {
				Bill bill = new Bill();
				bill.setBillCode(billCode);
				bill.setBillGoods(goodsNames);
				bill.setUserAddress(user.getUserAddress());
				bill.setUserPhone(user.getUserPhone());
				bill.setUserId(loginer.getUserId());
				clientService.addBill(bill);
				Bill billss = clientService.findBillsByUserID(loginer.getUserId(), billCode);
				model.addAttribute("billss", billss);

			}

		}
		// else
		String billCodess = (String) session.getAttribute("billCodes");
		List<Cart> BillCodegoods = clientService.findAllCartByBillCode(loginer.getUserId(), billCodess);
		Bill billss = clientService.findBillsByUserID(loginer.getUserId(), billCodess);
		model.addAttribute("billss", billss);
		// 计算总价
		double sum = 0;
		double sum2 = 0;
		double sum3 = 0;
		if (loginer.getUserScore() >= 3000) {

			for (Cart cart : BillCodegoods) {
				if (cart.getGoodsSell() <= 30) {
					model.addAttribute("userScore", loginer.getUserScore());
					double price = Math.ceil(0.7 * cart.getGoodsPrice()) * cart.getGoodsNumber();
					double sum1 = sum2 + price;
					sum2 = sum1;
					model.addAttribute("goods2", sum2);

				}

				else {
					double price = Math.ceil((1 - cart.getGoodsSell() * 0.01) * cart.getGoodsPrice())
							* cart.getGoodsNumber();
					double sum1 = sum3 + price;
					sum3 = sum1;
					model.addAttribute("goods3", sum3);
				}

			}

			model.addAttribute("billCode", billCodess);
			model.addAttribute("billgoods", BillCodegoods);
			model.addAttribute("goods", goods);
			model.addAttribute("judge", 2);
			return "client_pay";

		}
		for (Cart cart : BillCodegoods) {
			double price = Math.ceil((1 - cart.getGoodsSell() * 0.01) * cart.getGoodsPrice()) * cart.getGoodsNumber();
			double sum1 = sum + price;
			sum = sum1;
			model.addAttribute("goods1", sum);

		}

		model.addAttribute("billCode", billCodess);
		model.addAttribute("billgoods", BillCodegoods);
		model.addAttribute("goods", goods);
		model.addAttribute("judge", 2);
		return "client_pay";
	}

	// 取消订单：根据userID和BillCodes删除所有添加进购物车表中的billCode，并且清空对应session。
	@RequestMapping(value = "/cancle_pay", method = RequestMethod.GET)
	public String cancle_pay(Model model, HttpSession session) {
		User loginer = (User) session.getAttribute("loginer");
		String billCode = (String) session.getAttribute("billCodes");
		// 根据userID和BillCodes删除所有添加进购物车表中的billCode
		clientService.upfindAllCartByIDCode(loginer.getUserId(), billCode);
		// 删除表中userId对应的billCode
		clientService.defindBillCodeByIDCode(loginer.getUserId(), billCode);
		session.removeAttribute("billCodes");
		session.removeAttribute("goods1");
		session.removeAttribute("goods2");
		session.removeAttribute("goods3");
		return "redirect:/client/client_cart";
	}

	// 支付成功跳转到用户订单详情页
	@RequestMapping(value = "/client_bill/{sum}", method = RequestMethod.GET)
	public String client_bill(RedirectAttributes redirectAttributes,Model model, HttpSession session, @PathVariable double sum) {
		// 修改userID对应的userCode的状态值等于1
		User loginer = (User) session.getAttribute("loginer");
		String billCode = (String) session.getAttribute("billCodes");
		Bill billss = clientService.findBillsByUserID(loginer.getUserId(), billCode);
		if (billCode == null) {
			return "redirect:/client/client_userBill";
		}
		if (StringUtils.isNullOrEmpty(billss.getUserAddress())||StringUtils.isNullOrEmpty(billss.getUserPhone())) {
			redirectAttributes.addFlashAttribute("err", "收获地址和手机号码不能为空，请去左下方添加信息");
			return "redirect:/client/client_pay";
			
		}

		
		double addScore = (loginer.getUserScore() + (sum) * 0.1);
		clientService.upuserScore(addScore, loginer.getUserId());
		clientService.updateBillCode(billCode, loginer.getUserId());
		session.removeAttribute("billCodes");
		session.removeAttribute("goods1");
		session.removeAttribute("goods2");
		session.removeAttribute("goods3");
		return "redirect:/client/client_userBill";

	}

	// 查询该用户的所有订单并跳转到个人订单中心
	@RequestMapping(value = "/client_userBill", method = RequestMethod.GET)
	public String client_userBill(Model model, HttpSession session) {
		User loginer = (User) session.getAttribute("loginer");
		List<Bill> list = clientService.findAllBillByUid(loginer.getUserId());
		model.addAttribute("bills", list);
		return "client_bill";
	}

	// 确认订单。
	@RequestMapping(value = "/sure_bill/{billCode}", method = RequestMethod.GET)
	public String sure_bill(Model model, HttpSession session, @PathVariable String billCode) {
		User loginer = (User) session.getAttribute("loginer");
		Bill bill = clientService.findBillsByUserID(loginer.getUserId(), billCode);
		if (bill.getStatus() == 2) {
			clientService.updateBillCodeThree(billCode, loginer.getUserId());
			return "redirect:/client/client_userBill";
		}
		return "redirect:/client/client_userBill";
	}

	// 删除订单，并且删除carts表中对应的商品信息
	@RequestMapping(value = "/delete_bill/{billCode}", method = RequestMethod.GET)
	public String delete_bill(Model model, HttpSession session, @PathVariable String billCode) {
		User loginer = (User) session.getAttribute("loginer");
		Bill bill = clientService.findBillsByUserID(loginer.getUserId(), billCode);
		if (bill.getStatus() != 2) {
			clientService.deleteBillCode(billCode, loginer.getUserId());
			clientService.defindcartByIDCode(loginer.getUserId(), billCode);
		}
		session.removeAttribute("billCodes");
		session.removeAttribute("goods1");
		session.removeAttribute("goods2");
		session.removeAttribute("goods3");
		return "redirect:/client/client_userBill";
	}

	// 跳转到支付页面
	@RequestMapping(value = "/client_otherpay/{billCode}", method = RequestMethod.GET)
	public String client_otherpay(Model model, HttpSession session, @PathVariable String billCode) {

		User loginer = (User) session.getAttribute("loginer");
		model.addAttribute("userScore", loginer.getUserScore());

		// 根据userID查询user表中的收获地址和联系电话
		User user = clientService.findUserInfromation(loginer.getUserId());
		// 判断Bill表中对应的userId和billCode的订单是否纯在如果纯在不添加，
		// 如果不存在就添加
		Bill bills = clientService.findBillsByUserID(loginer.getUserId(), billCode);

		List<Cart> BillCodegoods = clientService.findAllCartByBillCode(loginer.getUserId(), billCode);
		Bill billss = clientService.findBillsByUserID(loginer.getUserId(), billCode);
		model.addAttribute("billss", billss);
		// 计算总价
		double sum = 0;
		double sum2 = 0;
		double sum3 = 0;

		if (loginer.getUserScore() >= 3000) {

			for (Cart cart : BillCodegoods) {
				if (cart.getGoodsSell() <= 30) {
					model.addAttribute("userScore", loginer.getUserScore());
					double price = Math.ceil(0.7 * cart.getGoodsPrice()) * cart.getGoodsNumber();
					double sum1 = sum2 + price;
					sum2 = sum1;
					model.addAttribute("goods2", sum2);

				}

				else {
					double price = Math.ceil((1 - cart.getGoodsSell() * 0.01) * cart.getGoodsPrice())
							* cart.getGoodsNumber();
					double sum1 = sum3 + price;
					sum3 = sum1;
					model.addAttribute("goods3", sum3);
				}

			}

			model.addAttribute("billCode", billCode);
			model.addAttribute("billgoods", BillCodegoods);
			model.addAttribute("goods", BillCodegoods);
			session.setAttribute("billCodes", billCode);
			model.addAttribute("judge", 1);
			return "client_pay";

		}
		for (Cart cart : BillCodegoods) {
			double price = Math.ceil((1 - cart.getGoodsSell() * 0.01) * cart.getGoodsPrice()) * cart.getGoodsNumber();
			double sum1 = sum + price;
			sum = sum1;
			model.addAttribute("goods1", sum);
		}

		model.addAttribute("billCode", billCode);
		model.addAttribute("billgoods", BillCodegoods);
		model.addAttribute("goods", BillCodegoods);
		session.setAttribute("billCodes", billCode);
		model.addAttribute("judge", 1);
		return "client_pay";
	}

	// 跳转到订单详情
	@RequestMapping(value = "/client_billdetails/{billCode}", method = RequestMethod.GET)
	public String client_billdetails(Model model, HttpSession session, @PathVariable String billCode) {

		User loginer = (User) session.getAttribute("loginer");
		model.addAttribute("userScore", loginer.getUserScore());

		// 根据userID查询user表中的收获地址和联系电话
		User user = clientService.findUserInfromation(loginer.getUserId());
		// 判断Bill表中对应的userId和billCode的订单是否纯在如果纯在不添加，
		// 如果不存在就添加
		Bill bills = clientService.findBillsByUserID(loginer.getUserId(), billCode);

		List<Cart> BillCodegoods = clientService.findAllCartByBillCode(loginer.getUserId(), billCode);
		Bill billss = clientService.findBillsByUserID(loginer.getUserId(), billCode);
		model.addAttribute("billss", billss);
		// 计算总价
		double sum = 0;
		double sum2 = 0;
		double sum3 = 0;
		if (loginer.getUserScore() >= 3000) {
			for (Cart cart : BillCodegoods) {
				if (cart.getGoodsSell() <= 30) {
					model.addAttribute("userScore", loginer.getUserScore());
					double price = Math.ceil(0.7 * cart.getGoodsPrice()) * cart.getGoodsNumber();
					double sum1 = sum2 + price;
					sum2 = sum1;
					model.addAttribute("goods2", sum2);
				}
				else {
					double price = Math.ceil((1 - cart.getGoodsSell() * 0.01) * cart.getGoodsPrice())
							* cart.getGoodsNumber();
					double sum1 = sum3 + price;
					sum3 = sum1;
					model.addAttribute("goods3", sum3);
				}
			}
			model.addAttribute("billCode", billCode);
			model.addAttribute("billgoods", BillCodegoods);
			model.addAttribute("goods", BillCodegoods);
			return "client_billdetails";
		}
		for (Cart cart : BillCodegoods) {
			double price = Math.ceil((1 - cart.getGoodsSell() * 0.01) * cart.getGoodsPrice()) * cart.getGoodsNumber();
			double sum1 = sum + price;
			sum = sum1;
			model.addAttribute("goods1", sum);
		}
		model.addAttribute("billCode", billCode);
		model.addAttribute("billgoods", BillCodegoods);
		model.addAttribute("goods", BillCodegoods);

		return "client_billdetails";
	}

	// 添加商品用户评论
	@RequestMapping(value = "/client_goodscomment/{goodsId}", method = RequestMethod.POST)
	public String client_goodscomment(RedirectAttributes redirectAttributes, GoodsComment goodsComment, Goods goods,
			HttpSession session, HttpServletRequest request) {
		User loginer = (User) session.getAttribute("loginer");
		if (loginer.getIsEnable() == 1) {
			redirectAttributes.addFlashAttribute("err", "您已被屏蔽发言");
			return "redirect:/client/client_single_product/{goodsId}";
		}
		goodsComment.setCommentId(loginer.getUserId() + new Date());
		goodsComment.setGoods(goods);
		goodsComment.setUser(loginer);
		goodsComment.setCommentDate(new Date());
		clientService.addgoodsComment(goodsComment);
		return "redirect:/client/client_single_product/{goodsId}";
	}

	// 促销商品页面
	@RequestMapping(value = "/client_promo", method = RequestMethod.GET)
	public String client_promo(Model model) {
		List<Goods> goods = clientService.findAllGoodsbyshell();
		model.addAttribute("goods", goods);
		return "client_promo";
	}

	// 跳转到 client_view_person 页面
	@RequestMapping(value = "/client_view_person", method = RequestMethod.GET)
	public String clientViewPerson(HttpSession session, Model model) {
		// 获取session中的当前用户
		User loginer = (User) session.getAttribute("loginer");
		// 根据userId查询用户信息
		User person = userService.findUserById(loginer.getUserId());
		model.addAttribute("person", person);
		return "client_view_person";
	}

	// 跳转到 client_update_person 页面
	@RequestMapping(value = "/client_update_person", method = RequestMethod.GET)
	public String clientUpdatePerson(HttpSession session, Model model) {
		// 获取session中的当前用户
		User loginer = (User) session.getAttribute("loginer");
		// 根据userId查询用户信息
		User person = userService.findUserById(loginer.getUserId());
		model.addAttribute("person", person);

		return "client_update_person";
	}

	// 根据userId修改用户信息
	@RequestMapping(value = "/client_update_person", method = RequestMethod.POST)
	public String clientUpdatePerson(User user, HttpSession session, Model model) {
		// 获取session中的当前用户
		User loginer = (User) session.getAttribute("loginer");
		user.setUserId(loginer.getUserId());
		// 根据userId修改用户信息
		userService.updateUserMsgByUserId(user);
		// 修改数据库不等同修改session,手动设值session保持同步
		loginer.setUserAlice(user.getUserAlice());
		loginer.setUserSex(user.getUserSex());
		loginer.setUserPhone(user.getUserPhone());
		loginer.setUserEmail(user.getUserEmail());
		loginer.setUserAddress(user.getUserAddress());

		return "redirect:/client/client_update_person";
	}

	// 跳转到 client_user_alterpsw 页面
	@RequestMapping(value = "/client_user_alterpsw", method = RequestMethod.GET)
	public String clientUserAlterPsw() {
		return "client_user_alterpsw";
	}

	// 根据userId修改userPsw
	@RequestMapping(value = "/client_user_alterpsw", method = RequestMethod.POST)
	public String clientUserAlterPsw(User ue, String newUserPsw, String reNewUserPsw, Model model,
			HttpSession session) {
		// 获取session中当前的loginer
		User loginer = (User) session.getAttribute("loginer");
		// 判断输入的三个密码信息是否为空
		if (StringUtils.isNullOrEmpty(ue.getUserPsw()) || StringUtils.isNullOrEmpty(newUserPsw)
				|| StringUtils.isNullOrEmpty(reNewUserPsw)) {
			model.addAttribute("error", "error message：密码信息未填写完整！");
			return "client_user_alterpsw";
		}
		// 验证新密码和确认密码是否相同
		if (!newUserPsw.equals(reNewUserPsw)) {
			model.addAttribute("error", "error message：新密码和确认新密码不一致！");
			return "client_user_alterpsw";
		}
		// 验证原始密码是否正确
		if (!DigestUtils.md5Hex(ue.getUserPsw()).equals(loginer.getUserPsw())) {
			model.addAttribute("error", "error message：原密码错误！");
			return "client_user_alterpsw";
		}
		// 设置当前要修改密码的userId给对象
		ue.setUserId(loginer.getUserId());
		// 设置新密码给对象
		ue.setUserPsw(newUserPsw);
		// 调动服务,修改密码(设置的新密码在服务中加密)
		userService.updateUserPswById(ue);
		model.addAttribute("error", "error message：修改密码成功！");
		// 更新当前session中的userPsw值为加密后的新密码
		// 修改数据库不等同修改session,手动设值session保持同步
		loginer.setUserPsw(DigestUtils.md5Hex(newUserPsw));

		return "client_user_alterpsw";
	}

	// 处理头像上传功能(AJAX) -- springMVC MultipartFile
	@RequestMapping(value = "/user_photo_upload", method = RequestMethod.POST)
	@ResponseBody
	public Object userPhotoUpload(String userId, MultipartFile uPhoto, HttpServletRequest request) {
		// fileName变量保存生成的图片名
		String fileName = null;
		Map<String, String> status = new HashMap<String, String>();
		// 当前端传来的uPhoto不为null时执行
		if (!uPhoto.isEmpty()) {
			// 文件上传路径
			String path = request.getSession().getServletContext().getRealPath("statics" + File.separator + "file");
			// 原文件名
			String oldFileName = uPhoto.getOriginalFilename();
			// 原文件后缀名
			String prefix = FilenameUtils.getExtension(oldFileName);
			int filesize = 1048576; // 规定1M
			// 上传大小不得超过 1M
			if (uPhoto.getSize() > filesize) {
				status.put("status", "上传文件大小不能超过1M");
				return JSON.toJSONString(status);
			} else if (prefix.equalsIgnoreCase("jpg") || prefix.equalsIgnoreCase("png")
					|| prefix.equalsIgnoreCase("gif")) {
				// 生成100以内随机数
				Random random = new Random();
				// fileName = 用户名 + 时间到秒 + 随机数 + "." + 原文件后缀名
				fileName = userId + new Date().getTime() + random.nextInt(100) + "." + prefix;
				File targetFile = new File(path, fileName);
				try {
					uPhoto.transferTo(targetFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else { // 上传图片格式不正确
				status.put("status", "上传图片格式不正确");
				return JSON.toJSONString(status);
			}
		}
		// 修改数据库中对应 userId的 userPhoto -- 修改mysql
		userService.updateUserPhotoById(userId, fileName);
		// 修改 loginer 的头像(修改session) -- session与数据库是不同步的 -- 修改session
		((User) request.getSession().getAttribute("loginer")).setUserPhoto(fileName);
		// 向前端发送修改成功状态值
		status.put("status", "success");
		status.put("filename", fileName);

		return JSON.toJSONString(status);
	}

	// 根据userId和billcode修改收货地址和手机号

	@RequestMapping(value = "/client_alter_phandad", method = RequestMethod.POST)
	public String clientAlterPhAndAD(HttpSession session, Bill bill, Model model,
			RedirectAttributes redirectAttributes) {
		// 获取当前session用户
		User loginer = (User) session.getAttribute("loginer");
		if (StringUtils.isNullOrEmpty(bill.getUserPhone()) || StringUtils.isNullOrEmpty(bill.getUserAddress())) {
			redirectAttributes.addFlashAttribute("msg", "输入信息不能为空");
			return "redirect:/client/client_pay";
		}
		String billCode = (String) session.getAttribute("billCodes");
		bill.setUserId(loginer.getUserId());
		bill.setBillCode(billCode);

		// 通过userId修改bill表联系人和地址
		clientService.updateBillByPhoneAndAddress(loginer.getUserId(), billCode, bill.getUserPhone(),
				bill.getUserAddress());

		model.addAttribute("userScore", loginer.getUserScore());
		// 根据userID查询购物车表中的用户添加的billCode等于0的商品信息
		List<Cart> goods = clientService.findAllCart(loginer.getUserId());
		// 如果查询出来不为空
		if (!goods.isEmpty()) {// 证明找到了用户添加的数据
			// 生成订单号
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Random random = new Random();
			int rannum = (int) (random.nextDouble() * (999 - 1 + 1)) + 10000;// 获取3位随机数
			String billCode1 = loginer.getUserId() + sdf.format(d) + rannum;
			// 把订单号保存在session当中
			session.setAttribute("billCodes", billCode1);

			// 根据userID查询user表中的收获地址和联系电话
			User user = clientService.findUserInfromation(loginer.getUserId());
			String goodsNames = "";
			for (Cart cart : goods) {// 循环为每个用户添加的商品修改订单号
				Integer goodsId = cart.getGoodsId();
				// 这里的问题!这里是根据userID和goodsID修改该表中所有的订单号(已解决在sql中给与billCode=0的限制即可)
				clientService.upBillCode(billCode, loginer.getUserId(), goodsId);
				String billGoods = goodsNames + cart.getGoodsName() + ".";
				goodsNames = billGoods;
			}
			// 判断Bill表中对应的userId和billCode的订单是否纯在如果纯在不添加，
			// 如果不存在就添加
			Bill bills = clientService.findBillsByUserID(loginer.getUserId(), billCode);
			if (bills == null) {
				Bill bill1 = new Bill();
				bill1.setBillCode(billCode);
				bill1.setBillGoods(goodsNames);
				bill1.setUserAddress(user.getUserAddress());
				bill1.setUserPhone(user.getUserPhone());
				bill1.setUserId(loginer.getUserId());
				clientService.addBill(bill1);
				Bill billss = clientService.findBillsByUserID(loginer.getUserId(), billCode);
				model.addAttribute("billss", billss);

			}

		}
		// else
		String billCodess = (String) session.getAttribute("billCodes");
		List<Cart> BillCodegoods = clientService.findAllCartByBillCode(loginer.getUserId(), billCodess);
		Bill billss = clientService.findBillsByUserID(loginer.getUserId(), billCodess);
		model.addAttribute("billss", billss);
		// 计算总价
		double sum = 0;
		double sum2 = 0;
		double sum3 = 0;
		if (loginer.getUserScore() > 3000) {

			for (Cart cart : BillCodegoods) {
				if (cart.getGoodsSell() <= 30) {
					model.addAttribute("userScore", loginer.getUserScore());
					double price = Math.ceil(0.7 * cart.getGoodsPrice()) * cart.getGoodsNumber();
					double sum1 = sum2 + price;
					sum2 = sum1;
					model.addAttribute("goods2", sum2);

				}

				else {
					double price = Math.ceil((1 - cart.getGoodsSell() * 0.01) * cart.getGoodsPrice())
							* cart.getGoodsNumber();
					double sum1 = sum3 + price;
					sum3 = sum1;
					model.addAttribute("goods3", sum3);
				}

			}

			model.addAttribute("billCode", billCodess);
			model.addAttribute("billgoods", BillCodegoods);
			model.addAttribute("goods", goods);
			model.addAttribute("billss", billss);
			model.addAttribute("judge", 2);
			return "client_pay";

		}
		for (Cart cart : BillCodegoods) {
			double price = Math.ceil((1 - cart.getGoodsSell() * 0.01) * cart.getGoodsPrice()) * cart.getGoodsNumber();
			double sum1 = sum + price;
			sum = sum1;
			model.addAttribute("goods1", sum);

		}

		model.addAttribute("billCode", billCodess);
		model.addAttribute("billgoods", BillCodegoods);
		model.addAttribute("billss", billss);
		model.addAttribute("judge", 2);

		return "client_pay";
	}

	// 根据userId和billcode修改收货地址和手机号
	@RequestMapping(value = "/client_alter_otherphandad/{billCode}", method = RequestMethod.POST)
	public String clientAlterotherPhAndAD(HttpSession session, Bill bill, Model model, @PathVariable String billCode,
			RedirectAttributes redirectAttributes) {
		// 获取当前session用户
		User loginer = (User) session.getAttribute("loginer");
		if (StringUtils.isNullOrEmpty(bill.getUserPhone()) || StringUtils.isNullOrEmpty(bill.getUserAddress())) {
			redirectAttributes.addFlashAttribute("msg", "输入信息不能为空");
			return "redirect:/client/client_pay";
		}

		bill.setUserId(loginer.getUserId());
		bill.setBillCode(billCode);

		// 通过userId修改bill表联系人和地址
		clientService.updateBillByPhoneAndAddress(loginer.getUserId(), billCode, bill.getUserPhone(),
				bill.getUserAddress());

		model.addAttribute("userScore", loginer.getUserScore());

		// 根据userID查询user表中的收获地址和联系电话
		User user = clientService.findUserInfromation(loginer.getUserId());
		// 判断Bill表中对应的userId和billCode的订单是否纯在如果纯在不添加，
		// 如果不存在就添加
		Bill bills = clientService.findBillsByUserID(loginer.getUserId(), billCode);

		List<Cart> BillCodegoods = clientService.findAllCartByBillCode(loginer.getUserId(), billCode);
		Bill billss = clientService.findBillsByUserID(loginer.getUserId(), billCode);
		model.addAttribute("billss", billss);
		// 计算总价
		double sum = 0;
		double sum2 = 0;
		double sum3 = 0;
		session.setAttribute("goods2", sum2);
		session.setAttribute("goods3", sum3);
		session.setAttribute("goods1", sum);
		if (loginer.getUserScore() > 3000) {

			for (Cart cart : BillCodegoods) {
				if (cart.getGoodsSell() <= 30) {
					model.addAttribute("userScore", loginer.getUserScore());
					double price = Math.ceil(0.7 * cart.getGoodsPrice()) * cart.getGoodsNumber();
					double sum1 = sum2 + price;
					sum2 = sum1;
					model.addAttribute("goods2", sum2);

				}

				else {
					double price = Math.ceil((1 - cart.getGoodsSell() * 0.01) * cart.getGoodsPrice())
							* cart.getGoodsNumber();
					double sum1 = sum3 + price;
					sum3 = sum1;
					model.addAttribute("goods3", sum3);

				}

			}

			model.addAttribute("billCode", billCode);
			model.addAttribute("billgoods", BillCodegoods);
			model.addAttribute("goods", BillCodegoods);
			session.setAttribute("billCodes", billCode);
			model.addAttribute("judge", 1);
			return "client_pay";

		}
		for (Cart cart : BillCodegoods) {
			double price = Math.ceil((1 - cart.getGoodsSell() * 0.01) * cart.getGoodsPrice()) * cart.getGoodsNumber();
			double sum1 = sum + price;
			sum = sum1;
			model.addAttribute("goods1", sum);
		}

		model.addAttribute("billCode", billCode);
		model.addAttribute("billgoods", BillCodegoods);
		model.addAttribute("goods", BillCodegoods);
		session.setAttribute("billCodes", billCode);
		model.addAttribute("judge", 1);
		return "client_pay";
	}

}
