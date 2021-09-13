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
	public void insertEmail(MemberVO vo) throws Exception {
		System.out.println("이메일 발송 처리중");
		System.out.println(vo);

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
		
		
			subject = vo.getMemId()+"님, For rest Camping 회원 가입을 축하드립니다.";
			msg += "<div style='border:1px solid #e1e1e1'>";
			msg += "<div style='height:70px;padding:0 30px;background:#f8f8f8;border-bottom:1px solid #e1e1e1'>";
			msg += "<h3 style='float:left;padding:14px 0;margin:0'><a href='http://localhost:8090/camping/' target='_blank'><img src='http://localhost:8090/camping/img/logoForest1.png' class='CToWUd'></a></h3>";
			msg += " <p style='padding:22px 0;float:right;margin:0'><a href='http://localhost:8090/camping/'><img src='http://localhost:8090/camping/img/logoForest1.png'  class='CToWUd'></a></p></div>";
			msg += "<div style='padding:30px'><div style='padding-bottom:50px'>";
			msg += "<img src='https://ci6.googleusercontent.com/proxy/s46U_aQJwL_VZiRsVQJcnsYQ8RJgD1Zh6GPrZAGXOFpM2MSW9gt_HXX4OIxN4h7lUSmkiQtBZAao-_Pj7zKjZba3CXXDqmfLvFoG=s0-d-e1-ft#http://www.webjangi.com/assets/img/common/mail_img06.png' class='CToWUd'></div>";
			msg += "<dl style='padding-bottom:20px;margin:0'>";
			msg += "<dt style='line-height:24px;padding-bottom:35px'>";
			msg += "<span>"+vo.getMemId()+"님 안녕하세요. For rest Camping입니다. 회원님의 회원가입을 축하드립니다.</span><br>";
			msg += "다양한 캠핑장 정보 서비스를 전해 드리도록 최선을 다하겠습니다.</dt>";
			msg += "<dd style='line-height:24px;margin:0'>앞으로도 많은 관심 부탁드립니다.</dd></dl></div>";
			msg += "<div style='background:#f8f8f8;padding:20px 30px;border-top:1px solid #e1e1e1'>";
			msg += "<p style='line-height:24px;margin:0'>오픈필드 고객센터<br>";
			msg += "<span style='margin-right:20px'>전화 : 070-8872-8874</span>이메일 : <a href='http://localhost:8090/camping/' target='_blank'>info@openfield.co.kr</a> <br>";
			msg += "<em style='color:#8c8c8c;font-style:normal'>이 메일은 발신 전용입니다. 문의사항은 고객센터로 문의해주세요.</em>";
			msg += "</p><div class='yj6qo'></div><div class='adL'></div></div><div class='adL'></div></div>";
	
		
		
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

	//회원 정보
	@Override
	public MemberVO memInfo(MemberVO vo) {
		MemberVO member = memberDAO.memInfo(vo);
		return member;
	}

	@Override
	public int idChk(MemberVO vo) {
		int result = memberDAO.idchk(vo);
		return result;
	}
	
	
	//탈퇴 위한 회원 체크
	@Override
	public int memChk(MemberVO vo) {
		int result = memberDAO.memChk(vo);
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
			msg += "<div style='border:1px solid #e1e1e1'>";
			msg += "<div style='height:70px;padding:0 30px;background:#f8f8f8;border-bottom:1px solid #e1e1e1'>";
			msg += "<h3 style='float:left;padding:14px 0;margin:0'><a href='http://localhost:8090/camping/' target='_blank' data-saferedirecturl='https://www.google.com/url?q=http://www.webjangi.com&amp;source=gmail&amp;ust=1630547591069000&amp;usg=AFQjCNF9Brq4zjZL6RAhnqdQQP82BywOWQ'><img src='http://localhost:8090/camping/img/logoForest1.png' class='CToWUd'></a></h3>";
			msg += " <p style='padding:22px 0;float:right;margin:0'><a href='http://localhost:8090/camping/'><img src='http://localhost:8090/camping/img/logoForest1.png'  class='CToWUd'></a></p></div>";
			msg += "<div style='padding:30px'>";
			msg += "<dl style='padding-bottom:20px;margin:0'>";
			msg += "<dt style='line-height:24px;padding-bottom:35px'>";
			msg += "<span>"+vo.getMemId()+"님 안녕하세요. For rest Camping입니다.</span><br>";
			msg += "임시 비밀번호 발급되었습니다.꼭 비밀번호를 변경하여 사용하세요.</dt>";
			msg += "<dd style='line-height:24px;margin:0'>임시 비밀번호 :"+vo.getMemPw()+"</dd></dl></div>";
			msg += "<div style='background:#f8f8f8;padding:20px 30px;border-top:1px solid #e1e1e1'>";
			msg += "<p style='line-height:24px;margin:0'>오픈필드 고객센터<br>";
			msg += "<span style='margin-right:20px'>전화 : 070-8872-8874</span>이메일 : <a href='http://localhost:8090/camping/' target='_blank'>info@openfield.co.kr</a> <br>";
			msg += "<em style='color:#8c8c8c;font-style:normal'>이 메일은 발신 전용입니다. 문의사항은 고객센터로 문의해주세요.</em>";
			msg += "</p><div class='yj6qo'></div><div class='adL'></div></div><div class='adL'></div></div>";
		
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
