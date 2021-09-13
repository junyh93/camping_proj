package com.camping.biz.comment;

import java.util.List;

public interface CommentService {
	void insertComment(CommentVO vo);
	
	void deleteComment(CommentVO vo);
	
	List<CommentVO> commentList(CommentVO vo);
	
	

}
