package com.camping.biz.review.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.biz.pagination.Pagination;
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
	
	public int countReview() throws Exception{
		return getSqlSession().selectOne("ReviewDAO.countReview");
	}
	
	public ReviewVO getReivew(ReviewVO vo) {
		return getSqlSession().selectOne("ReviewDAO.getReview", vo);
	}
	
	public void reviewHit(ReviewVO vo) {
		getSqlSession().update("ReviewDAO.reviewHit", vo);
	}
	public List<ReviewVO> getReviewList(Pagination pagination) throws Exception{
		return getSqlSession().selectList("ReviewDAO.getReviewList", pagination);
	}

	public List<ReviewVO> getReviewMain(ReviewVO vo){
		return getSqlSession().selectList("ReviewDAO.getReviewMain", vo);
	}
	
	public List<ReviewVO> myReview(ReviewVO vo){
		return getSqlSession().selectList("ReviewDAO.myReview", vo);
	}
	
	public List<ReviewVO> camReview(ReviewVO vo){
		return getSqlSession().selectList("ReviewDAO.camReview", vo);
	}
}
