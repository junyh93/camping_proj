package com.camping.biz.tip.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.camping.biz.pagination.Pagination;
import com.camping.biz.tip.TipService;
import com.camping.biz.tip.TipVO;

@Service
public class TipServiceImpl implements TipService {

	@Autowired
	TipDAO tipDAO;
	
	@Override
	public void insertTip(TipVO vo) {
		tipDAO.insertTip(vo);
	}

	@Override
	public void updateTip(TipVO vo) {
		tipDAO.updateTip(vo);

	}

	@Override
	public void deleteTip(TipVO vo) {
		tipDAO.deleteTip(vo);

	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public TipVO getTip(TipVO vo) {
		tipDAO.tipHit(vo);
		return tipDAO.getTip(vo);
	}
	
	@Override
	public List<TipVO> getTipMain(TipVO vo) {
		return tipDAO.getTipMain(vo);
	}

	@Override
	public List<TipVO> tipList(Pagination pagination) throws Exception {
		return tipDAO.tipList(pagination);
	}

	@Override
	public List<TipVO> searchTipList(Pagination pagination) throws Exception {
		return tipDAO.searchTipList(pagination);
	}

	@Override
	public int countTip() throws Exception {
		return tipDAO.countTip();
	}

	@Override
	public int countSearchTip(String searchWrd) throws Exception {
		return tipDAO.countSearchTip(searchWrd);
	}

}
