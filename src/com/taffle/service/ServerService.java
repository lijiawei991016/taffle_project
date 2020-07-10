package com.taffle.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.taffle.pojo.Blog;
import com.taffle.pojo.Category;
import com.taffle.pojo.Contact;
import com.taffle.pojo.Goods;
import com.taffle.pojo.Bill;

public interface ServerService {
	// 添加商品
	int addGoods(Goods goods);

	// 查询分类
	List<Category> findAllCategory();

	// 后台查找所有商品
	List<Goods> findAllServerGoods();

	// 根据goodsName查找对应商品
	Goods findGoodsByGoodsName(String goodsName);

	// 根据goodsId删除商品
	int deleteGoodsByGoodsId(int goodsId);

	// 根据goodsId查找商品
	Goods findGoodsByGoodsId(int goodsId);

	// 根据goodsId修改商品
	int updateGoodsByGoodsId(Goods goods);

	// 添加博客
	int addblog(Blog blog);

	// 根据id删除博客
	int delBlogById(Integer blogId);

	// 获取联系我们信息
	List<Contact> findlistcontact();

	// 添加新的分类
	int addNewCategory(String category);

	// 通过category查找对应字段
	Category findCategory(String category);

	// 查找所有分类
	List<Category> findCategoryAll();

	// 通过categoryId查找分类
	Category findCategoryById(Integer categoryId);

	// 修改分类
	int updateCategoryById(Category category);

	// 删除商品分类
	int delCategoryById(Integer categoryId);

	// 通过categoryId查询goods表
	Category findGoodsByCategory(Integer categoryId);

	// 获取所有订单
	List<Bill> findAllBill();

	// 修改 订单状态 的 status为1
	int updatefindBillCodetoone(String billCode);

	// 修改 订单状态 的 status为2
	int updatefindBillCodetotwo(String billCode);

	// 查询订单状态
	Bill findstatus(String billCode);

	// 删除订单
	int deletBillCodebystatus(String billCode);

}
