package com.camping.biz.admin.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.biz.admin.AdminVO;

@Repository
public class AdminDAO extends SqlSessionDaoSupport{
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public AdminVO getLogin(AdminVO ad) {
		return getSqlSession().selectOne("AdminDAO.getLogin",ad);
	}
}
