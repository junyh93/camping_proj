package com.camping.biz.admin.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.biz.admin.AdminService;
import com.camping.biz.admin.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public boolean getLogin(AdminVO ad) {
		boolean admin = adminDAO.getLogin(ad);
		return admin;
	}
}
