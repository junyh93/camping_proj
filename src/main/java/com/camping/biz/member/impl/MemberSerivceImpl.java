package com.camping.biz.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.biz.member.MemberSerivce;
import com.camping.biz.member.MemberVO;

@Service
public class MemberSerivceImpl implements MemberSerivce {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public void insertMember(MemberVO vo) {
		memberDAO.insertMember(vo);
		
	}

	@Override
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
		
	}

	@Override
	public void deleteMember(MemberVO vo) {
		memberDAO.deleteMember(vo);
		
	}

	@Override
	public boolean getLogin(MemberVO vo) {
		boolean result = memberDAO.getLogin(vo);

		return result;
	}

	

	@Override
	public MemberVO getMember(MemberVO vo) {
		MemberVO member = memberDAO.getMember(vo);
		return member;
	}

	@Override
	public int idChk(MemberVO vo) {
		int result = memberDAO.idchk(vo);
		return result;
	}
	
	
	
}
