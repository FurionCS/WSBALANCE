package com.wsbalance.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.wsbalance.pojo.Admin;

@Service
public class AdminDao extends BaseDao{
	public List<Admin> checkAdmin(Admin admin){
		Query query=getSession().createQuery("From Admin where adname=? and adpassword=?");
		query.setString(0, admin.getAdname());
		query.setString(1, admin.getAdpassword());
		List<Admin> la=query.list();
		return la;
	}
	public boolean updatePassword(Admin admin){
		Admin adm=(Admin) getSession().get(Admin.class, admin.getAdid());
		adm.setAdpassword(admin.getAdpassword());
		return true;
		
	}
}
