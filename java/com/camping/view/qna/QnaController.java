package com.camping.view.qna;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.camping.biz.admin.AdminService;
import com.camping.biz.admin.AdminVO;
import com.camping.biz.qna.QnaService;
import com.camping.biz.qna.QnaVO;

@Controller
public class QnaController {
	
	@Autowired
	QnaService qnaService;
	
	@Autowired
	AdminService adminService;
	
	//1:1문의 작성 페이지 이동
	@RequestMapping(value="/qna.do", method=RequestMethod.GET)
	public String insertQnapage(QnaVO vo) {
		System.out.println("1:1문의 페이지 이동");
		return "qna/qna";
	}
	
	//글 검색 기능 - requestMapping 직전에 ModelAttribute를 호출
	@ModelAttribute("conditionMap")
	public Map<String, String> qnaConditionMap(){
		
		Map<String, String> conditionMap = new HashMap<String, String>();
		
		conditionMap.put("캠핑장 예약", "BOOK");
		conditionMap.put("캠핑장 후기", "REVIEW");
		conditionMap.put("불법 캠핑장", "UNLAW");
		conditionMap.put("기타 사항", "ETC");
		
		System.out.println(conditionMap);
		
		return conditionMap;
	}
	
	//1:1문의 작성
	@ResponseBody
	@RequestMapping(value="/qna.do", method = RequestMethod.POST)
	public String insertQna(QnaVO vo) {
		System.out.println("1:1문의 작성중");
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		Date now = new java.sql.Date(System.currentTimeMillis());
		
		System.out.println(now);
		vo.setQnaDate(now);
		
		qnaService.insertQna(vo);
		
		return "success";
	}
	
	//1:1문의 수정페이지 이동
	@RequestMapping(value="/updateQna.do", method = RequestMethod.GET)
	public String updateQnapage(QnaVO vo, Model model) {
		QnaVO qna = qnaService.getQna(vo);
		
		model.addAttribute("qna",qna);
		System.out.println(model);
		
		return "qna/updateqna";
	}
	
	//1:1문의 수정
	@ResponseBody
	@RequestMapping(value="/updateQna.do", method = RequestMethod.POST)
	public String updateQna(QnaVO vo) {
		System.out.println("1:1문의 수정중");
	
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		Date now = new java.sql.Date(System.currentTimeMillis());
		
		System.out.println(now);
		vo.setQnaDate(now);
		
		qnaService.updateQna(vo);
		
		return "success";
	}
	
	//1:1문의 삭제
	@RequestMapping(value="/deleteQna.do", method = RequestMethod.POST)
	public String deleteQna(QnaVO vo) {
		System.out.println("1:1문의 삭제중");
		
		qnaService.deleteQna(vo);
		
		return "mypage/myqna";
	}
	
	//1:1문의 페이지 목록
	@RequestMapping(value="/myQna.do", method = RequestMethod.GET)
	public String getQnaList(QnaVO vo,Model model) {
		System.out.println("1:1문의 목록");
		
		List<QnaVO> qna = qnaService.getQnaList(vo);

		model.addAttribute("qna",qna);

		System.out.println(model);
		
		return "mypage/myqna";
	}
	
	//1:1문의 상세보기
	@RequestMapping(value="/getQna.do", method = RequestMethod.POST)
	public String getQna(QnaVO vo,AdminVO ad,Model model) {
		System.out.println("1:1문의 상세보기");
		
		QnaVO qna = qnaService.getQna(vo);
		
		model.addAttribute("qna",qna);
		
		System.out.println(qna);
		
		AdminVO admin = adminService.getReplay(ad);
		
		if(admin != null) {
			model.addAttribute("admin",admin);
			
			System.out.println(admin);
		}
		
		return "qna/getqna";
	}
}
