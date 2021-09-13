package com.camping.biz.qna;

import java.sql.Date;

public class QnaVO {
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private int memNo;
	private String memId;
	private int adNo;
	private String condition;
	
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
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
	public int getAdNo() {
		return adNo;
	}
	public void setAdNo(int adNo) {
		this.adNo = adNo;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	@Override
	public String toString() {
		return "QnaVO [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaDate="
				+ qnaDate + ", memNo=" + memNo + ", memId=" + memId + ", adNo=" + adNo + ", condition=" + condition
				+ "]";
	}
}
