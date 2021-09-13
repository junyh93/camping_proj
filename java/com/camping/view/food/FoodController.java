package com.camping.view.food;


import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camping.biz.pagination.Pagination;
import com.camping.biz.recommend.RecommendService;
import com.camping.biz.recommend.RecommendVO;

@Controller
public class FoodController {
	
	@Autowired
	RecommendService recommendService;
	
	//음식 페이지 이동
	@RequestMapping(value="/food.do", method = RequestMethod.GET)
	public String food() {
		return "campings/foodCam";
	}
	
	//음식 페이지 페이징
	@RequestMapping(value="/food.do", method = RequestMethod.POST)
	public String foodpaging(Model model,HttpServletRequest request,@RequestParam("total") int total,@RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) {
		int listCnt = total;
		
		System.out.println(listCnt);
		
		Pagination pagination = new Pagination();

		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);
		
		System.out.println(pagination);
		
		return "success";
	}
	
	//음식 상세보기
	@RequestMapping(value="/getFood.do", method = RequestMethod.GET)
	public String getFood(Model model,@RequestParam("videoId") String videoId) {
		model.addAttribute("videoId",videoId);
		System.out.println(videoId);
		
		return "campings/getFood";
	}
	
	
	//좋아요
	@ResponseBody
	@RequestMapping(value="/like.do", method=RequestMethod.GET)
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
	@RequestMapping(value="/likcount.do",method=RequestMethod.GET)
	public int likCount(RecommendVO vo) {
		System.out.println("좋아요수 확인 중");
		
		int count = recommendService.likCount(vo);
		System.out.println(count);
		
		return count;
	}
	
	//싫어요
	@ResponseBody
	@RequestMapping(value="/hate.do", method = RequestMethod.GET)
	public String hate(RecommendVO vo,@RequestParam("id") String id, @RequestParam("memNo") int memNo) {
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
	@RequestMapping(value="/hatcount.do", method = RequestMethod.GET)
	public int hatCount(RecommendVO vo) {
		System.out.println("싫어요수 확인 중");
		
		int count = recommendService.hatCount(vo);
		System.out.println(count);
		
		return count;
	}
}
