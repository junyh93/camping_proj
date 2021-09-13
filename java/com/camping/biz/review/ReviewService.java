package com.camping.biz.review;

import java.util.List;

import com.camping.biz.pagination.Pagination;

public interface ReviewService {
	void insertReview(ReviewVO vo);
	
	void updateReview(ReviewVO vo);
	
	void deleteReview(ReviewVO vo);
	
	int countReview() throws Exception;
	
	ReviewVO getReview(ReviewVO vo);
	
	List<ReviewVO> getReviewList(Pagination pagination) throws Exception;
	
	List<ReviewVO> getReviewMain(ReviewVO vo);
	
	List<ReviewVO> myReview(ReviewVO vo);
	
	List<ReviewVO> camReview(ReviewVO vo);
}
