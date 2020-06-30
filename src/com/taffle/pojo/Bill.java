package com.taffle.pojo;

public class Bill {
	private String billid;
	private String billCode;
	private String billGoods;
	private User user;
	private Integer status;
	public Bill() {}
	public Bill(String billid, String billCode, String billGoods, User user, Integer status) {
		super();
		this.billid = billid;
		this.billCode = billCode;
		this.billGoods = billGoods;
		this.user = user;
		this.status = status;
	}
	public String getBillid() {
		return billid;
	}
	public void setBillid(String billid) {
		this.billid = billid;
	}
	public String getBillCode() {
		return billCode;
	}
	public void setBillCode(String billCode) {
		this.billCode = billCode;
	}
	public String getBillGoods() {
		return billGoods;
	}
	public void setBillGoods(String billGoods) {
		this.billGoods = billGoods;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
}
