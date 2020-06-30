package com.taffle.pojo;

import java.util.Date;

public class BlogSay {
	private Integer sayId;
	private String sayMessage;
	private User user;
	private Date sayCreateDate;
	public BlogSay() {}
	public BlogSay(Integer sayId, String sayMessage, User user, Date sayCreateDate) {
		super();
		this.sayId = sayId;
		this.sayMessage = sayMessage;
		this.user = user;
		this.sayCreateDate = sayCreateDate;
	}
	public Integer getSayId() {
		return sayId;
	}
	public void setSayId(Integer sayId) {
		this.sayId = sayId;
	}
	public String getSayMessage() {
		return sayMessage;
	}
	public void setSayMessage(String sayMessage) {
		this.sayMessage = sayMessage;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getSayCreateDate() {
		return sayCreateDate;
	}
	public void setSayCreateDate(Date sayCreateDate) {
		this.sayCreateDate = sayCreateDate;
	}
}
