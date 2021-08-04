package com.camping.biz.comment;

import java.sql.Date;

public class CommentVO {
	private int comNo;
	private int rvNo;
	private String memId;
	private int memNo;
	private String comContent;
	private Date comDate;
	
	public int getComNo() {
		return comNo;
	}
	public void setComNo(int comNo) {
		this.comNo = comNo;
	}
	public int getRvNo() {
		return rvNo;
	}
	public void setRvNo(int rvNo) {
		this.rvNo = rvNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getComContent() {
		return comContent;
	}
	public void setComContent(String comContent) {
		this.comContent = comContent;
	}
	public Date getComDate() {
		return comDate;
	}
	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}
	
	@Override
	public String toString() {
		return "CommentVO [comNo=" + comNo + ", rvNo=" + rvNo + ", memId=" + memId + ", memNo=" + memNo
				+ ", comContent=" + comContent + ", comDate=" + comDate + "]";
	}
}
