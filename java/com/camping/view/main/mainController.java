package com.camping.view.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller 
public class mainController {
	
	@RequestMapping(value="/main.do" , method = RequestMethod.GET)
	public String main() {
		return "main";
	}
}
