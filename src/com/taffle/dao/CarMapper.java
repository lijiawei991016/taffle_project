package com.taffle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.taffle.pojo.Bill;
import com.taffle.pojo.Cart;
import com.taffle.pojo.User;

public interface CarMapper {

	// 查询对应ID下的所有商品
	List<Cart> findAllCart(String userId);

	// 添加商品到购物车
	int addCart(Cart cart);

	// 根据userID和goodsID判断数据口中该用户对应的商品是否存在
	Cart findCartsByUserID(@Param("userId") String userId, @Param("goodsId") Integer goodsId);

	// 根据userID和goodsID删除该用户对应的商品
	int deCartsByUserID(@Param("userId") String userId, @Param("goodsId") Integer goodsId);

	// 根据userID和goodsID修改该用户对应的商品数量
	int upCartsByUserID(@Param("userId") String userId, @Param("goodsId") Integer goodsId,
			@Param("goodsNumber") Integer goodsNumber);

	// 生成订单号并且添加进对应goodsId下没有订单号的商品
	int upBillCode(@Param("billCode") String billCode, @Param("userId") String userId,
			@Param("goodsId") Integer goodsId);

	// 查询对应ID和billCode下的所有商品
	List<Cart> findAllCartByBillCode(@Param("userId") String userId, @Param("billCode") String billCode);

	// 添加订单到订单表
	int addBill(Bill bill);

	// 根据userID查询收获地址和联系电话
	User findUserInfromation(String userId);

	// 根据userID和goodsID判断数据口中该用户对应的商品是否存在
	Bill findBillsByUserID(@Param("userId") String userId, @Param("billCode") String billCode);

	// 修改对应ID和BillCode下的所有商品
	int upfindAllCartByIDCode(@Param("userId") String userId, @Param("billCode") String billCode);

	// 修改对应ID和Bill表中的billCode
	int defindBillCodeByIDCode(@Param("userId") String userId, @Param("billCode") String billCode);

	// 根据对应的userid和billCode删除cart表中的对应的商品
	int defindcartByIDCode(@Param("userId") String userId, @Param("billCode") String billCode);
}
