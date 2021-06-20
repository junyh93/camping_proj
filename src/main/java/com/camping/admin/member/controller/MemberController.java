package com.camping.admin.member.controller;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camping.admin.member.repository.MemberVO;
import com.camping.admin.member.service.MemberSerivce;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class MemberController {
	@Autowired
	private MemberSerivce memberService;
	
	@RequestMapping("/join.do")
	public String insertMember(MemberVO vo, HttpServletRequest request) {
		
		memberService.insertMember(vo);
		
		
		return "index.jsp";
		
	}	



 
	@RequestMapping("/sendSms.do")
		public String sendSMS(HttpServletRequest request) throws Exception{
			Random rand = new Random()
;			String numStr = "";
			String api_key = "NCS89HEVNEJLJGK3"; //���� �� ���� API KEY��
		    String api_secret = "G0AWCL2AFTWN3FT9UFPPXZUL55R8P4FL"; //API Secret ��
		    Message coolsms = new Message(api_key, api_secret);
		    
		    for(int i=0; i<4; i++){
		    	String ran = Integer.toString(rand.nextInt(10));
		    	numStr += ran;
		    }
		    
		    System.out.println("������ ��ȣ : " + request.getParameter("mobile"));
		    System.out.println("������ȣ :" + numStr);
		   
		    
		    // 4 params(to, from, type, text) are mandatory. must be filled
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", "01000000000");
		    params.put("from", request.getParameter("mobile"));
		    params.put("type", "SMS");
		    params.put("text", "ù��° ������ �׽�Ʈ ���� �޼���!" + "[" +numStr+ "]" + "�Դϴ�.");
		    params.put("app_version", "test app 1.2"); // application name and version
	
		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    }
		return numStr;
	}
	
	
	
	public String updateMember() {
		
		return "";
	}
	
	public String deleteMember() {
		return "";
	}
}
