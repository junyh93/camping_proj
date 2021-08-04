package com.camping.biz.comment.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.biz.comment.CommentVO;

@Repository
public class CommentDAO extends SqlSessionDaoSupport{
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public void insertComment(CommentVO vo) {
		getSqlSession().insert("CommentDAO.insertComment", vo);
	}
	
	public void deleteComment(CommentVO vo) {
		getSqlSession().delete("CommentDAO.deleteComment", vo);
	}
	
	public List<CommentVO> commentList(CommentVO vo) {
		return getSqlSession().selectList("CommentDAO.commentList", vo);
	}
}
