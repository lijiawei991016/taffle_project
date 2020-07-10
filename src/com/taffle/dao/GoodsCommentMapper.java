package com.taffle.dao;

import java.util.List;

import com.taffle.pojo.GoodsComment;

public interface GoodsCommentMapper {
	// 添加商品用户评论 -->
	int addgoodsComment(GoodsComment goodsComment);

	// <!-- 根据goodsId 获取其所有对应的用户评论 -->
	List<GoodsComment> findGoodsCommentBygoodsId(Integer goodsId);
}
