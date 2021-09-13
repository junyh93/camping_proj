package com.camping.biz.recommend.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.biz.recommend.RecommendVO;

@Repository
public class RecommendDAO extends SqlSessionDaoSupport{
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	//추천
	public void updateRecommend(RecommendVO vo) {
		getSqlSession().insert("RecommendDAO.insertRecommend", vo);
	}
	
	public void deleteRecommend(RecommendVO vo) {
		getSqlSession().delete("RecommendDAO.deleteRecommend", vo);
	}
	
	public int recChk(RecommendVO vo) {
		return getSqlSession().selectOne("RecommendDAO.recChk", vo);
		 
	}
	
	public int recCount(RecommendVO vo) {
		return getSqlSession().selectOne("RecommendDAO.recCount", vo);
	}
	
	
	//좋아요
	public void updateLike(RecommendVO vo){
		getSqlSession().insert("RecommendDAO.insertLike", vo);
	}
	
	public void deleteLike(RecommendVO vo) {
		getSqlSession().delete("RecommendDAO.deleteLike",vo);
	}
	
	public int likChk(RecommendVO vo) {
		return getSqlSession().selectOne("RecommendDAO.likChk",vo);
	}
	
	public int likCount(RecommendVO vo) {
		return getSqlSession().selectOne("RecommendDAO.likCount",vo);
	}
	
	
	//싫어요
	public void updateHate(RecommendVO vo){
		getSqlSession().insert("RecommendDAO.insertHate", vo);
	}
	
	public void deleteHate(RecommendVO vo) {
		getSqlSession().delete("RecommendDAO.deleteHate",vo);
	}
	
	public int hatChk(RecommendVO vo) {
		return getSqlSession().selectOne("RecommendDAO.hatChk",vo);
	}
	
	public int hatCount(RecommendVO vo) {
		return getSqlSession().selectOne("RecommendDAO.hatCount",vo);
	}
}
