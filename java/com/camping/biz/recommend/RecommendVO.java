package com.camping.biz.recommend;

public class RecommendVO {
	//추천
	private int recNo;
	private int memNo;
	private int tipNo;
	private int contentId;
	//좋아요
	private int gdNo;
	private String id;
	//싫어요
	private int hatNo;
	
	public int getRecNo() {
		return recNo;
	}
	public void setRecNo(int recNo) {
		this.recNo = recNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getTipNo() {
		return tipNo;
	}
	public void setTipNo(int tipNo) {
		this.tipNo = tipNo;
	}
	public int getContentId() {
		return contentId;
	}
	public void setContentId(int contentId) {
		this.contentId = contentId;
	}
	public int getGdNo() {
		return gdNo;
	}
	public void setGdNo(int gdNo) {
		this.gdNo = gdNo;
	}
	public int getHatNo() {
		return hatNo;
	}
	public void setHatNo(int hatNo) {
		this.hatNo = hatNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "RecommendVO [recNo=" + recNo + ", memNo=" + memNo + ", tipNo=" + tipNo + ", contentId=" + contentId
				+ ", gdNo=" + gdNo + ", id=" + id + ", hatNo=" + hatNo + "]";
	}
}
