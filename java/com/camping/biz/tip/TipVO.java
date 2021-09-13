package com.camping.biz.tip;

import java.sql.Date;

public class TipVO {
	private int tipNo;
	private String tipTitle;
	private String tipContent;
	private Date tipDate;
	private String tipLink;
	private int tipHit;
	private int memNo;
	private String memId;
	
	public int getTipNo() {
		return tipNo;
	}
	public void setTipNo(int tipNo) {
		this.tipNo = tipNo;
	}
	public String getTipTitle() {
		return tipTitle;
	}
	public void setTipTitle(String tipTitle) {
		this.tipTitle = tipTitle;
	}
	public String getTipContent() {
		return tipContent;
	}
	public void setTipContent(String tipContent) {
		this.tipContent = tipContent;
	}
	public Date getTipDate() {
		return tipDate;
	}
	public void setTipDate(Date tipDate) {
		this.tipDate = tipDate;
	}
	public String getTipLink() {
		return tipLink;
	}
	public void setTipLink(String tipLink) {
		this.tipLink = tipLink;
	}
	public int getTipHit() {
		return tipHit;
	}
	public void setTipHit(int tipHit) {
		this.tipHit = tipHit;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	@Override
	public String toString() {
		return "TipVO [tipNo=" + tipNo + ", tipTitle=" + tipTitle + ", tipContent=" + tipContent + ", tipDate="
				+ tipDate + ", tipLink=" + tipLink + ", tipHit=" + tipHit + ", memNo=" + memNo + ", memId=" + memId
				+ "]";
	}
	
}
