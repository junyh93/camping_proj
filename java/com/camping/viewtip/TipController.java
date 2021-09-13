package com.camping.viewtip;

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

import com.camping.biz.pagination.Pagination;
import com.camping.biz.recommend.RecommendService;
import com.camping.biz.recommend.RecommendVO;
import com.camping.biz.tip.TipService;
import com.camping.biz.tip.TipVO;

@Controller
public class TipController {
	@Autowired
	TipService tipService;
	
	@Autowired
	RecommendService recommendService;
	
	//팁 페이지 이동
	@RequestMapping(value="/tip.do", method = RequestMethod.GET)
	public String tipPage( Model model, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) throws Exception{
		System.out.println("팁 목록 불러오는중");
		
		//전체 게시글 개수
		int listCnt = tipService.countTip();

		//Pagination 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);
		model.addAttribute("tip", tipService.tipList(pagination));

		return "tip/tip";
	}
	
	//main 팁
	@RequestMapping(value="/tipMain.do", method = RequestMethod.GET)
	public String tipMain(TipVO vo, Model model) {
		List<TipVO> tip = tipService.getTipMain(vo);
		
		model.addAttribute("tip", tip);
		
		System.out.println("main팁 호출중"+tip);
		
		return "tip/tipMain";
	}
	
	//팁 상세보기 페이지 이동
	@RequestMapping(value="/getTip.do", method = RequestMethod.GET)
	public String getTip(TipVO vo, Model model,@RequestParam("page") int page, @RequestParam("range") int range, @RequestParam("rangeSize") int rangeSize) throws Exception{
		System.out.println("팁 상세보기");
		
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("rangeSize", rangeSize);
		
		model.addAttribute("tip", tipService.getTip(vo));

		return "tip/getTip";
	}
	
	//팁 작성 페이지 이동 
	@RequestMapping(value="/insertTip.do", method = RequestMethod.GET)
	public String insertTipPage() {
		return "tip/insertTip";
	}
	
	//팁 작성
	@ResponseBody
	@RequestMapping(value="/insertTip.do", method = RequestMethod.POST)
	public String insertTip(TipVO vo) {
		System.out.println("팁 작성중");
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		Date now = new java.sql.Date(System.currentTimeMillis());
		
		System.out.println(now);
		vo.setTipDate(now);
		
		tipService.insertTip(vo);
		
		System.out.println(vo);
		
		return "success";
	}
	
	//팁 수정 페이지 이동
	@RequestMapping(value="/updateTip.do", method = RequestMethod.GET)
	public String updateTipPage(TipVO vo, Model model, @RequestParam("page") int page, @RequestParam("range") int range, @RequestParam("rangeSize") int rangeSize) {
		System.out.println("팁 수정 페이지 이동");
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("rangeSize", rangeSize);
		
		model.addAttribute("tip", tipService.getTip(vo));
		
		return "tip/updateTip";
	}
	
	//팁 수정
	@ResponseBody
	@RequestMapping(value="/updateTip.do", method = RequestMethod.POST)
	public String updateTip(TipVO vo, Model model, @RequestParam("page") int page, @RequestParam("range") int range, @RequestParam("rangeSize") int rangeSize) {
		System.out.println("팁 수정중");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		Date now = new java.sql.Date(System.currentTimeMillis());
		
		System.out.println(now);
		vo.setTipDate(now);
		
		tipService.updateTip(vo);
		
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("rangeSize", rangeSize);
		
		return "success";
	}
	
	//팁 삭제
	@ResponseBody
	@RequestMapping(value="/deleteTip.do")
	public String deleteTip(TipVO vo,Model model, @RequestParam("page") int page, @RequestParam("range") int range, @RequestParam("rangeSize") int rangeSize) {
		System.out.println("팁 삭제 중");
		
		tipService.deleteTip(vo);
		
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("rangeSize", rangeSize);
		
		return "success";
	}
	
	//글 검색 기능
	@ModelAttribute("tipMap")
	public Map<String, String> tipConditionMap(){
		
		Map<String, String> tipMap = new HashMap<String, String>();
		
		tipMap.put("제목+내용", "ALL");

		System.out.println(tipMap);
		
		return tipMap;
	}
	
	//팁 검색
	@RequestMapping(value="/searchTip.do", method= RequestMethod.POST)
	public String searchMem(TipVO vo, Model model,@RequestParam("searchWrd") String searchWrd,@RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) throws Exception{
		System.out.println("팁 검색 중");
		
		//전체 게시글 개수
		int listCnt = tipService.countSearchTip(searchWrd);

		//Pagination 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		pagination.setSearchWrd(searchWrd);
		
		model.addAttribute("pagination", pagination);
	
		model.addAttribute("tip",tipService.searchTipList(pagination));
		
		
		return "tip/tip";
	}
	
	//좋아요
	@ResponseBody
	@RequestMapping(value="/tipLike.do", method=RequestMethod.GET)
	public String like(RecommendVO vo) {
		System.out.println("좋아요 중");
		
		int result = recommendService.likChk(vo);
		System.out.println(result);
		
		if(result == 0){
			recommendService.updateLike(vo);
			System.out.println("좋아요 완료");
		}else {
			recommendService.deleteLike(vo);
			System.out.println("좋아요 삭제");
		}
		
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value="/tipLikeCount.do",method=RequestMethod.GET)
	public int likCount(RecommendVO vo) {
		System.out.println("좋아요수 확인 중");
		
		int count = recommendService.likCount(vo);
		System.out.println(count);
		
		return count;
	}
	
	//싫어요 
	@ResponseBody
	@RequestMapping(value="/tipHate.do", method = RequestMethod.GET)
	public String hate(RecommendVO vo,@RequestParam("memNo") int memNo) {
		System.out.println("싫어요 중");
		
		int result = recommendService.hatChk(vo);
		System.out.println(result);
		
		if(result == 0) {
			recommendService.updateHate(vo);
			System.out.println("싫어요 완료");
		}else {
			recommendService.deleteHate(vo);
			System.out.println("싫어요 삭제");
		}
		
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value="/tipHateCount.do", method = RequestMethod.GET)
	public int hatCount(RecommendVO vo) {
		System.out.println("싫어요수 확인 중");
		
		int count = recommendService.hatCount(vo);
		System.out.println(count);
		
		return count;
	}
}
