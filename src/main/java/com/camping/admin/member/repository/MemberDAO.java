package com.camping.admin.member.repository;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO extends SqlSessionDaoSupport{
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public void insertMember(MemberVO vo) {
		getSqlSession().insert("MemberDAOTemp.insertMember", vo);
	}
	
	public void updateMember(MemberVO vo) {
		getSqlSession().update("MemberDAOTemp.updateMember", vo);
	}
	
	public void deleteMember(MemberVO vo) {
		getSqlSession().delete("MemberDAOTemp.deleteMember", vo);
	}
	
}
