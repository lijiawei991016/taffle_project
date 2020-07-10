package com.taffle.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.taffle.dao.BillMapper;
import com.taffle.dao.BlogMapper;
import com.taffle.dao.CategoryMapper;
import com.taffle.dao.ContactMapper;
import com.taffle.dao.GoodsMapper;
import com.taffle.pojo.Blog;
import com.taffle.pojo.Category;
import com.taffle.pojo.Contact;
import com.taffle.pojo.Goods;
import com.taffle.service.ServerService;
import com.taffle.pojo.Bill;

@Service("serverService")
public class ServerServiceImpl implements ServerService {
	@Resource
	private GoodsMapper goodsMapper;
	@Resource
	private BlogMapper blogMapper;
	@Resource
	private CategoryMapper categoryMapper;
	@Resource
	private ContactMapper contactMapper;
	@Resource
	private BillMapper BillMapper;

	// 添加商品
	@Override
	public int addGoods(Goods goods) {
		return goodsMapper.addGoods(goods);
	}

	// 查询分类
	@Override
	public List<Category> findAllCategory() {
		return goodsMapper.findAllCategory();
	}

	// 后台查询所有商品
	@Override
	public List<Goods> findAllServerGoods() {
		return goodsMapper.findAllServerGoods();
	}

	// 根据goodsName查找对应商品
	@Override
	public Goods findGoodsByGoodsName(String goodsName) {
		return goodsMapper.findGoodsByGoodsName(goodsName);
	}

	// 删除商品
	@Override
	public int deleteGoodsByGoodsId(int goodsId) {
		return goodsMapper.deleteGoodsByGoodsId(goodsId);
	}

	// 根据goodsId查找商品
	@Override
	public Goods findGoodsByGoodsId(int goodsId) {
		return goodsMapper.findGoodsByGoodsId(goodsId);
	}

	// 根据goodsId修改商品
	@Override
	public int updateGoodsByGoodsId(Goods goods) {
		return goodsMapper.updateGoodsByGoodsId(goods);
	}

	// 添加博客
	@Override
	public int addblog(Blog blog) {
		return blogMapper.addblog(blog);
	}

	@Override
	public int delBlogById(Integer blogId) {
		return blogMapper.delBlogById(blogId);
	}

	// 获取联系我们信息
	@Override
	public List<Contact> findlistcontact() {
		return contactMapper.findlistcontact();
	}

	// 添加商品分类
	@Override
	public int addNewCategory(String category) {

		return categoryMapper.addNewCategory(category);
	}

	// 查找分类
	@Override
	public Category findCategory(String category) {
		// TODO Auto-generated method stub
		return categoryMapper.findCategory(category);
	}

	// 查找所有分类
	@Override
	public List<Category> findCategoryAll() {

		return categoryMapper.findAllCategory();
	}

	// 根据id查找分类
	@Override
	public Category findCategoryById(Integer categoryId) {

		return categoryMapper.findCategoryById(categoryId);
	}

	// 修改分类
	@Override
	public int updateCategoryById(Category category) {

		return categoryMapper.updateCategoryById(category);
	}

	// 删除商品分类
	@Override
	public int delCategoryById(Integer categoryId) {

		return categoryMapper.delCategoryById(categoryId);
	}

	// 通过categoryId查询goods表
	@Override
	public Category findGoodsByCategory(Integer categoryId) {

		return categoryMapper.findGoodsByCategory(categoryId);
	}

	// 查询所有订单
	@Override
	public List<Bill> findAllBill() {
		return BillMapper.findAllBill();
	}

	// 查询订单状态
	@Override
	public Bill findstatus(String billCode) {
		return BillMapper.findstatus(billCode);
	}

	// 修改 订单状态 的 status为1
	@Override
	public int updatefindBillCodetoone(String billCode) {
		return BillMapper.updatefindBillCodetoone(billCode);
	}

	// 修改 订单状态 的 status为2
	@Override
	public int updatefindBillCodetotwo(String billCode) {
		return BillMapper.updatefindBillCodetotwo(billCode);
	}

	// 删除订单
	@Override
	public int deletBillCodebystatus(String billCode) {
		return BillMapper.deletBillCodebystatus(billCode);
	}

}
