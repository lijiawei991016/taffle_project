package com.taffle.dao;

import com.taffle.pojo.Bill;
import com.taffle.pojo.User;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BillMapper {

	// 查询所有的订单
	List<Bill> findAllBill();

	// 修改订单状态为已发货
	int updatefindBillCodetoone(String billCode);

	// 修改订单状态为订单已完成
	int updatefindBillCodetotwo(String billCode);

	// 查询订单状态
	Bill findstatus(String billCode);

	// 删除订单
	int deletBillCodebystatus(String billCode);

	// 查询
	List<User> findUserById(User user);

	// 根据userId和billCode修改订单状态为已付款1
	int updateBillCode(@Param("billCode") String billCode, @Param("userId") String userId);

	// 查询所有对应账户下的的订单
	List<Bill> findAllBillByUid(String userId);

	// 根据userId和billCode修改订单状态为已收货3
	int updateBillCodeThree(@Param("billCode") String billCode, @Param("userId") String userId);

	// 根据userId和billCode删除订单
	int deleteBillCode(@Param("billCode") String billCode, @Param("userId") String userId);

	// 根据userID和Code查询订单状态
	Bill findstatusBy(@Param("billCode") String billCode, @Param("userId") String userId);

	// 修改支付页面的联系人和收货地址
	int updateBillByPhoneAndAddress(@Param("userId") String userId, @Param("billCode") String billCode,
			@Param("userPhone") String userPhone, @Param("userAddress") String userAddress);
}
