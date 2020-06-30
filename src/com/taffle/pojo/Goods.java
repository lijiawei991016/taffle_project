package com.taffle.pojo;

public class Goods {
	private Integer goodsId;
	private String goodsName;
	private String goodsMessage;
	private String goodsPhoto;
	private Category category;
	private double goodsPrice;
	private Integer goodsSell;
	public Goods() {}
	public Goods(Integer goodsId, String goodsName, String goodsMessage, String goodsPhoto, Category category,
			double goodsPrice, Integer goodsSell) {
		super();
		this.goodsId = goodsId;
		this.goodsName = goodsName;
		this.goodsMessage = goodsMessage;
		this.goodsPhoto = goodsPhoto;
		this.category = category;
		this.goodsPrice = goodsPrice;
		this.goodsSell = goodsSell;
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsMessage() {
		return goodsMessage;
	}
	public void setGoodsMessage(String goodsMessage) {
		this.goodsMessage = goodsMessage;
	}
	public String getGoodsPhoto() {
		return goodsPhoto;
	}
	public void setGoodsPhoto(String goodsPhoto) {
		this.goodsPhoto = goodsPhoto;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public double getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(double goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public Integer getGoodsSell() {
		return goodsSell;
	}
	public void setGoodsSell(Integer goodsSell) {
		this.goodsSell = goodsSell;
	}
}
