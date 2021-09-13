package com.camping.view.admin;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camping.biz.admin.AdminService;
import com.camping.biz.admin.AdminVO;
import com.camping.biz.comment.CommentVO;
import com.camping.biz.member.MemberVO;
import com.camping.biz.notice.NoticeService;
import com.camping.biz.notice.NoticeVO;
import com.camping.biz.pagination.Pagination;
import com.camping.biz.qna.QnaService;
import com.camping.biz.qna.QnaVO;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	QnaService qnaService;
	
	@Autowired
	NoticeService noticeService;
	
	//1:1문의 페이징 목록
	@RequestMapping(value="/admin.do", method = RequestMethod.GET)
	public String qnaListPaging(Model model	, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		System.out.println("qnaListPaging...");
		
		//전체 게시글 개수
		int listCnt = adminService.countQna();

		//Pagination 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);
		model.addAttribute("qnaList", adminService.getQnaList(pagination));

		return "admin/adminpaging";
	}
	
	//1:1문의 상세보기
	@RequestMapping(value="/getAdminQna.do", method = RequestMethod.POST)
	public String getQna(QnaVO vo, AdminVO ad,@RequestParam("page") int page, @RequestParam("range") int range, @RequestParam("rangeSize") int rangeSize ,Model model) {
		System.out.println("1:1문의 상세보기중");
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("rangeSize", rangeSize);
		
		AdminVO admin = adminService.getReplay(ad);
		
		if(admin != null) {
			model.addAttribute("admin",admin);
			
			System.out.println(admin);
		}
		
		model.addAttribute("qna", adminService.getAdminQna(vo));

		return "admin/adminqna";
	}
	
	
	//글 검색 기능 - requestMapping 직전에 ModelAttribute를 호출
	@ModelAttribute("conditionMap")
	public Map<String, String> qnaConditionMap(){
		
		Map<String, String> conditionMap = new HashMap<String, String>();
		
		conditionMap.put("캠핑장 예약", "BOOK");
		conditionMap.put("캠핑장 후기", "REVIEW");
		conditionMap.put("불법 캠핑장", "UNLAW");
		conditionMap.put("기타 사항 ", "ETC");
		
		System.out.println(conditionMap);
		
		return conditionMap;
	}
	
	//문의사항 검색 기능
	@RequestMapping(value="/searchQna.do", method = RequestMethod.GET)
	public String searchQna(QnaVO vo, Model model) {
		System.out.println("문의사항 조건 검색 중");
		
		System.out.println(vo);
		
		List<QnaVO> qna = adminService.searchQna(vo);
		
		model.addAttribute("qna",qna);
		
		System.out.println("검색결과: "+qna);
		return "admin/searchqna";
	}

	//1:1문의 답변
	@ResponseBody
	@RequestMapping(value="/replayQna.do", method = RequestMethod.POST)
	public String replayQna(AdminVO ad,QnaVO vo,Model model) {
		System.out.println("1:1문의 답변중");
		
		System.out.println(ad);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		Date now = new java.sql.Date(System.currentTimeMillis());
		
		System.out.println(now);
		ad.setRpDate(now);
		
		adminService.replayQna(ad);
		
		return "success";
	}
	
	//1:1문의 답변 삭제
	@ResponseBody
	@RequestMapping(value="/deleteReplay.do", method = RequestMethod.POST)
	public String deleteReplay(AdminVO ad) {
		System.out.println("1:1문의 답변 삭제중");
		System.out.println(ad);
		adminService.deleteReplay(ad);
		
		return "success";
	}
	
	//회원목록
	@RequestMapping(value="/getMem.do", method = RequestMethod.GET)
	public String adminMem(MemberVO vo,Model model, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) throws Exception{
		System.out.println("회원목록 불러오는중");

		//전체 게시글 개수

		int listCnt = adminService.countMem();

		//Pagination 객체생성

		Pagination pagination = new Pagination();

		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);

		model.addAttribute("member", adminService.adminMem(pagination));
		
		
		return "admin/adminmem";
	}
	
	//회원 상세보기
	@RequestMapping(value="/getMem.do", method = RequestMethod.POST)
	public String getMem(MemberVO vo,Model model,@RequestParam("page") int page, @RequestParam("range") int range, @RequestParam("rangeSize") int rangeSize) {
		System.out.println("회원 상세보기 중");
		
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("rangeSize", rangeSize);
		
		model.addAttribute("member", adminService.getMem(vo));
		
		return "admin/getmem";
	}
	
	//글 검색 기능 - requestMapping 직전에 ModelAttribute를 호출
	@ModelAttribute("memMap")
	public Map<String, String> memConditionMap(){
		
		Map<String, String> memMap = new HashMap<String, String>();
		
		memMap.put("회원 아이디+이름", "ALL");

		System.out.println(memMap);
		
		return memMap;
	}
	
	//회원검색
	@RequestMapping(value="/searchMem.do", method= RequestMethod.POST)
	public String searchMem(MemberVO vo, Model model,@RequestParam("searchWrd") String searchWrd,@RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) throws Exception{
		System.out.println("회원 검색 중");
		
		//전체 게시글 개수
		int listCnt = adminService.countSearchMem(searchWrd);

		//Pagination 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		pagination.setSearchWrd(searchWrd);
		
		model.addAttribute("pagination", pagination);
	
		model.addAttribute("member",adminService.searchMem(pagination));
		
		
		return "admin/adminmem";
	}
	
	//회원 탈퇴
	@ResponseBody
	@RequestMapping(value="/deleteMem.do", method = RequestMethod.POST)
	public String deleteMem(MemberVO vo, Model model) {
		System.out.println("회원 삭제 중");
		
		adminService.deleteMem(vo);
		
		return "success";
	}
	
	//댓글 목록
	@RequestMapping(value="/getCom.do", method = RequestMethod.GET)
	public String adminCom(CommentVO vo, Model model, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		System.out.println("댓글 목록 불러오는 중");
		
		//전체 게시글 개수

		int listCnt = adminService.countCom();

		//Pagination 객체생성

		Pagination pagination = new Pagination();

		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);

		model.addAttribute("comment", adminService.adminCom(pagination));
		
		return "admin/admincom";
	}
	
	//댓글 상세보기
	@RequestMapping(value="/getCom.do", method = RequestMethod.POST)
	public String getCom(CommentVO vo, Model model,@RequestParam("page") int page, @RequestParam("range") int range, @RequestParam("rangeSize") int rangeSize) {
		System.out.println("댓글 상세보기 중");
		
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("rangeSize", rangeSize);
		
		model.addAttribute("comment", adminService.getCom(vo));
		
		return "admin/getcom";
	}
	
	//글 검색 기능 - requestMapping 직전에 ModelAttribute를 호출
	@ModelAttribute("comMap")
	public Map<String, String> comConditionMap(){
		
		Map<String, String> comMap = new HashMap<String, String>();
		
		comMap.put("회원 아이디", "ALL");

		System.out.println(comMap);
		
		return comMap;
	}
	
	//댓글 검색
	@RequestMapping(value="/searchCom.do", method= RequestMethod.POST)
	public String searchCom(CommentVO vo, Model model,@RequestParam("searchWrd") String searchWrd,@RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) throws Exception{
		System.out.println("댓글 검색 중");
		
		//전체 게시글 개수
		int listCnt = adminService.countSearchCom(searchWrd);

		//Pagination 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		pagination.setSearchWrd(searchWrd);
		
		model.addAttribute("pagination", pagination);
	
		model.addAttribute("comment",adminService.searchCom(pagination));
		
		
		return "admin/admincom";
	}
	
	//댓글 삭제
	@ResponseBody
	@RequestMapping(value="/deleteCom.do", method = RequestMethod.POST)
	public String deleteCom(CommentVO vo) {
		System.out.println("댓글 삭제 중");
		
		adminService.deleteCom(vo);
		
		
		return "success";
	}
	
	//공지사항 메인
	@RequestMapping(value="/noticeMain.do", method = RequestMethod.GET)
	public String noticeMain(NoticeVO vo,Model model) {
		List<NoticeVO> notice = noticeService.getNoticeMain(vo);
		
		model.addAttribute("notice",notice);
		
		System.out.println("main공지사항 호출중 " + notice);
		
		return "notice/noticeMain";
	}
	
	//공지사항 페이지 이동
	@RequestMapping(value="/notice.do", method = RequestMethod.GET)
	public String notice(NoticeVO vo, Model model,@RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range)  throws Exception{
		System.out.println("공지사항 목록 불러오는중");
		//전체 게시글 개수
		int listCnt = noticeService.countNotice();

		//Pagination 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);
		model.addAttribute("notice", noticeService.getNoticeList(pagination));

		return "notice/notice";
		
	}
	
	//관리자 - 공지사항 페이지 이동
	@RequestMapping(value="/getNotice.do", method = RequestMethod.GET)
	public String adminnotice(NoticeVO vo, Model model,@RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range)  throws Exception{
		System.out.println("공지사항 목록 불러오는중");
		//전체 게시글 개수
		int listCnt = noticeService.countNotice();

		//Pagination 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);
		model.addAttribute("notice", noticeService.getNoticeList(pagination));
		
		System.out.println( noticeService.getNoticeList(pagination));
			
		return "admin/adminnotice";
		
	}
	
	//글 검색 기능 - requestMapping 직전에 ModelAttribute를 호출
	@ModelAttribute("noticeMap")
	public Map<String, String> noticeConditionMap(){
		
		Map<String, String> noticeMap = new HashMap<String, String>();
		
		noticeMap.put("제목+내용", "ALL");

		System.out.println(noticeMap);
		
		return noticeMap;
	}
	
	//공지사항 검색
	@RequestMapping(value="/searchnotice.do", method = RequestMethod.GET)
	public String searchNotice(NoticeVO vo,Model model, @RequestParam("adId") String adId,@RequestParam("searchWrd") String searchWrd,@RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) throws Exception{
		System.out.println("공지사항 검색중");
		//전체 게시글 개수
		int listCnt = noticeService.countSearchNotice(searchWrd);

		//Pagination 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		pagination.setSearchWrd(searchWrd);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("notice", noticeService.searchList(pagination));
		
		if(adId != null) {
			return "admin/adminnotice";
		}
			
		
		return "notice/notice";
	}
	
	//공지사항 상세보기
	@RequestMapping(value="/getnotice.do", method = RequestMethod.GET)
	public String getNotice(NoticeVO vo, Model model,@RequestParam("page") int page, @RequestParam("range") int range, @RequestParam("rangeSize") int rangeSize) throws Exception{
		System.out.println("공지사항 상세보기 중");
		
		System.out.println(vo);
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("rangeSize", rangeSize);
		
		model.addAttribute("notice", noticeService.getNotice(vo));
		
		return "notice/getnotice";
	}
	
	//관리자 - 공지사항 상세보기
	@RequestMapping(value="/getNotice.do", method = RequestMethod.POST)
	public String getadminNotice(NoticeVO vo, Model model,@RequestParam("page") int page, @RequestParam("range") int range, @RequestParam("rangeSize") int rangeSize) throws Exception{
		System.out.println("관리자 공지사항 상세보기 중");
		
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("rangeSize", rangeSize);
		
		model.addAttribute("notice", noticeService.getNotice(vo));
		
		return "admin/getadminnotice";
	}
	
	//공지사항 작성 페이지 이동
	@RequestMapping(value="/insertNotice.do", method = RequestMethod.GET)
	public String noticepage(Model model,@RequestParam("page") int page, @RequestParam("range") int range, @RequestParam("rangeSize") int rangeSize) {
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("rangeSize", rangeSize);
		
		return"admin/insertnotice";
	}
	
	//공지사항 작성
	@ResponseBody
	@RequestMapping(value="/insertNotice.do", method = RequestMethod.POST)
	public String insertNotice(NoticeVO vo, Model model) {
		System.out.println("공지사항 작성중");
		
		System.out.println(vo);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		Date now = new java.sql.Date(System.currentTimeMillis());
		
		System.out.println(now);
		vo.setNoticeDate(now);
		
		noticeService.insertNotice(vo);
		
		return "success";
	}
	
	//공지사항 수정 페이지 이동
	@RequestMapping(value="/updateNotice.do", method = RequestMethod.GET)
	public String updatpage(NoticeVO vo, Model model, @RequestParam("page") int page, @RequestParam("range") int range, @RequestParam("rangeSize") int rangeSize) {
		
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("rangeSize", rangeSize);
		
		model.addAttribute("notice", noticeService.getNotice(vo));
		
		return "admin/updatenotice";
	}
	
	//공지사항 수정
	@ResponseBody
	@RequestMapping(value="/updateNotice.do", method = RequestMethod.POST)
	public String updateNotice(NoticeVO vo, Model model, @RequestParam("page") int page, @RequestParam("range") int range, @RequestParam("rangeSize") int rangeSize) {
		System.out.println("공지사항 수정 중");
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		Date now = new java.sql.Date(System.currentTimeMillis());
		
		System.out.println(now);
		vo.setNoticeDate(now);
		
		System.out.println(vo);
		
		noticeService.updateNotice(vo);
		
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("rangeSize", rangeSize);
		
		return "success";
	}
	
	//공지사항 삭제
	@ResponseBody
	@RequestMapping(value="/deleteNotice.do", method = RequestMethod.POST)
	public String deleteNotice(NoticeVO vo,Model model, @RequestParam("page") int page, @RequestParam("range") int range, @RequestParam("rangeSize") int rangeSize) {
		System.out.println("공지사항 삭제중");
		
		noticeService.deleteNotice(vo);
		
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("rangeSize", rangeSize);
		
		return "success";
	}
}
