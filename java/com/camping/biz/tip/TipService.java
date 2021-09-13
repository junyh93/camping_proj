package com.camping.biz.tip;

import java.util.List;

import com.camping.biz.pagination.Pagination;

public interface TipService {
	void insertTip(TipVO vo);
	
	void updateTip(TipVO vo);
	
	void deleteTip(TipVO vo);
	
	TipVO getTip(TipVO vo);
	
	List<TipVO> getTipMain(TipVO vo);
	
	List<TipVO> tipList(Pagination pagination) throws Exception;
	
	List<TipVO> searchTipList(Pagination pagination) throws Exception;
	
	int countTip()throws Exception;
	
	int countSearchTip(String searchWrd) throws Exception;
}
