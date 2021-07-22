package com.camping.view.member;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.maven.shared.invoker.SystemOutHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camping.biz.admin.AdminService;
import com.camping.biz.admin.AdminVO;
import com.camping.biz.certification.CertificationService;
import com.camping.biz.member.MemberSerivce;
import com.camping.biz.member.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberSerivce memberService;
	private AdminService adminService;
	private CertificationService certificationService;
	
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String joinPage() {
		return "login/join";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/idChk.do", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception{
		System.out.println("아이디 중복 체크 처리중");
		int result = memberService.idChk(vo);
		return result;
	}
	
	//회원가입
	@RequestMapping(value="/join.do", method = RequestMethod.POST)
	public String insertMember(MemberVO vo, HttpServletRequest request) throws Exception{
		//아이디 중복 체크
		int result = memberService.idChk(vo);
		try {
			if(result==1) {
				return "login/join";
			}else {
				memberService.insertMember(vo);
				System.out.println(vo);
			}
		}catch (Exception e) {
			throw new RuntimeException();
		}
		return "main";
	}	
	
	//로그인 페이지 이동
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginPage() {
		return "login/login";
		
	}
	
	//로그인 
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(@RequestParam("id") String id, @RequestParam("pw") String pw,
					MemberVO vo, AdminVO ad, HttpSession session, HttpServletRequest request , Model model){
		System.out.println("로그인 처리 중 ");
		
		String getid = request.getParameter(id);
		String getpw = request.getParameter(pw);
		System.out.println(getid);
		String msg = "로그인 실패";
		String url = "login.do";
		String cm = "";
		
		//amdin 로그인 처리
		if(id.length() < 6) {
			ad.setAdId(getid);
			ad.setAdPw(getpw);
			
			boolean result = adminService.getLogin(ad);
			
			if(result == true) {
				System.out.println("admin 로그인 성공");
				
				msg="로그인 성공";
				url = "/main.do";
				 
				session.setAttribute("adId",ad.getAdId()); 
				session.setAttribute("adNo", ad.getAdNo());
				
				model.addAttribute("msg",msg);
				model.addAttribute("url",url);
				 
				cm = "common/message";
			}
			
		}else {
		//member 로그인 처리
			System.out.println(getid);
			
			vo.setMemId(getid);
			vo.setMemPw(getpw);
			
			boolean result = memberService.getLogin(vo);
			
			if(result == true) {
				System.out.println("member 로그인 성공");
				System.out.println(vo);
				
				MemberVO member = memberService.getMember(vo);
				
				msg="로그인 성공";
				url = "/main.do";

				session.setAttribute("memId",member.getMemId()); 
				session.setAttribute("memNo",member.getMemNo());
						 
				// 세션 유지시간 1시간 
				session.setMaxInactiveInterval(60*60);
						 
				model.addAttribute("msg",msg);
				model.addAttribute("url",url);
						 
				cm = "common/message";
			}
		}
		
		return cm;
	}
	
	//마이페이지 이동
	@RequestMapping(value="/mypage.do", method = RequestMethod.GET)
	public String myPage() {
		return "mypage/mypage";
	}
	
	//로그아웃
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session, HttpServletResponse response) {

		session.invalidate();
		
		return "main";
	}
	
	
	//휴대폰 번호 인증 (Ajax)
	@RequestMapping(value="/sendSMS.do")
	@ResponseBody
	public String sendSMS(String phoneNumber) {
	   Random random = new Random();
	   String certNum = "";
	   for(int i=0; i<4; i++) {
	      String randomNum = Integer.toString(random.nextInt(10));
	      certNum+=randomNum;
	   }

	   System.out.println("수신자 번호 : " + phoneNumber);
	   System.out.println("인증번호 : " + certNum);
	   certificationService.certifiedPhoneNumber(phoneNumber, certNum);
	   return certNum;
	}
	

	
	public String updateMember() {
		
		return "";
	}
	
	public String deleteMember() {
		return "";
	}
}
