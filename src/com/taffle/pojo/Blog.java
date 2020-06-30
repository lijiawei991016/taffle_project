package com.taffle.pojo;

import java.util.Date;

public class Blog {
	private Integer blogId;
	private String blogTitle;
	private String blogMessage;
	private String blogPhoto;
	private Date blogCreateDate;
	public Blog() {}
	public Blog(Integer blogId, String blogTitle, String blogMessage, String blogPhoto, Date blogCreateDate) {
		super();
		this.blogId = blogId;
		this.blogTitle = blogTitle;
		this.blogMessage = blogMessage;
		this.blogPhoto = blogPhoto;
		this.blogCreateDate = blogCreateDate;
	}
	public Integer getBlogId() {
		return blogId;
	}
	public void setBlogId(Integer blogId) {
		this.blogId = blogId;
	}
	public String getBlogTitle() {
		return blogTitle;
	}
	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}
	public String getBlogMessage() {
		return blogMessage;
	}
	public void setBlogMessage(String blogMessage) {
		this.blogMessage = blogMessage;
	}
	public String getBlogPhoto() {
		return blogPhoto;
	}
	public void setBlogPhoto(String blogPhoto) {
		this.blogPhoto = blogPhoto;
	}
	public Date getBlogCreateDate() {
		return blogCreateDate;
	}
	public void setBlogCreateDate(Date blogCreateDate) {
		this.blogCreateDate = blogCreateDate;
	}
}
