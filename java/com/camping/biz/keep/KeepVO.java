package com.camping.biz.keep;

public class KeepVO {
	private int kpNo;
	private int memNo;
	private int contentId;
	private String facltNm;
	private String addr;
	private String book;
	private String homepage;
	private String imgUrl;
	private String tel;
	
	public int getKpNo() {
		return kpNo;
	}
	public void setKpNo(int kpNo) {
		this.kpNo = kpNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getContentId() {
		return contentId;
	}
	public void setContentId(int contentId) {
		this.contentId = contentId;
	}
	public String getFacltNm() {
		return facltNm;
	}
	public void setFacltNm(String facltNm) {
		this.facltNm = facltNm;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getBook() {
		return book;
	}
	public void setBook(String book) {
		this.book = book;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	@Override
	public String toString() {
		return "KeepVO [kpNo=" + kpNo + ", memNo=" + memNo + ", contentId=" + contentId + ", facltNm=" + facltNm
				+ ", addr=" + addr + ", book=" + book + ", homepage=" + homepage + ", imgUrl=" + imgUrl + ", tel=" + tel
				+ "]";
	}
}
