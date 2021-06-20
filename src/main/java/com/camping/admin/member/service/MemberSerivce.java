package com.camping.admin.member.service;

import com.camping.admin.member.repository.MemberVO;

public interface MemberSerivce {
	void insertMember(MemberVO vo);
	
	void updateMember(MemberVO vo);
	
	void deleteMember(MemberVO vo);
}
