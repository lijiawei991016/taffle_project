package com.taffle.dao;

import java.util.List;

import com.taffle.pojo.Category;
import com.taffle.pojo.Goods;

public interface GoodsMapper {
	//添加商品
	int addGoods(Goods goods);
	//查询分类
	List<Category> findAllCategory();
	//查询所有商品
	List<Goods> findAllGoods();
	//根据goodsId删除商品
	int deleteGoodsByGoodsId(int goodsId);
	//根据goodsId查找商品
	Goods findGoodsByGoodsId(int goodsId);
	//根据goodsId修改商品
	int updateGoodsByGoodsId(Goods goods);
}
