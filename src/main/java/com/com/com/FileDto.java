package com.com.com;

import java.util.Date;

public class FileDto {
	
	public int fileSeq;
	public String realName;
	public String saveName;
	public Date regDate;
	public String savePath;
	public int listSeq;
	
	
	public int getFileSeq() {
		return fileSeq;
	}
	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	public Date getregDate() {
		return regDate;
	}
	public void setFileregDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public int getListSeq() {
		return listSeq;
	}
	public void setListSeq(int listSeq) {
		this.listSeq = listSeq;
	}
}
