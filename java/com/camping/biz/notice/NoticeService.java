package com.camping.biz.notice;

import java.util.List;

import com.camping.biz.pagination.Pagination;

public interface NoticeService {
	void insertNotice(NoticeVO vo);
	
	void updateNotice(NoticeVO vo);
	
	void deleteNotice(NoticeVO vo);
	
	NoticeVO getNotice(NoticeVO vo);
	
	List<NoticeVO> getNoticeList(Pagination pagination) throws Exception;
	
	List<NoticeVO> getNoticeMain(NoticeVO vo);
	
	List<NoticeVO> searchList(Pagination pagination) throws Exception;
	
	int countNotice() throws Exception;
	
	int countSearchNotice(String searchWrd) throws Exception;
}
