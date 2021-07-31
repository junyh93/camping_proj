package com.camping.view.review;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.camping.biz.member.MemberSerivce;
import com.camping.biz.review.ReviewService;
import com.camping.biz.review.ReviewVO;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private MemberSerivce memberService;
	
	//후기 페이지 이동
	@RequestMapping(value="/review.do", method = RequestMethod.GET)
	public String reviewPage(ReviewVO vo, Model model) {
		List<ReviewVO> review = reviewService.getReviewList(vo);
		
		model.addAttribute("review", review);
		
		System.out.println(review);
		
		return "review/review";
	}
	
	//후기 상세보기 페이지 이동
	@RequestMapping(value="/getreview.do", method = RequestMethod.GET)
	public String getReview(ReviewVO vo, Model model) {
		ReviewVO review =  reviewService.getReview(vo);
		
		model.addAttribute("review",review);
		System.out.println(review);
		
		return "review/getReview";
	}
	
	//후기 작성 페이지 이동 
	@RequestMapping(value="/addreview.do", method = RequestMethod.GET)
	public String addReviewPage() {
		return "review/addReview";
	}
	
	//후기 작성
	@RequestMapping(value="/addreview.do", method = RequestMethod.POST)
	public String addReview(@RequestParam("memNo") int memNo, @RequestParam("memId") String memId, @RequestParam("contentId") int contentId, ReviewVO vo, HttpSession session,HttpServletRequest request, MultipartHttpServletRequest multi) throws Exception{
		
		String fileSaveFolder = session.getServletContext().getRealPath("/reviewUpload/");
		
		String fileName = "";
		

		Iterator<String> files = multi.getFileNames();
		List savefiles = new ArrayList();
		try {
			while(files.hasNext()) {
				String uploadFile = files.next();
				
				MultipartFile mFile = multi.getFile(uploadFile);
				 
				fileName = mFile.getOriginalFilename();
				System.out.println("실제 파일 이름 : " + fileName);
				mFile.transferTo(new File(fileSaveFolder + fileName));
				
					if(files.hasNext()) {
						savefiles.add(mFile.getOriginalFilename()+",");
					}else {
						savefiles.add(mFile.getOriginalFilename());
					}
						StringBuffer fl = new StringBuffer();
						for(int i=0;i<savefiles.size();i++){
							fl.append(savefiles.get(i));	
						}
				
				vo.setRvImg(fl.toString());
				}		
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		
		 
		
		//위도,경도 값 type변환(String -> Double) 
		double mapX = Double.parseDouble(request.getParameter("mapX"));
		double mapY = Double.parseDouble(request.getParameter("mapY"));
		
		vo.setMapX(mapX);
		vo.setMapY(mapY);
		
	
		//null값 체크
		String lineIntro = request.getParameter("lineIntro");
		String tel = request.getParameter("tel");
		String homePage = request.getParameter("homePage");
		
		if(lineIntro.equals("undefined")){
			lineIntro = lineIntro.replace("undefined", "-");
		}
		
		if(tel.equals("undefined")) {
			tel = tel.replace("undefined", "-");
		}
		
		if(homePage.equals("undefined")) {
			homePage = homePage.replace("undefined", "-");
		}
		
		//현재 날짜
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		Date now = new java.sql.Date(System.currentTimeMillis());
		
		System.out.println(now);
		System.out.println(contentId);
		System.out.println(mapX);
		System.out.println(mapY);
		
		vo.setRvDate(now);
		vo.setLineIntro(lineIntro);
		vo.setTel(tel);
		vo.setHomePage(homePage);
		
		
		System.out.println(vo);
		reviewService.insertReview(vo);
		
		return "redirect:review.do";
	}
	
	@RequestMapping(value="/updatereview.do", method = RequestMethod.GET)
	public String updateReviewPage() {
		return "review/updateReview";
	}
	
	@RequestMapping(value="/updatereview.do", method = RequestMethod.POST)
	public String updateReview(@RequestParam("memNo") int memNo, @RequestParam("memId") String memId,ReviewVO vo) {
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		Date now = new java.sql.Date(System.currentTimeMillis());
		
		System.out.println(now);
		vo.setRvDate(now);
		
		System.out.println(vo);
		reviewService.updateReview(vo);
		
		return "redirect:review.do";
	}
	
	@RequestMapping(value="/deletereview.do", method=RequestMethod.GET)
	public String deleteReview(@RequestParam("memNo") int memNo,ReviewVO vo) {
		
		reviewService.deleteReview(vo);
		
		return "redirect:review.do";
	}
	
	@RequestMapping(value="/popUp.do" , method=RequestMethod.GET)
	public String popUp(){
		return "review/popUp";
	}
}
