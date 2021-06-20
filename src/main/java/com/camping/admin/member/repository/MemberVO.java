package com.camping.admin.member.repository;

public class MemberVO {
	private int seq;
	private String id;
	private String pswd1;
	private String pswd2;
	private String name;
	private String email;
	private String mobile;
	
	private String searchCondition;
	private String searchKeyword;
	
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPswd1() {
		return pswd1;
	}
	public void setPswd1(String pswd1) {
		this.pswd1 = pswd1;
	}
	public String getPswd2() {
		return pswd2;
	}
	public void setPswd2(String pswd2) {
		this.pswd2 = pswd2;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
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
		return "MemberrVO[seq="+seq+", id="+id+", pswd1="+pswd1+", name="+name+", email="+email+", mobile=" +mobile+"]";
	}
}
