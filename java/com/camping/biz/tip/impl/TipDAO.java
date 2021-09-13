package com.camping.biz.tip.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.biz.pagination.Pagination;
import com.camping.biz.tip.TipVO;

@Repository
public class TipDAO extends SqlSessionDaoSupport{
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public void insertTip(TipVO vo) {
		getSqlSession().insert("TipDAO.insertTip", vo);
	}
	
	public void updateTip(TipVO vo) {
		getSqlSession().update("TipDAO.updateTip", vo);
	}
	
	public void deleteTip(TipVO vo) {
		getSqlSession().delete("TipDAO.deleteTip", vo);
	}
	
	public void tipHit(TipVO vo) {
		getSqlSession().update("TipDAO.tipHit", vo);
	}
	
	public TipVO getTip(TipVO vo) {
		return getSqlSession().selectOne("TipDAO.getTip", vo);
	}
	
	public List<TipVO> getTipMain(TipVO vo) {
		return getSqlSession().selectList("TipDAO.getTipMain", vo);
	}
	
	public List<TipVO> tipList(Pagination pagination) throws Exception{
		return getSqlSession().selectList("TipDAO.tipList", pagination);
	}
	
	public List<TipVO> searchTipList(Pagination pagination) throws Exception{
		return getSqlSession().selectList("TipDAO.searchTipList", pagination);
	}
	
	public int countTip() throws Exception {
		return getSqlSession().selectOne("TipDAO.countTip");
	}
	
	public int countSearchTip(String searchWrd) throws Exception {
		return getSqlSession().selectOne("TipDAO.countSearchTip", searchWrd);
	}
}
