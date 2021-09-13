package com.camping.view.search;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camping.biz.keep.KeepService;
import com.camping.biz.keep.KeepVO;
import com.camping.biz.recommend.RecommendService;
import com.camping.biz.recommend.RecommendVO;
import com.camping.biz.review.ReviewService;
import com.camping.biz.review.ReviewVO;

@Controller
public class SearchController {
	
	@Autowired
	RecommendService recommendService;
	
	@Autowired
	KeepService keepService;
	
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping(value="/searchPage.do", method = RequestMethod.GET)
	public String searchPage() {
		return "campings/searchCam";
	}
	
	@RequestMapping(value="/search.do", method =RequestMethod.GET)
	public String searchForm(Model model,@RequestParam("searchKrwd") String searchKrwd,@RequestParam("c_do") String c_do, @RequestParam("c_signgu") String c_signgu,HttpServletRequest request) {
		System.out.println("검색 처리 중");
		
		model.addAttribute("searchKrwd", searchKrwd);
		model.addAttribute("c_do",c_do);
		model.addAttribute("c_signgu",c_signgu);
		
		System.out.println(model);
		
		return "campings/searchCam";
	}
	
	@RequestMapping(value="/getCam.do", method=RequestMethod.GET)
	public String getCam(Model model,@RequestParam("contentId") int contentId) {
		model.addAttribute("contentId", contentId);
		System.out.println(model);
		return "campings/getCam";
	}
	
	@ResponseBody
	@RequestMapping(value="/recommend.do" , method = RequestMethod.GET)
	public String recommend(RecommendVO vo,@RequestParam("contentId") int contentId ,@RequestParam("memNo") int memNo,HttpServletRequest request) {
		System.out.println("추천중");
		
		int result = recommendService.recChk(vo);
		System.out.println(result);
		
		if(result == 0) {
			recommendService.updateRecommend(vo);
			System.out.println("추천 완료");
		}else {
			recommendService.deleteRecommend(vo);
			System.out.println("추천 삭제");
		}
		
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value="/reccount.do", method = RequestMethod.GET)
	public int recCount(RecommendVO vo) {
		System.out.println("추천수 확인 중");
		
		int count =  recommendService.recCount(vo);
		System.out.println(count);
		
		return count;
	}
	
	@ResponseBody
	@RequestMapping(value="/keep.do", method=RequestMethod.GET)
	public String insertKeep(KeepVO vo) {
		System.out.println("찜하기중");
		
		int result = keepService.kepChk(vo);

		if(result == 0) {
			System.out.println(vo);
			keepService.insertKeep(vo);
			System.out.println("찜하기 완료");
			return "Y";
		}else {
			keepService.deleteKeep(vo);
			System.out.println("찜하기 삭제");
			return "N";
		}
	
	}
	
	@RequestMapping(value="/camMap.do", method = RequestMethod.GET)
	public String camMap(Model model, @RequestParam("contentId") int contentId,@RequestParam("mapX") double mapX, @RequestParam("mapY") double mapY, @RequestParam("facltNm") String facltNm, @RequestParam("addr") String addr, @RequestParam("imgUrl") String imgUrl) {
		System.out.println("주변 정보 확인 중");
		
		model.addAttribute("contentId", contentId);
		model.addAttribute("mapX", mapX);
		model.addAttribute("mapY", mapY);
		model.addAttribute("facltNm", facltNm);
		model.addAttribute("addr", addr);
		model.addAttribute("imgUrl", imgUrl);
		
		System.out.println(model);
		return "campings/camMap";
	}
	
	@RequestMapping(value="/camReview.do", method = RequestMethod.GET)
	public String camReview(ReviewVO vo, Model model) {
		System.out.println("캠핑장 후기 목록");
		
		List<ReviewVO> review = reviewService.camReview(vo);
		
		System.out.println(review);
		
		model.addAttribute("review",review);
		model.addAttribute("contentId", vo.getContentId());
		return "campings/camReview";
	}
}
