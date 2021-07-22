package com.camping.biz.member;

public interface MemberSerivce {
	void insertMember(MemberVO vo);
	
	void updateMember(MemberVO vo);
	
	void deleteMember(MemberVO vo);
	
	boolean getLogin(MemberVO vo);
	
	MemberVO getMember(MemberVO vo);
	
	int idChk(MemberVO vo);
}
