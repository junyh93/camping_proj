package com.camping.biz.admin;

public class AdminVO {
	private int adNo;
	private String adId;
	private String adPw;
	private String adName;
	
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
	
	@Override
	public String toString() {
		return "AdminVO [adNo=" + adNo + ", adId=" + adId + ", adPw=" + adPw + ", adName=" + adName + "]";
	}
	
	
}
