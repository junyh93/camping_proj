package com.camping.biz.notice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.camping.biz.notice.NoticeService;
import com.camping.biz.notice.NoticeVO;
import com.camping.biz.pagination.Pagination;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDAO noticeDAO;
	
	@Override
	public void insertNotice(NoticeVO vo) {
		noticeDAO.insertNotice(vo);
	}

	@Override
	public void updateNotice(NoticeVO vo) {
		noticeDAO.updateNotice(vo);
	}

	@Override
	public void deleteNotice(NoticeVO vo) {
		noticeDAO.deleteNotice(vo);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public NoticeVO getNotice(NoticeVO vo) {
		noticeDAO.noticeHit(vo);
		NoticeVO notice = noticeDAO.getNotice(vo);
		return notice;
	}

	@Override
	public List<NoticeVO> getNoticeList(Pagination pagination) throws Exception{
		return noticeDAO.getNoticeList(pagination);
	}
	
	@Override
	public List<NoticeVO> getNoticeMain(NoticeVO vo) {
		return noticeDAO.getNoticeMain(vo);
	}

	@Override
	public List<NoticeVO> searchList(Pagination pagination) throws Exception{
		return noticeDAO.getSearchList(pagination);
	}

	@Override
	public int countNotice() throws Exception {
		return noticeDAO.countNotice();
	}

	@Override
	public int countSearchNotice(String searchWrd) throws Exception {
		return noticeDAO.countSearchNotice(searchWrd);
	}
}
