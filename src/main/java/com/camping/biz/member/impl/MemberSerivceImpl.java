package com.camping.biz.member.impl;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.biz.member.MemberSerivce;
import com.camping.biz.member.MemberVO;

@Service
public class MemberSerivceImpl implements MemberSerivce {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public void insertMember(MemberVO vo) {
		memberDAO.insertMember(vo);
		
	}

	@Override
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
		
	}
	

	@Override
	public void updatePw(MemberVO vo) {
		memberDAO.updatePw(vo);
		
	}

	@Override
	public void deleteMember(MemberVO vo) {
		memberDAO.deleteMember(vo);
		
	}

	@Override
	public boolean getLogin(MemberVO vo) {
		boolean result = memberDAO.getLogin(vo);

		return result;
	}

	

	@Override
	public MemberVO getMember(MemberVO vo) {
		MemberVO member = memberDAO.getMember(vo);
		return member;
	}

	@Override
	public int idChk(MemberVO vo) {
		int result = memberDAO.idchk(vo);
		return result;
	}

	
	//아이디 찾기
	@Override
	public MemberVO findId(MemberVO vo) throws Exception {
		System.out.println(vo);
		
		MemberVO member = memberDAO.findId(vo);
		
		return member;

	}

	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(MemberVO vo, String div) throws Exception{
		System.out.println("이메일 발송 처리중");
		System.out.println(vo);
		System.out.println(div);
		//Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "junyh93@gmail.com";
		String hostSMTPpwd = "vkwjs7935";
		
		//보내는 사람 Email, 제목, 내용
		String fromEmail = "junyh93@gmail.com";
		String fromName = "For rest Camping";
		String subject = "";
		String msg = "";
		
		if(div.equals("findpw")) {
			subject = "For rest Camping 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:'G마켓 산스';'>";
			msg += "<h3 style='color:blue;'>";
			msg += vo.getMemId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getMemPw() + "</p>";
			msg += "<a href='http://localhost:8090/camping/'>홈페이지로 이동</a></div>";
		
		}
		
		String mail = vo.getMemEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);//465 587
			
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail,fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		}catch(Exception e){
			System.out.println("메일발송 실패 : " + e);
		}
	}
	
	//비밀번호 찾기
	@Override
	public int findPw(MemberVO vo) throws Exception{
		System.out.println("비밀번호 찾기 서비스 중");
		System.out.println(vo);
	
		int ck = memberDAO.findPw(vo);
		System.out.println("ck = " + ck);
		
		int num;

		//가입 아이디가 없으면
		if(memberDAO.idchk(vo) == 0) {
			System.out.println("아이디 없음");
			num = 1;
		//아이디가 있으면 메일 검색
		}else {
			//메일 주소가 일치하지 않는 경우
			if(ck == 0) {
				System.out.println("이메일 없음");
				num = 2;
			//메일 주소가 일치하는 경우
			}else {
				System.out.println("비번 생성 중");
				String pw = "";
				for (int i = 0; i <12; i++) {
					pw += (char)((Math.random() * 26) + 97);	
				}
				vo.setMemPw(pw);
				
				memberDAO.updatePw(vo);
				System.out.println(pw);
				sendEmail(vo, "findpw");
				
				num = 3;
			}
		}		
		return num;
	}	
}
