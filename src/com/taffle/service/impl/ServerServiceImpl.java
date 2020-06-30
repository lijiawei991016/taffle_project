package com.taffle.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.taffle.dao.BlogMapper;
import com.taffle.dao.GoodsMapper;
import com.taffle.pojo.Blog;
import com.taffle.pojo.Category;
import com.taffle.pojo.Goods;
import com.taffle.service.ServerService;

@Service("serverService")
public class ServerServiceImpl implements ServerService {
	@Resource
	private GoodsMapper goodsMapper;
	@Resource
	private BlogMapper blogMapper;
	//添加商品
	@Override
	public int addGoods(Goods goods) {
		return goodsMapper.addGoods(goods);
	}

	//查询分类
	@Override
	public List<Category> findAllCategory() {
		return goodsMapper.findAllCategory();
	}

	//查询所有商品
	@Override
	public List<Goods> findAllGoods() {
		return goodsMapper.findAllGoods();
	}

	//删除商品
	@Override
	public int deleteGoodsByGoodsId(int goodsId) {
		return goodsMapper.deleteGoodsByGoodsId(goodsId);
	}

	//根据goodsId查找商品
	@Override
	public Goods findGoodsByGoodsId(int goodsId) {
		return goodsMapper.findGoodsByGoodsId(goodsId);
	}

	//根据goodsId修改商品
	@Override
	public int updateGoodsByGoodsId(Goods goods) {
		return goodsMapper.updateGoodsByGoodsId(goods);
	}
	//添加博客
	@Override
	public int addblog(Blog blog) {
		return blogMapper.addblog(blog);
	}
	
	

}
