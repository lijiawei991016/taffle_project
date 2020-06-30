package com.taffle.pojo;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;

public class User {
	@NotBlank(message="账户不能为空")
	private String userId;
	@NotBlank(message="密码不能为空")
	private String userPsw;
	private String userAlice;
	private String userEmail;
	private String userSex;
	private String userAddress;
	private String userPhone;
	private String userPhoto;
	private double userScore;
	private Date userCreateDate;
	private Date userUpdateDate;
	private Integer isEnable;
	public User() {}
	public User(String userId, String userPsw, String userAlice, String userEmail, String userSex, String userAddress,
			String userPhone, String userPhoto, double userScore, Date userCreateDate, Date userUpdateDate,
			Integer isEnable) {
		super();
		this.userId = userId;
		this.userPsw = userPsw;
		this.userAlice = userAlice;
		this.userEmail = userEmail;
		this.userSex = userSex;
		this.userAddress = userAddress;
		this.userPhone = userPhone;
		this.userPhoto = userPhoto;
		this.userScore = userScore;
		this.userCreateDate = userCreateDate;
		this.userUpdateDate = userUpdateDate;
		this.isEnable = isEnable;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPsw() {
		return userPsw;
	}
	public void setUserPsw(String userPsw) {
		this.userPsw = userPsw;
	}
	public String getUserAlice() {
		return userAlice;
	}
	public void setUserAlice(String userAlice) {
		this.userAlice = userAlice;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	public double getUserScore() {
		return userScore;
	}
	public void setUserScore(double userScore) {
		this.userScore = userScore;
	}
	public Date getUserCreateDate() {
		return userCreateDate;
	}
	public void setUserCreateDate(Date userCreateDate) {
		this.userCreateDate = userCreateDate;
	}
	public Date getUserUpdateDate() {
		return userUpdateDate;
	}
	public void setUserUpdateDate(Date userUpdateDate) {
		this.userUpdateDate = userUpdateDate;
	}
	public Integer getIsEnable() {
		return isEnable;
	}
	public void setIsEnable(Integer isEnable) {
		this.isEnable = isEnable;
	}
}
