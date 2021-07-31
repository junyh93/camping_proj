package com.camping.biz.member;

import javax.servlet.http.HttpServletResponse;

public interface MemberSerivce {
	void insertMember(MemberVO vo);
	
	void updateMember(MemberVO vo);
	
	void updatePw(MemberVO vo);
	
	void deleteMember(MemberVO vo);
	
	boolean getLogin(MemberVO vo);
	
	MemberVO getMember(MemberVO vo);
	
	int idChk(MemberVO vo);
	
	void sendEmail(MemberVO vo, String div) throws Exception;
	
	MemberVO findId(MemberVO vo) throws Exception;
	
	int findPw(MemberVO vo) throws Exception;
}
