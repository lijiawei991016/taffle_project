package com.taffle.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.taffle.pojo.Bill;
import com.taffle.pojo.Blog;
import com.taffle.pojo.BlogSay;
import com.taffle.pojo.Cart;
import com.taffle.pojo.Category;
import com.taffle.pojo.Contact;
import com.taffle.pojo.Goods;
import com.taffle.pojo.GoodsComment;
import com.taffle.pojo.User;

public interface ClientService {
	int addContactMsg(Contact contact);

	// 获取所有博客
	List<Blog> findlistblog();

	// 根据id 查找对应的博客列表
	Blog findblogByblogId(Integer blogId);

	// 添加博客评论
	int addblogsay(BlogSay blogSay);

	// 根据blogid 获取其所有对应的博客
	List<BlogSay> findblogsayByblogId(Integer blogId);

	// 添加商品用户评论 -->
	int addgoodsComment(GoodsComment goodsComment);

	// <!-- 根据goodsId 获取其所有对应的用户评论 -->
	List<GoodsComment> findGoodsCommentBygoodsId(Integer goodsId);

	// 查找所有促销商品
	List<Goods> findAllGoodsbyshell();

	// 根据categoryId、goodsName查询所有商品
	List<Goods> findAllGoods(Integer categoryId, String goodsName);

	// 查询分类
	List<Category> findAllCategory();

	// 查询对应ID下的所有商品
	List<Cart> findAllCart(String userId);

	// 添加到购物车
	int addCart(Cart cart);

	// 根据userID和goodsID判断数据口中该用户对应的商品是否存在
	Cart findCartsByUserID(@Param("userId") String userId, @Param("goodsId") Integer goodsId);

	// 根据userID和goodsID删除该用户对应的商品
	int deCartsByUserID(@Param("userId") String userId, @Param("goodsId") Integer goodsId);

	// 根据userID和goodsID删除该用户对应的商品数量
	int upCartsByUserID(@Param("userId") String userId, @Param("goodsId") Integer goodsId,
			@Param("goodsNumber") Integer goodsNumber);

	// 生成订单号并且添加进对应goodsId下没有订单号的商品
	int upBillCode(@Param("billCode") String billCode, @Param("userId") String userId,
			@Param("goodsId") Integer goodsId);

	// 查找刚生成的订单中的所有商品
	List<Cart> findAllCartByBillCode(@Param("userId") String userId, @Param("billCode") String billCode);

	// 添加订单到订单表
	int addBill(Bill bill);

	// 根据userID查询收获地址和联系电话
	User findUserInfromation(String userId);

	// 根据userID和goodsID判断数据口中该用户对应的商品是否存在
	Bill findBillsByUserID(@Param("userId") String userId, @Param("billCode") String billCode);

	// 修改对应ID和BillCode下的所有商品
	int upfindAllCartByIDCode(@Param("userId") String userId, @Param("billCode") String billCode);

	// 删除对应ID和BillCode中的数据
	int defindBillCodeByIDCode(@Param("userId") String userId, @Param("billCode") String billCode);

	// 根据userId和billCode修改订单状态为已付款1
	int updateBillCode(@Param("billCode") String billCode, @Param("userId") String userId);

	// 查询所有对应账户下的的订单
	List<Bill> findAllBillByUid(String userId);

	// 根据userId和billCode修改订单状态为已收货3
	int updateBillCodeThree(@Param("billCode") String billCode, @Param("userId") String userId);

	// 根据userId和billCode删除订单
	int deleteBillCode(@Param("billCode") String billCode, @Param("userId") String userId);

	// 根据对应的userid和billCode删除cart表中的对应的商品
	int defindcartByIDCode(@Param("userId") String userId, @Param("billCode") String billCode);

	// 根据userID和Code查询订单状态
	Bill findstatusBy(@Param("billCode") String billCode, @Param("userId") String userId);

	// 修改支付页面的联系人和收货地址
	int updateBillByPhoneAndAddress(String userId, String billCode, String userAddress, String userPhone);

	// <!-- 根据userid修改用户积分 -->
	int upuserScore(@Param("userScore") double userScore, @Param("userId") String userId);
}
