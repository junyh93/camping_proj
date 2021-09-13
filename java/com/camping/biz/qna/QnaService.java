package com.camping.biz.qna;

import java.util.List;

import com.camping.biz.admin.AdminVO;

public interface QnaService {
	public void insertQna(QnaVO vo);
	
	public void updateQna(QnaVO vo);
	
	public void deleteQna(QnaVO vo);
	
	public QnaVO getQna(QnaVO vo);
	
	public List<QnaVO> getQnaList(QnaVO vo);
}
