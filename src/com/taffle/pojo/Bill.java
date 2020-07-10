package com.taffle.pojo;

public class Bill {
	private Integer billid;
	private String billCode;
	private String billGoods;
	private String userId;
	private Integer status;
	private String userPhone;
	private String userAddress;
	public Bill() {}
	
	public Bill(Integer billid, String billCode, String billGoods, String userId, Integer status, String userPhone,
			String userAddress) {
		this.billid = billid;
		this.billCode = billCode;
		this.billGoods = billGoods;
		this.userId = userId;
		this.status = status;
		this.userPhone = userPhone;
		this.userAddress = userAddress;
	}
	public Integer getBillid() {
		return billid;
	}
	public void setBillid(Integer billid) {
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	
	
}
