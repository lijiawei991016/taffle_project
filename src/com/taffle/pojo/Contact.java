package com.taffle.pojo;

public class Contact {
	private Integer contactId;
	private String contactName;
	private String contactEmail;
	private String contactMessage;
	public Contact() {}
	public Contact(Integer contactId, String contactName, String contactEmail, String contactMessage) {
		super();
		this.contactId = contactId;
		this.contactName = contactName;
		this.contactEmail = contactEmail;
		this.contactMessage = contactMessage;
	}
	public Integer getContactId() {
		return contactId;
	}
	public void setContactId(Integer contactId) {
		this.contactId = contactId;
	}
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public String getContactEmail() {
		return contactEmail;
	}
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}
	public String getContactMessage() {
		return contactMessage;
	}
	public void setContactMessage(String contactMessage) {
		this.contactMessage = contactMessage;
	}
}
