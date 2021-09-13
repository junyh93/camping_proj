package com.camping.biz.qna.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.biz.admin.AdminVO;
import com.camping.biz.qna.QnaVO;

@Repository
public class QnaDAO extends SqlSessionDaoSupport{
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public void insertQna(QnaVO vo) {
		getSqlSession().insert("QnaDAO.insertQna", vo);
	}
	
	public void updateQna(QnaVO vo) {
		getSqlSession().update("QnaDAO.updateQna", vo);
	}
	
	public void deleteQna(QnaVO vo) {
		getSqlSession().insert("QnaDAO.deleteQna", vo);
	}
	
	public QnaVO getQna(QnaVO vo) {
		return getSqlSession().selectOne("QnaDAO.getQna", vo);
	}
	
	public List<QnaVO> getQnaList(QnaVO vo){
		return getSqlSession().selectList("QnaDAO.getQnaList", vo);
	}
}
