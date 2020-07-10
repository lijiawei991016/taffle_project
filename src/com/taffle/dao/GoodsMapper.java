package com.taffle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.taffle.pojo.Category;
import com.taffle.pojo.Goods;

public interface GoodsMapper {
	// 添加商品
	int addGoods(Goods goods);

	// 查询分类
	List<Category> findAllCategory();

	// 后台查找所有商品
	List<Goods> findAllServerGoods();

	// 根据categoryId查询所有商品
	List<Goods> findAllGoods(@Param("categoryId") Integer categoryId, @Param("goodsName") String goodsName);

	// 根据goodsName查找对应商品
	Goods findGoodsByGoodsName(String goodsName);

	// 根据goodsId删除商品
	int deleteGoodsByGoodsId(int goodsId);

	// 根据goodsId查找商品
	Goods findGoodsByGoodsId(int goodsId);

	// 根据goodsId修改商品
	int updateGoodsByGoodsId(Goods goods);

	// 查找所有促销商品
	List<Goods> findAllGoodsbyshell();
}
