package com.camping.biz.admin;

import java.util.List;
import java.util.Map;

import com.camping.biz.comment.CommentVO;
import com.camping.biz.member.MemberVO;
import com.camping.biz.pagination.Pagination;
import com.camping.biz.qna.QnaVO;

public interface AdminService {
	void replayQna(AdminVO ad);
	
	void deleteReplay(AdminVO ad);
	
	void deleteMem(MemberVO vo);
	
	void deleteCom(CommentVO vo);
	
	boolean getLogin(AdminVO ad);
	
	AdminVO getReplay(AdminVO ad);
	
	MemberVO getMem(MemberVO vo);
	
	CommentVO getCom(CommentVO vo);
	
	AdminVO getAdmin(AdminVO ad);
	
	QnaVO getAdminQna(QnaVO vo);
	
	List<QnaVO> getQna(QnaVO vo);
	
	List<QnaVO> searchQna(QnaVO vo);
	
	List<MemberVO> adminMem(Pagination pagination) throws Exception;
	
	List<MemberVO> searchMem(Pagination pagination) throws Exception;
	
	List<CommentVO> adminCom(Pagination pagination) throws Exception;

	List<CommentVO> searchCom(Pagination pagination) throws Exception;
	
	List<QnaVO> getQnaList(Pagination pagination) throws Exception ;
	
	int countQna() throws Exception;
	
	int countMem() throws Exception;
	
	int countCom() throws Exception;
	
	int countSearchQna() throws Exception;
	
	int countSearchMem(String searchWrd) throws Exception;
	
	int countSearchCom(String searchWrd) throws Exception;
	
}
