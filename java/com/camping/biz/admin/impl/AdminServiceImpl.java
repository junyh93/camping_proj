package com.camping.biz.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.biz.admin.AdminService;
import com.camping.biz.admin.AdminVO;
import com.camping.biz.admin.Criteria;
import com.camping.biz.comment.CommentVO;
import com.camping.biz.member.MemberVO;
import com.camping.biz.pagination.Pagination;
import com.camping.biz.qna.QnaVO;


@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public void replayQna(AdminVO ad) {
		adminDAO.replayQna(ad);
	}
	
	@Override
	public void deleteReplay(AdminVO ad) {
		adminDAO.deleteReplay(ad);
		
	}
	
	@Override
	public void deleteMem(MemberVO vo) {
		adminDAO.deleteMem(vo);
	}
	
	@Override
	public void deleteCom(CommentVO vo) {
		adminDAO.deleteCom(vo);
	}

	@Override
	public boolean getLogin(AdminVO ad) {
		boolean admin = adminDAO.getLogin(ad);
		return admin;
	}
	
	@Override
	public AdminVO getReplay(AdminVO ad) {
		AdminVO admin = adminDAO.getReplay(ad);
		return admin;
	}
	
	@Override
	public MemberVO getMem(MemberVO vo) {
		MemberVO mem = adminDAO.getMem(vo);
		return mem;
	}
	
	@Override
	public CommentVO getCom(CommentVO vo) {
		CommentVO com = adminDAO.getCom(vo);
		return com;
	}
	
	@Override
	public AdminVO getAdmin(AdminVO ad) {
		AdminVO admin = adminDAO.getAdmin(ad);
		return admin;
	}

	@Override
	public List<QnaVO> getQna(QnaVO vo) {
		List<QnaVO> qna = adminDAO.getQna(vo);
		return qna;
	}
	
	@Override
	public List<QnaVO> searchQna(QnaVO vo) {
		List<QnaVO> qna = adminDAO.searchQna(vo);
		return qna;
	}

	@Override
	public List<MemberVO> adminMem(Pagination pagination) throws Exception{
		List<MemberVO> mem = adminDAO.adminMem(pagination);
		return mem;
	}
	
	@Override
	public List<MemberVO> searchMem(Pagination pagination) throws Exception{
		return adminDAO.searchMem(pagination);
	}
	
	@Override
	public List<CommentVO> adminCom(Pagination pagination) throws Exception {
		List<CommentVO> com = adminDAO.adminCom(pagination);
		return com;
	}

	@Override
	public List<CommentVO> searchCom(Pagination pagination) throws Exception {
		return adminDAO.searchCom(pagination);
	}

	@Override
	public List<QnaVO> getQnaList(Pagination pagination) throws Exception  {
		return adminDAO.getQnaList(pagination);
	}

	@Override
	public int countQna() throws Exception  {
		return adminDAO.countQna();
	}

	@Override
	public QnaVO getAdminQna(QnaVO vo) {
		return adminDAO.getAdminQna(vo);
	}

	@Override
	public int countMem() throws Exception {
		return adminDAO.countMem();
	}

	@Override
	public int countCom() throws Exception {
		return adminDAO.countCom();
	}

	@Override
	public int countSearchQna() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int countSearchMem(String searchWrd) throws Exception {
		return adminDAO.countSearchMem(searchWrd);
	}

	@Override
	public int countSearchCom(String searchWrd) throws Exception {
		return adminDAO.countSearchCom(searchWrd);
	}
	
	
}
