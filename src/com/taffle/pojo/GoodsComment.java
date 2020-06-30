package com.taffle.pojo;

import java.util.Date;

public class GoodsComment {
	private String commentId;
	private String commentMessage;
	private Goods goods;
	private User user;
	private Date commentDate;
	public GoodsComment() {}
	public GoodsComment(String commentId, String commentMessage, Goods goods, User user, Date commentDate) {
		super();
		this.commentId = commentId;
		this.commentMessage = commentMessage;
		this.goods = goods;
		this.user = user;
		this.commentDate = commentDate;
	}
	public String getCommentId() {
		return commentId;
	}
	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}
	public String getCommentMessage() {
		return commentMessage;
	}
	public void setCommentMessage(String commentMessage) {
		this.commentMessage = commentMessage;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
}
