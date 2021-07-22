package com.camping.view.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	@RequestMapping(value = "/admin.do", method = RequestMethod.POST)
	public String admin() {
		return "admin/admin";
	}
}
