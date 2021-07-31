package com.camping.biz.review;





import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {
	private int rvNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date rvDate;
	private String rvTitle;
	private String rvContent;
	private String rvImg;
	private MultipartFile rvFolder;
	private MultipartFile rvFolder1;
	private MultipartFile rvFolder2;
	private MultipartFile rvFolder3;
	private MultipartFile rvFolder4;
	private int rvStar;
	
	private int contentId;
	private String addr;
	private String facltNm;
	private String lineIntro;
	private String tel;
	private String homePage;
	private String imgUrl;
	private double mapX;
	private double mapY;
	
	private int memNo;
	private String memId;
	
	
	public int getRvNo() {
		return rvNo;
	}
	public void setRvNo(int rvNo) {
		this.rvNo = rvNo;
	}
	public Date getRvDate() {
		return rvDate;
	}
	public void setRvDate(Date rvDate) {
		this.rvDate = rvDate;
	}
	public String getRvTitle() {
		return rvTitle;
	}
	public void setRvTitle(String rvTitle) {
		this.rvTitle = rvTitle;
	}
	public String getRvContent() {
		return rvContent;
	}
	public void setRvContent(String rvContent) {
		this.rvContent = rvContent;
	}
	public String getRvImg() {
		return rvImg;
	}
	public void setRvImg(String rvImg) {
		this.rvImg = rvImg;
	}
	public MultipartFile getRvFolder() {
		return rvFolder;
	}
	public void setRvFolder(MultipartFile rvFolder) {
		this.rvFolder = rvFolder;
	}
	public MultipartFile getRvFolder1() {
		return rvFolder1;
	}
	public void setRvFolder1(MultipartFile rvFolder1) {
		this.rvFolder1 = rvFolder1;
	}
	public MultipartFile getRvFolder2() {
		return rvFolder2;
	}
	public void setRvFolder2(MultipartFile rvFolder2) {
		this.rvFolder2 = rvFolder2;
	}
	public MultipartFile getRvFolder3() {
		return rvFolder3;
	}
	public void setRvFolder3(MultipartFile rvFolder3) {
		this.rvFolder3 = rvFolder3;
	}
	public MultipartFile getRvFolder4() {
		return rvFolder4;
	}
	public void setRvFolder4(MultipartFile rvFolder4) {
		this.rvFolder4 = rvFolder4;
	}
	public int getRvStar() {
		return rvStar;
	}
	public void setRvStar(int rvStar) {
		this.rvStar = rvStar;
	}
	public int getContentId() {
		return contentId;
	}
	public void setContentId(int contentId) {
		this.contentId = contentId;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getFacltNm() {
		return facltNm;
	}
	public void setFacltNm(String facltNm) {
		this.facltNm = facltNm;
	}
	public String getLineIntro() {
		return lineIntro;
	}
	public void setLineIntro(String lineIntro) {
		this.lineIntro = lineIntro;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHomePage() {
		return homePage;
	}
	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public double getMapX() {
		return mapX;
	}
	public void setMapX(double mapX) {
		this.mapX = mapX;
	}
	public double getMapY() {
		return mapY;
	}
	public void setMapY(double mapY) {
		this.mapY = mapY;
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
		return "ReviewVO [rvNo=" + rvNo + ", rvDate=" + rvDate + ", rvTitle=" + rvTitle + ", rvContent=" + rvContent
				+ ", rvImg=" + rvImg + ", rvFolder=" + rvFolder + ", rvStar=" + rvStar + ", contentId=" + contentId
				+ ", addr=" + addr + ", facltNm=" + facltNm + ", lineIntro=" + lineIntro + ", tel=" + tel
				+ ", homePage=" + homePage + ", imgUrl=" + imgUrl + ", mapX=" + mapX + ", mapY=" + mapY + ", memNo="
				+ memNo + ", memId=" + memId + "]";
	}
}
