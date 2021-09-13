package com.camping.biz.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.camping.biz.pagination.Pagination;
import com.camping.biz.review.ReviewService;
import com.camping.biz.review.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);

	}

	@Override
	public void updateReview(ReviewVO vo) {
		reviewDAO.updateReview(vo);

	}

	@Override
	public void deleteReview(ReviewVO vo) {
		reviewDAO.deleteReview(vo);

	}
	
	@Override
	public int countReview() throws Exception {
		return reviewDAO.countReview();
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public ReviewVO getReview(ReviewVO vo) {
		reviewDAO.reviewHit(vo);
		ReviewVO review = reviewDAO.getReivew(vo);
		return review;
	}

	@Override
	public List<ReviewVO> getReviewList(Pagination pagination) throws Exception{
		List<ReviewVO> review = reviewDAO.getReviewList(pagination);
		return review;
	}
	
	@Override
	public List<ReviewVO> getReviewMain(ReviewVO vo) {
		return reviewDAO.getReviewMain(vo);
	}

	@Override
	public List<ReviewVO> myReview(ReviewVO vo) {
		List<ReviewVO> review = reviewDAO.myReview(vo);
		return review;
	}

	@Override
	public List<ReviewVO> camReview(ReviewVO vo) {
		List<ReviewVO> review = reviewDAO.camReview(vo);
		return review;
	}
}
