package com.camping.biz.admin;

import java.sql.Date;

public class AdminVO {
	private int adNo;
	private String adId;
	private String adPw;
	private String adName;
	private String getId;
	private String getPw;
	
	private int rpNo;
	private String rpContent;
	private int qnaNo;
	private Date rpDate;
	
	private String condition;
	
	public int getAdNo() {
		return adNo;
	}
	public void setAdNo(int adNo) {
		this.adNo = adNo;
	}
	public String getAdId() {
		return adId;
	}
	public void setAdId(String adId) {
		this.adId = adId;
	}
	public String getAdPw() {
		return adPw;
	}
	public void setAdPw(String adPw) {
		this.adPw = adPw;
	}
	public String getAdName() {
		return adName;
	}
	public void setAdName(String adName) {
		this.adName = adName;
	}
	public String getGetId() {
		return getId;
	}
	public void setGetId(String getId) {
		this.getId = getId;
	}
	public String getGetPw() {
		return getPw;
	}
	public void setGetPw(String getPw) {
		this.getPw = getPw;
	}
	public int getRpNo() {
		return rpNo;
	}
	public void setRpNo(int rpNo) {
		this.rpNo = rpNo;
	}
	public String getRpContent() {
		return rpContent;
	}
	public void setRpContent(String rpContent) {
		this.rpContent = rpContent;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public Date getRpDate() {
		return rpDate;
	}
	public void setRpDate(Date rpDate) {
		this.rpDate = rpDate;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	@Override
	public String toString() {
		return "AdminVO [adNo=" + adNo + ", adId=" + adId + ", adPw=" + adPw + ", adName=" + adName + ", getId=" + getId
				+ ", getPw=" + getPw + ", rpNo=" + rpNo + ", rpContent=" + rpContent + ", qnaNo=" + qnaNo + ", rpDate="
				+ rpDate + ", condition=" + condition + "]";
	}
}
