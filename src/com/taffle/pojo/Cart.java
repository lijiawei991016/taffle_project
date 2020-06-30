package com.taffle.pojo;

import java.util.Date;

public class Cart {
	private Integer cartId;
	private User user;
	private Goods goods;
	private Integer Number;
	private Date cartCreateDate;
	private Date cartUpdateDate;
	public Cart() {}
	public Cart(Integer cartId, User user, Goods goods, Integer number, Date cartCreateDate, Date cartUpdateDate) {
		super();
		this.cartId = cartId;
		this.user = user;
		this.goods = goods;
		Number = number;
		this.cartCreateDate = cartCreateDate;
		this.cartUpdateDate = cartUpdateDate;
	}
	public Integer getCartId() {
		return cartId;
	}
	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public Integer getNumber() {
		return Number;
	}
	public void setNumber(Integer number) {
		Number = number;
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
}
