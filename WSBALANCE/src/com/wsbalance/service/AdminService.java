package com.wsbalance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wsbalance.dao.AdminDao;
import com.wsbalance.pojo.Admin;

@Service
public class AdminService {
	@Autowired
	private AdminDao adminDao;
	
	public List<Admin> checkAdmin(Admin admin){
		return adminDao.checkAdmin(admin);
	}
}
