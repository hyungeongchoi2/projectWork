package com.com.com.approval;

import java.util.Date;

public class HistoryDto {
	
	private int hNum;
	private String signedCondition;
	private Date signedDate;
	private String signedId;
	private int bNum;
	private MemberDto member;
	
	
	public int gethNum() {
		return hNum;
	}
	public void sethNum(int hNum) {
		this.hNum = hNum;
	}
	public String getSignedCondition() {
		return signedCondition;
	}
	public void setSignedCondition(String signedCondition) {
		this.signedCondition = signedCondition;
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
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public MemberDto getMember() {
		return member;
	}
	public void setMember(MemberDto member) {
		this.member = member;
	}
	
	
	
}
