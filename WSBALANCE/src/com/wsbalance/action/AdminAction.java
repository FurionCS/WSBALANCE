package com.wsbalance.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wsbalance.pojo.Admin;
import com.wsbalance.service.AdminService;

@Controller
public class AdminAction extends ActionSupport implements SessionAware,ServletResponseAware{
	@Autowired
	private AdminService adminService;
	private Admin admin;
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public Admin getAdmin() {
		return admin;
	}
	private String newpassword;
	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	public String getNewpassword() {
		return newpassword;
	}
	/*private Map session=ActionContext.getContext().getSession();*/
	public String checkAdmin(){
		
		List<Admin> la=adminService.checkAdmin(admin);
		if(la.size()>0){
			session.put("admin", la.get(0));
			return "index";
		}else{
			return "input";
		}
	}
	public String LoginOut(){
		session.clear();
		return "input";
	}
	public String updatePassword() throws IOException{
		response.setCharacterEncoding("utf-8");
		JSONObject jb =new JSONObject();
		Admin oldadmin=(Admin) session.get("admin");
		if(oldadmin.getAdpassword().equals(admin.getAdpassword())){
		 oldadmin.setAdpassword(newpassword);
			try{
				adminService.updatePassword(oldadmin);
				jb.put("code", 1);
			}catch(Exception e){
				 jb.put("code", 0);
			}
		}else{
			jb.put("code", -1);
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
		out.flush();
		out.close();
		 return null;
	}
	private Map<String,Object> session;
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		session=arg0;
	}
	private ServletResponse response;
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		response=arg0;
	}
}
