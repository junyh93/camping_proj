package com.camping.biz.recommend.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.biz.recommend.RecommendService;
import com.camping.biz.recommend.RecommendVO;

@Service
public class RecommendServiceImpl implements RecommendService {

	@Autowired
	RecommendDAO recommendDAO;
	
	//추천
	@Override
	public void updateRecommend(RecommendVO vo) {
		recommendDAO.updateRecommend(vo);
	}

	@Override
	public void deleteRecommend(RecommendVO vo) {
		recommendDAO.deleteRecommend(vo);
		
	}

	@Override
	public int recChk(RecommendVO vo) {
		int result = recommendDAO.recChk(vo);
		return result;
	}

	@Override
	public int recCount(RecommendVO vo) {
		int count  = recommendDAO.recCount(vo);
		return count;
	}
	
	
	//좋아요
	@Override
	public void updateLike(RecommendVO vo) {
		recommendDAO.updateLike(vo);
		
	}

	@Override
	public void deleteLike(RecommendVO vo) {
		recommendDAO.deleteLike(vo);
		
	}

	@Override
	public int likChk(RecommendVO vo) {
		int result = recommendDAO.likChk(vo);
		return result;
	}

	@Override
	public int likCount(RecommendVO vo) {
		int count = recommendDAO.likCount(vo);
		System.out.println(count);
		return count;
	}


	
	//싫어요
	@Override
	public void updateHate(RecommendVO vo) {
		recommendDAO.updateHate(vo);
		
	}

	@Override
	public void deleteHate(RecommendVO vo) {
		recommendDAO.deleteHate(vo);
		
	}

	@Override
	public int hatChk(RecommendVO vo) {
		int result = recommendDAO.hatChk(vo);
		return result;
	}

	@Override
	public int hatCount(RecommendVO vo) {
		int count = recommendDAO.hatCount(vo);
		return count;
	}
	

}
