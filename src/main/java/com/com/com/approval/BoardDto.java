package com.com.com.approval;

import java.util.Date;

public class BoardDto {
	
	private int bNum;
	private String memId;
	private String subject;
	private String content;
	private Date createdDate;
	private Date signedDate;
	private String signedId;
	private String signedName;
	private String signedCondition;
	private MemberDto member;
	
	
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Date getSignedDate() {
		return signedDate;
	}
	public void setSignedDate(Date signedDate) {
		this.signedDate = signedDate;
	}
	public String getSignedId() {
		return signedId;
	}
	public void setSignedId(String signedId) {
		this.signedId = signedId;
	}
	public String getSignedName() {
		return signedName;
	}
	public void setSignedName(String signedName) {
		this.signedName = signedName;
	}
	public String getSignedCondition() {
		return signedCondition;
	}
	public void setSignedCondition(String signedCondition) {
		this.signedCondition = signedCondition;
	}
	public MemberDto getMember() {
		return member;
	}
	public void setMember(MemberDto member) {
		this.member = member;
	}
	
	
}
