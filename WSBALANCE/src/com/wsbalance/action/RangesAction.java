package com.wsbalance.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.wsbalance.pojo.Ranges;
import com.wsbalance.service.RangesService;
import com.wsbalance.util.JsonUtil;
@Controller
public class RangesAction extends ActionSupport implements ServletResponseAware{
	@Autowired
	private RangesService rangesService;
	
	private Ranges range;
	public void setRange(Ranges range) {
		this.range = range;
	}
	public Ranges getRange() {
		return range;
	}
	public String deleteRange() throws IOException{
		response.setCharacterEncoding("utf-8");
		JSONObject jb =new JSONObject();
		if(rangesService.deleteRange(range)){
			jb.put("code", 1);
		}else{
			jb.put("code", 0);
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
		return null;
		
	}
	public String getRangesAll() throws IOException{
		List<Ranges> lr=rangesService.getRangesAll();
		response.setCharacterEncoding("utf-8");
		JSONObject jb =new JSONObject();
		if(lr.size()>0){
			jb.put("code", 1);
			jb.put("lr", JsonUtil.listToJson(lr));
		}else{
			jb.put("code", 0);
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
		return null;
	}
	
	private ServletResponse response;
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		this.response=arg0;
	}
}