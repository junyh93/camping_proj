package com.camping.biz.member;

public class MemberVO {
	private int memNo;
	private String memId;
	private String memPw;
	private String pswd2;
	private String memName;
	private String memEmail;
	private String memPhone;
	private int memType;
	
	private String searchCondition;
	private String searchKeyword;
	
	
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
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getPswd2() {
		return pswd2;
	}
	public void setPswd2(String pswd2) {
		this.pswd2 = pswd2;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public int getMemType() {
		return memType;
	}
	public void setMemType(int memType) {
		this.memType = memType;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	@Override
	public String toString() {
		return "MemberVO [memNo=" + memNo + ", memId=" + memId + ", memPw=" + memPw + ", pswd2=" + pswd2 + ", memName="
				+ memName + ", memEmail=" + memEmail + ", memPhone=" + memPhone + ", memType=" + memType
				+ ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + "]";
	}


}
