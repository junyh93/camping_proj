package com.camping.view.member;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.camping.biz.keep.KeepService;
import com.camping.biz.keep.KeepVO;
import com.camping.biz.member.MemberSerivce;
import com.camping.biz.member.MemberVO;
import com.camping.biz.qna.QnaVO;
import com.camping.biz.review.ReviewService;
import com.camping.biz.review.ReviewVO;

@Controller
public class MemberController {
	@Autowired
	private MemberSerivce memberService;
	@Autowired
	private KeepService keepService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private CertificationService certificationService;

	
	//회원가입 페이지 이동
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String joinPage() {
		return "login/join";
		
	}
	
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idChk.do", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception{
		System.out.println("아이디 중복 체크 처리중");
		
		int result = memberService.idChk(vo);
		
		return result;
	}
	
	//회원가입
	@RequestMapping(value="/join.do", method = RequestMethod.POST)
	public String insertMember(MemberVO vo, Model model,HttpServletRequest request) throws Exception{
		System.out.println("회원가입 중");
		
		//아이디 중복 체크
		int result = memberService.idChk(vo);
		try {
			if(result==1) {
				return "login/join";
			}else {
				memberService.insertMember(vo);
				System.out.println(vo);
				memberService.insertEmail(vo);
				MemberVO mem = memberService.memInfo(vo);
				model.addAttribute("mem",mem);
				System.out.println(mem);
			}
		}catch (Exception e) {
			throw new RuntimeException();
		}
		return "login/joinChk";
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
		
		String getId = request.getParameter("id");
		String getPw = request.getParameter("pw");
		System.out.println(getId);
		String msg = "로그인 실패";
		String url = "login.do";
		String cm = "";
		
		//amdin 로그인 처리
		if(getId.length() < 6) {
			ad.setGetId(getId);
			ad.setGetPw(getPw);
			
			boolean result = adminService.getLogin(ad);
			
			if(result == true) {
				System.out.println("admin 로그인 성공");
				
				AdminVO admin = adminService.getAdmin(ad);
				
				System.out.println(admin);
				
				msg="로그인 성공";
				url = "/admin.do";
				 
				session.setAttribute("adId",admin.getAdId()); 
				session.setAttribute("adNo", admin.getAdNo());
				session.setAttribute("adName", admin.getAdName());
				
				// 세션 유지시간 1시간 
				session.setMaxInactiveInterval(60*60);
				
				model.addAttribute("msg",msg);
				model.addAttribute("url",url);
				 
				cm = "common/message";
			}
			
		}else {
		//member 로그인 처리
			System.out.println(getId);
			
			vo.setGetId(getId);
			vo.setGetPw(getPw);
			System.out.println(vo);
			boolean result = memberService.getLogin(vo);
			System.out.println(result);
			
			if(result == true) {
				System.out.println("member 로그인 성공");
				System.out.println(vo);
				
				MemberVO member = memberService.getMember(vo);
				
				System.out.println(member);
				
				msg="로그인 성공";
				url = "main.do";

				session.setAttribute("memId",member.getMemId()); 
				session.setAttribute("memNo",member.getMemNo());
						 
				// 세션 유지시간 1시간 
				session.setMaxInactiveInterval(60*60);
						 
				model.addAttribute("msg",msg);
				model.addAttribute("url",url);
						 
				cm = "common/message";
			}else if(result == false){
				
				model.addAttribute("msg",msg);
				model.addAttribute("url",url);
				
				cm="common/message";
			}
		}
		return cm;
	}

	
	//로그아웃
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session, HttpServletResponse response) {
		System.out.println("로그아웃 중");
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
	
	//아이디 찾기 페이지 이동
	@RequestMapping(value="/findid.do", method = RequestMethod.GET)
	public String findIdGET() {
		return "login/findid";
	}
	
	//아이디 찾기
	@ResponseBody
	@RequestMapping(value="/findid.do", method = RequestMethod.POST)
	public String findIdPOST(@RequestParam("name") String name, @RequestParam("phone") String phone, MemberVO vo) throws Exception{
		System.out.println("아이디 찾기 처리 중");
		System.out.println(name + ""+ phone);
		
		String msg = "로그인 실패";

		vo.setMemName(name);
		vo.setMemPhone(phone);
		
		System.out.println(vo);
		MemberVO member = memberService.findId(vo);
		
		System.out.println(member);
		
		if(member == null) {
			System.out.println("아이디 없음");
			
			msg = "가입된 아이디가 없습니다.";

		}else {
			System.out.println(member + "아이디 있음");
			
			msg = member.getMemId(); 
			System.out.println(msg);	
		}
		return msg;
	}
	
	//비밀번호 찾기 페이지 이동
	@RequestMapping(value="/findpw.do", method = RequestMethod.GET)
	public String findPwGET() {
		return "login/findpw";
	}
	
	//비밀번호 찾기
	@ResponseBody
	@RequestMapping(value="/findpw.do", method= RequestMethod.POST)
	public int findPwPOST(@RequestParam("id") String id, @RequestParam("email") String email, MemberVO vo) throws Exception {
		System.out.println("비밀번호 찾기 처리 중");
		System.out.println(id);
		System.out.println(email);
		
		vo.setMemId(id);
		vo.setMemEmail(email);
		
		int num = memberService.findPw(vo);
		
		System.out.println(vo);

		return num;
	}
	
	//회원 정보 수정 페이지 이동
	@RequestMapping(value="/updateMember.do", method = RequestMethod.GET)
	public String updateMemberPage() {
		
		return "mypage/update";
	}
	
	//마이페이지 이동
	@RequestMapping(value="/mypage.do", method = RequestMethod.GET)
	public String myPage(MemberVO vo, Model model, HttpServletRequest request) {
		System.out.println("마이페이지 이동중");
	
		System.out.println(vo);
		MemberVO member = memberService.memInfo(vo);
		
		model.addAttribute("member",member);
		
		System.out.println(member);
		return "mypage/mypage";
	}
		
	//회원 정보 수정
	@RequestMapping(value="/updateMember.do", method = RequestMethod.POST)
	public String updateMember(MemberVO vo) {
		
		return "mypage/mypage";
	}

	//비밀번호 변경 페이지 이동
	@RequestMapping(value="/pwChg.do", method = RequestMethod.GET)
	public String pwChgPage() {
		return "mypage/pwChg";
	}
	
	//비밀번호 변경
	@ResponseBody
	@RequestMapping(value="/pwChg.do", method = RequestMethod.POST)
	public String pwChg(MemberVO vo) {
		System.out.println("비번 변경 중");
		
		memberService.updatePw(vo);
		
		System.out.println(vo);
		
		return "success";
	}
	
	
	//비밀번호 확인 페이지 이동(탈퇴)
	@RequestMapping(value="/pwChk.do", method = RequestMethod.GET)
	public String pwChk() {
		return "mypage/pwChk";
	}
	
	//비밀번호 확인
	@ResponseBody
	@RequestMapping(value="/pwChk.do", method = RequestMethod.POST)
	public int pwChk(@RequestParam("memId") String id, @RequestParam("memPw") String pw, MemberVO vo, Model model) {
		System.out.println("비번 확인 중");
		
		vo.setMemId(id);
		vo.setMemPw(pw);
		
		int result = memberService.memChk(vo);
		
		System.out.println(vo);
		
		
		return result;
	}
	
	//회원 탈퇴
	@RequestMapping(value="/deleteMember.do")
	public String deleteMember(MemberVO vo,Model model,HttpSession session) {
		System.out.println("회원 탈퇴 중");
		
		memberService.deleteMember(vo);
		System.out.println(vo);
		session.invalidate();

		return "main";
	}
	
	//마이페이지 찜 캠핑장 상세보기
	@RequestMapping(value="/getKeep.do", method = RequestMethod.POST)
	public String getKeepList(KeepVO vo, Model model) {
		System.out.println("내가 찜한 캠핑장 상세보기");
		
		List<KeepVO> keep = keepService.getKeepList(vo);
		
		System.out.println(keep);
		
		model.addAttribute("keep",keep);
		
		return "mypage/zzimCam";
	}
}
