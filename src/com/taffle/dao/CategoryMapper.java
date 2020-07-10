package com.taffle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.taffle.pojo.Category;

public interface CategoryMapper {

	// 添加商品分类
	int addNewCategory(String category);

	// 通过category查找
	Category findCategory(String category);

	// 查找所有分类
	List<Category> findAllCategory();

	// categoryId查找分类
	Category findCategoryById(Integer categoryId);

	// 修改分类
	int updateCategoryById(Category category);

	// 根据categoryId查找商品表goodCategory
	Category findGoodsByCategory(Integer categoryId);

	// 删除商品分类
	int delCategoryById(Integer categoryId);
}
