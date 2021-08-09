package com.camping.view.search;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchController {
	
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
}
