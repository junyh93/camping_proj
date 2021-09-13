package com.camping.biz.notice.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.biz.notice.NoticeVO;
import com.camping.biz.pagination.Pagination;

@Repository
public class NoticeDAO extends SqlSessionDaoSupport{
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public void insertNotice(NoticeVO vo) {
		getSqlSession().insert("NoticeDAO.insertNotice",vo);
	}
	
	public void updateNotice(NoticeVO vo) {
		getSqlSession().update("NoticeDAO.updateNotice", vo);
	}
	
	public void deleteNotice(NoticeVO vo) {
		getSqlSession().delete("NoticeDAO.deleteNotice", vo);
	}
	
	public NoticeVO getNotice(NoticeVO vo) {
		return getSqlSession().selectOne("NoticeDAO.getNotice", vo);
	}
	
	public void noticeHit(NoticeVO vo) {
		getSqlSession().update("NoticeDAO.noticeHit", vo);
	}
	
	public List<NoticeVO> getNoticeList(Pagination pagination) throws Exception{
		return getSqlSession().selectList("NoticeDAO.getNoticeList",pagination);
	}
	
	public List<NoticeVO> getNoticeMain(NoticeVO vo){
		return getSqlSession().selectList("NoticeDAO.getNoticeMain", vo);
	}
	
	public List<NoticeVO> getSearchList(Pagination pagination) throws Exception{
		return getSqlSession().selectList("NoticeDAO.getSearchList",pagination);
	}
	
	public int countNotice() throws Exception{
		return getSqlSession().selectOne("NoticeDAO.countNotice");
	}
	
	public int countSearchNotice(String searchWrd) throws Exception{
		return getSqlSession().selectOne("NoticeDAO.countSearchNotice", searchWrd);
	}
}
