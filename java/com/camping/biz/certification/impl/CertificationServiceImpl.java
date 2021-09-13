package com.camping.biz.certification.impl;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.camping.biz.certification.CertificationService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class CertificationServiceImpl implements CertificationService {

	@Override
	public void certifiedPhoneNumber(String phoneNumber, String certNum) {
	     String api_key = "NCS89HEVNEJLJGK3";
	       String api_secret = "G0AWCL2AFTWN3FT9UFPPXZUL55R8P4FL";
	       Message coolsms = new Message(api_key, api_secret);
	   
	       // 4 params(to, from, type, text) are mandatory. must be filled
	       HashMap<String, String> params = new HashMap<String, String>();
	       params.put("to", phoneNumber); // 수신전화번호
	       params.put("from", phoneNumber); // 발신전화번호 (테스트 : 발신과 수신 동일하게)
	       params.put("type", "SMS");
	       params.put("text", "For rest Camping 가입 인증번호는 " + "["+certNum+"]" + " 입니다.");
	       params.put("app_version", "test app 1.2"); // application name and version
	   
	       try {
	           JSONObject obj = (JSONObject) coolsms.send(params);
	           System.out.println(obj.toString());
	       } catch (CoolsmsException e) {
	           System.out.println(e.getMessage());
	           System.out.println(e.getCode());
	       }


	}

}
