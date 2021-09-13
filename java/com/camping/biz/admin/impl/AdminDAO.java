package com.camping.biz.admin.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.biz.admin.AdminVO;
import com.camping.biz.admin.Criteria;
import com.camping.biz.comment.CommentVO;
import com.camping.biz.member.MemberVO;
import com.camping.biz.pagination.Pagination;
import com.camping.biz.qna.QnaVO;


@Repository
public class AdminDAO extends SqlSessionDaoSupport{
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public void replayQna(AdminVO ad) {
		getSqlSession().insert("AdminDAO.replayQna", ad);
		getSqlSession().update("AdminDAO.updateReplay", ad);
	}
	
	public void deleteReplay(AdminVO ad) {
		getSqlSession().delete("AdminDAO.deleteReplay", ad);
		getSqlSession().update("AdminDAO.updateReplayDelete", ad);
	}
	
	public void deleteMem(MemberVO vo) {
		getSqlSession().delete("AdminDAO.deleteMem", vo);
	}
	
	public void deleteCom(CommentVO vo) {
		getSqlSession().delete("AdminDAO.deleteCom", vo);
	}
	
	public boolean getLogin(AdminVO ad) {
		AdminVO result =  getSqlSession().selectOne("AdminDAO.getLogin",ad);
		 return(result == null) ? false : true;
	}
	
	public AdminVO getReplay(AdminVO ad) {
		return getSqlSession().selectOne("AdminDAO.getReplay", ad);
	}
	
	public AdminVO getAdmin(AdminVO ad) {
		return getSqlSession().selectOne("AdminDAO.getLogin", ad);
	}
	
	public MemberVO getMem(MemberVO vo) {
		return getSqlSession().selectOne("AdminDAO.getMem", vo);
	}
	
	public CommentVO getCom(CommentVO vo){
		return getSqlSession().selectOne("AdminDAO.getCom",vo);
	}
	
	public List<QnaVO> getQna(QnaVO vo){
		return getSqlSession().selectList("AdminDAO.getQna", vo);
	}
	
	public List<QnaVO> searchQna(QnaVO vo){
		return getSqlSession().selectList("AdminDAO.searchQna", vo);
	}
	
	public List<MemberVO> adminMem(Pagination pagination) throws Exception{
		return getSqlSession().selectList("AdminDAO.adminMem",pagination);
	}
	
	public List<MemberVO> searchMem(Pagination pagination) throws Exception{
		return getSqlSession().selectList("AdminDAO.searchMem", pagination);
	}
	
	public List<CommentVO> adminCom(Pagination pagination) throws Exception{
		return getSqlSession().selectList("AdminDAO.adminCom",pagination);
	}
	
	public List<CommentVO> searchCom(Pagination pagination) throws Exception{
		return getSqlSession().selectList("AdminDAO.searchCom", pagination);
	}
	
	public List<QnaVO> getQnaList(Pagination pagination) throws Exception {
		return getSqlSession().selectList("AdminDAO.getQnaList",pagination);
	}
	
	public int countQna() throws Exception  {
		return getSqlSession().selectOne("AdminDAO.countQna");
	}
	
	public QnaVO getAdminQna(QnaVO vo) {
		return getSqlSession().selectOne("AdminDAO.getAdminQna", vo);
	}
	
	public int countMem() throws Exception{
		return getSqlSession().selectOne("AdminDAO.countMem");
	}
	
	public int countCom() throws Exception{
		return getSqlSession().selectOne("AdminDAO.countCom");
	}
	
	public int countSearchMem(String searchWrd) throws Exception{
		return getSqlSession().selectOne("AdminDAO.countSearchMem",searchWrd);
	}
	
	public int countSearchCom(String searchWrd) throws Exception{
		return getSqlSession().selectOne("AdminDAO.countSearchCom",searchWrd);
	}
}
