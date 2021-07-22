package com.camping.biz.member.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.biz.member.MemberVO;

@Repository
public class MemberDAO extends SqlSessionDaoSupport{
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public void insertMember(MemberVO vo) {
		getSqlSession().insert("MemberDAO.insertMember", vo);
	}
	
	public void updateMember(MemberVO vo) {
		getSqlSession().update("MemberDAO.updateMember", vo);
	}
	
	public void deleteMember(MemberVO vo) {
		getSqlSession().delete("MemberDAO.deleteMember", vo);
	}
	
	public boolean getLogin (MemberVO vo) {
		MemberVO result = getSqlSession().selectOne("MemberDAO.getLogin", vo);
		return (result == null) ? false : true;
	}
	
	public int idchk(MemberVO vo) {
		return getSqlSession().selectOne("MemberDAO.idChk", vo);
	}
}
