package com.camping.biz.qna.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.biz.admin.AdminVO;
import com.camping.biz.qna.QnaService;
import com.camping.biz.qna.QnaVO;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	QnaDAO qnaDAO;
	
	@Override
	public void insertQna(QnaVO vo) {
		qnaDAO.insertQna(vo);
	}
	
	@Override
	public void updateQna(QnaVO vo) {
		qnaDAO.updateQna(vo);
	}

	@Override
	public void deleteQna(QnaVO vo) {
		qnaDAO.deleteQna(vo);
	}

	@Override
	public QnaVO getQna(QnaVO vo) {
		QnaVO qna = qnaDAO.getQna(vo);
		return qna;
	}

	@Override
	public List<QnaVO> getQnaList(QnaVO vo) {
		List<QnaVO> qna = qnaDAO.getQnaList(vo);
		return qna;
	}

}
