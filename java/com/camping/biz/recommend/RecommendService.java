package com.camping.biz.recommend;

public interface RecommendService {
	//추천
	public void updateRecommend(RecommendVO vo);
	
	public void deleteRecommend(RecommendVO vo);
	
	public int recChk(RecommendVO vo);
	
	public int recCount(RecommendVO vo);
	
	//좋아요
	public void updateLike(RecommendVO vo);
	
	public void deleteLike(RecommendVO vo);
	
	public int likChk(RecommendVO vo);
	
	public int likCount(RecommendVO vo);
	
	//싫어요
	public void updateHate(RecommendVO vo);
	
	public void deleteHate(RecommendVO vo);
	
	public int hatChk(RecommendVO vo);
	
	public int hatCount(RecommendVO vo);
}
