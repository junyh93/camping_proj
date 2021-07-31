package com.camping.biz.review.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.biz.member.MemberVO;
import com.camping.biz.review.ReviewVO;


@Repository
public class ReviewDAO extends SqlSessionDaoSupport{
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	public void insertReview(ReviewVO vo) {
		getSqlSession().insert("ReviewDAO.insertReview", vo);
	}
	
	public void updateReview(ReviewVO vo) {
		getSqlSession().update("ReviewDAO.updateReview", vo);
	}
	
	public void deleteReview(ReviewVO vo) {
		getSqlSession().delete("ReviewDAO.deleteReview", vo);
	}
	
	public ReviewVO getReivew(ReviewVO vo) {
		return getSqlSession().selectOne("ReviewDAO.getReview", vo);
	}
	
	public List<ReviewVO> getReviewList(ReviewVO vo){
		return getSqlSession().selectList("ReviewDAO.getReviewList", vo);
	}
}
