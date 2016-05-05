package com.wsbalance.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wsbalance.pojo.Admin;
import com.wsbalance.service.AdminService;

@Controller
public class AdminAction extends ActionSupport implements SessionAware{
	@Autowired
	private AdminService adminService;
	private Admin admin;
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public Admin getAdmin() {
		return admin;
	}

	public String checkAdmin(){
		List<Admin> la=adminService.checkAdmin(admin);
		if(la.size()>0){
			session.put("login", la.get(0));
			return "index";
		}else{
			return "login";
		}
	}
	private Map<String,Object> session;
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		session=arg0;
	}
}
