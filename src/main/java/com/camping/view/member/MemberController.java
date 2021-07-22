package com.camping.view.member;

import java.net.http.HttpRequest;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.biz.certification.CertificationService;
import com.camping.biz.member.MemberSerivce;
import com.camping.biz.member.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberSerivce memberService;
	
	@Autowired 
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
	@ResponseBody
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public boolean login(@RequestParam("memId") String memId,
			@RequestParam("memPw") String memPw, MemberVO vo, HttpSession session ,Model model) throws Exception {
		System.out.println("로그인 처리 중 ");
		
		boolean result = memberService.getLogin(vo);
		
		try {
			if(result == true) {
				 System.out.println("로그인 성공");
				
				 session.setAttribute("memId",vo.getMemId()); 
				 session.setAttribute("memNo", vo.getMemNo());
				 
				 vo.setMemId(memId);
				 vo.setMemNo(vo.getMemNo());
				 
				 // 세션 유지시간 1시간 
				 session.setMaxInactiveInterval(60*60);
				 
				 model.addAttribute("result", result);
		}else {
			  System.out.println("로그인 실패");
			  
			  model.addAttribute("result", result);
		
		}
		}catch (Exception e){
			throw new RuntimeException();
		}
		 return result;
			/*return "main";
			 *  return "login/login"; 
			 */		 
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
