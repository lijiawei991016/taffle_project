package com.taffle.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.taffle.dao.BillMapper;
import com.taffle.dao.BlogMapper;
import com.taffle.dao.BlogSayMapper;
import com.taffle.dao.CarMapper;
import com.taffle.dao.ContactMapper;
import com.taffle.dao.GoodsCommentMapper;
import com.taffle.dao.GoodsMapper;
import com.taffle.dao.UserMapper;
import com.taffle.pojo.Bill;
import com.taffle.pojo.Blog;
import com.taffle.pojo.BlogSay;
import com.taffle.pojo.Cart;
import com.taffle.pojo.Category;
import com.taffle.pojo.Contact;
import com.taffle.pojo.Goods;
import com.taffle.pojo.GoodsComment;
import com.taffle.pojo.User;
import com.taffle.service.ClientService;

@Service("clientService")
public class ClientServiceImpl implements ClientService {
	@Resource
	private ContactMapper contactMapper;
	@Resource
	private BlogMapper blogMapper;
	@Resource
	private BlogSayMapper blogsayMapper;
	@Resource
	private GoodsCommentMapper goodsCommentMapper;
	@Resource
	private GoodsMapper goodsMapper;
	@Resource
	private CarMapper carMapper;
	@Resource
	private BillMapper billMapper;
	@Resource
	private UserMapper userMapper;

	// 添加联系我们到数据库
	@Override
	public int addContactMsg(Contact contact) {
		return contactMapper.addContactMsg(contact);
	}

	// 显示所有博客
	@Override
	public List<Blog> findlistblog() {
		return blogMapper.findlistblog();
	}

	// 根据blogId查找
	@Override
	public Blog findblogByblogId(Integer blogId) {
		return blogMapper.findblogByblogId(blogId);
	}

	// 添加博客评论
	@Override
	public int addblogsay(BlogSay blogSay) {
		return blogsayMapper.addblogsay(blogSay);
	}

	// 根据blogid 获取其所有对应的博客
	@Override
	public List<BlogSay> findblogsayByblogId(Integer blogId) {
		return blogsayMapper.findblogsayByblogId(blogId);
	}

	// 添加商品用户评论 -->
	@Override
	public int addgoodsComment(GoodsComment goodsComment) {
		return goodsCommentMapper.addgoodsComment(goodsComment);
	}

	// <!-- 根据goodsId 获取其所有对应的用户评论 -->
	@Override
	public List<GoodsComment> findGoodsCommentBygoodsId(Integer goodsId) {
		return goodsCommentMapper.findGoodsCommentBygoodsId(goodsId);
	}

	// 查找所有促销商品
	@Override
	public List<Goods> findAllGoodsbyshell() {
		return goodsMapper.findAllGoodsbyshell();
	}

	// 查询所有商品
	@Override
	public List<Goods> findAllGoods(Integer categoryId, String goodsName) {
		return goodsMapper.findAllGoods(categoryId, goodsName);
	}

	// 查询分类
	@Override
	public List<Category> findAllCategory() {
		return goodsMapper.findAllCategory();
	}

	// 查询该用户添加的所有商品
	@Override
	public List<Cart> findAllCart(String userId) {
		return carMapper.findAllCart(userId);
	}

	// 添加商品到购物车
	@Override
	public int addCart(Cart cart) {
		return carMapper.addCart(cart);
	}

	// 根据userID和goodsID判断数据口中该用户对应的商品是否存在
	public Cart findCartsByUserID(String userId, Integer goodsId) {
		return carMapper.findCartsByUserID(userId, goodsId);
	}

	// 根据userID和goodsID删除该用户对应的商品
	public int deCartsByUserID(String userId, Integer goodsId) {
		return carMapper.deCartsByUserID(userId, goodsId);
	}

	// 根据userID和goodsID删除该用户对应的商品数量
	public int upCartsByUserID(String userId, Integer goodsId, Integer goodsNumber) {
		return carMapper.upCartsByUserID(userId, goodsId, goodsNumber);
	}

	// 生成订单号并且添加进对应goodsId下没有订单号的商品
	public int upBillCode(String billCode, String userId, Integer goodsId) {
		return carMapper.upBillCode(billCode, userId, goodsId);
	}

	// 查找刚生成的订单中的所有商品
	@Override
	public List<Cart> findAllCartByBillCode(String userId, String billCode) {
		return carMapper.findAllCartByBillCode(userId, billCode);
	}

	// 添加订单到订单表
	@Override
	public int addBill(Bill bill) {
		return carMapper.addBill(bill);
	}

	// 根据userID查询收获地址和联系电话
	public User findUserInfromation(String userId) {
		return carMapper.findUserInfromation(userId);
	}

	// 根据userID和goodsID判断数据口中该用户对应的商品是否存在
	public Bill findBillsByUserID(String userId, String billCode) {
		return carMapper.findBillsByUserID(userId, billCode);
	}

	// 修改对应ID和BillCode下的所有商品
	public int upfindAllCartByIDCode(String userId, String billCode) {
		return carMapper.upfindAllCartByIDCode(userId, billCode);
	}

	// 修改对应ID和Bill表中的billCode
	public int defindBillCodeByIDCode(@Param("userId") String userId, @Param("billCode") String billCode) {
		return carMapper.defindBillCodeByIDCode(userId, billCode);
	}

	// 根据userId和billCode修改订单状态为已付款1
	public int updateBillCode(@Param("billCode") String billCode, @Param("userId") String userId) {
		return billMapper.updateBillCode(billCode, userId);
	}

	// 查询所有对应账户下的的订单
	public List<Bill> findAllBillByUid(String userId) {
		return billMapper.findAllBillByUid(userId);
	}

	// 根据userId和billCode修改订单状态为已收货3
	public int updateBillCodeThree(@Param("billCode") String billCode, @Param("userId") String userId) {
		return billMapper.updateBillCodeThree(billCode, userId);
	}

	// 根据userId和billCode删除订单
	public int deleteBillCode(@Param("billCode") String billCode, @Param("userId") String userId) {
		return billMapper.deleteBillCode(billCode, userId);
	}

	// 根据对应的userid和billCode删除cart表中的对应的商品
	public int defindcartByIDCode(@Param("userId") String userId, @Param("billCode") String billCode) {
		return carMapper.defindcartByIDCode(userId, billCode);
	}

	// 根据userID和Code查询订单状态
	public Bill findstatusBy(@Param("billCode") String billCode, @Param("userId") String userId) {
		return billMapper.findstatusBy(billCode, userId);
	}

	// 修改支付页面的联系人和收货地址
	@Override
	public int updateBillByPhoneAndAddress(String userId, String billCode, String userPhone, String userAddress) {
		return billMapper.updateBillByPhoneAndAddress(userId, billCode, userPhone, userAddress);
	}

	@Override
	// <!-- 根据userid修改用户积分 -->
	public int upuserScore(@Param("userScore") double userScore, @Param("userId") String userId) {
		return userMapper.upuserScore(userScore, userId);
	}

}
