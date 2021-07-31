package com.camping.biz.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public ReviewVO getReview(ReviewVO vo) {
		ReviewVO review = reviewDAO.getReivew(vo);
		return review;
	}

	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		List<ReviewVO> review = reviewDAO.getReviewList(vo);
		return review;
	}

}
