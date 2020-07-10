package com.taffle.pojo;

import java.util.Date;

public class Cart {
	private Integer cartId;
	private String userId;
	private Integer goodsId;
	private String goodsName;
	private Integer goodsNumber;
	private Date cartCreateDate;
	private Date cartUpdateDate;
	private String billCode;
	private Integer goodsSell;
	private double goodsPrice;
	private String goodsPhoto;
	public Cart() {	
	}
	public Cart(Integer cartId, String userId, Integer goodsId, String goodsName, Integer goodsNumber,
			Date cartCreateDate, Date cartUpdateDate, String billCode, Integer goodsSell, double goodsPrice,
			String goodsPhoto) {
		this.cartId = cartId;
		this.userId = userId;
		this.goodsId = goodsId;
		this.goodsName = goodsName;
		this.goodsNumber = goodsNumber;
		this.cartCreateDate = cartCreateDate;
		this.cartUpdateDate = cartUpdateDate;
		this.billCode = billCode;
		this.goodsSell = goodsSell;
		this.goodsPrice = goodsPrice;
		this.goodsPhoto = goodsPhoto;
	}
	public Integer getCartId() {
		return cartId;
	}
	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public Integer getGoodsNumber() {
		return goodsNumber;
	}
	public void setGoodsNumber(Integer goodsNumber) {
		this.goodsNumber = goodsNumber;
	}
	public Date getCartCreateDate() {
		return cartCreateDate;
	}
	public void setCartCreateDate(Date cartCreateDate) {
		this.cartCreateDate = cartCreateDate;
	}
	public Date getCartUpdateDate() {
		return cartUpdateDate;
	}
	public void setCartUpdateDate(Date cartUpdateDate) {
		this.cartUpdateDate = cartUpdateDate;
	}
	public String getBillCode() {
		return billCode;
	}
	public void setBillCode(String billCode) {
		this.billCode = billCode;
	}
	public Integer getGoodsSell() {
		return goodsSell;
	}
	public void setGoodsSell(Integer goodsSell) {
		this.goodsSell = goodsSell;
	}
	public double getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(double goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public String getGoodsPhoto() {
		return goodsPhoto;
	}
	public void setGoodsPhoto(String goodsPhoto) {
		this.goodsPhoto = goodsPhoto;
	}
	
}
