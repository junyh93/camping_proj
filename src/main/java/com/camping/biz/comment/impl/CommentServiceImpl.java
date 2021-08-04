package com.camping.biz.comment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.biz.comment.CommentService;
import com.camping.biz.comment.CommentVO;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDAO commentDAO;
	
	@Override
	public void insertComment(CommentVO vo) {
		commentDAO.insertComment(vo);
	}

	
	@Override
	public void deleteComment(CommentVO vo) {
		commentDAO.deleteComment(vo);
		
	}

	@Override
	public List<CommentVO> commentList(CommentVO vo) {
		List<CommentVO> comment = commentDAO.commentList(vo);
		return comment;
	}
	

}
