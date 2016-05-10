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
import com.wsbalance.pojo.Achievement;
import com.wsbalance.service.AchievementService;
import com.wsbalance.util.JsonUtil;

@Controller
public class AchievementAction extends ActionSupport implements ServletResponseAware{
	@Autowired
	private AchievementService achievementService;
	
	private Achievement achievement;
	public void setAchievement(Achievement achievement) {
		this.achievement = achievement;
	}
	public Achievement getAchievement() {
		return achievement;
	}
	
	public String getAchievementByAgent() throws IOException{
		List<Achievement> la=achievementService.getAchievementByAgent(achievement.getAgent().getAgid());
		response.setCharacterEncoding("utf-8");
		JSONObject jb =new JSONObject();
		if(la.size()>0){
			jb.put("code", 1);
			jb.put("achievement", JsonUtil.beanToJson(la.get(0)));
		}else{
			jb.put("code", 0);
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
		return null;
	}
	public String addAchievement() throws IOException{
		response.setCharacterEncoding("utf-8");
		JSONObject jb =new JSONObject();
		if(achievement.getAid()==-1){
			if(achievementService.addAchievement(achievement)){
				jb.put("code", 1);
			}else{
				jb.put("code", 0);
			}
		}else{
			if(achievementService.updateAchievement(achievement)){;
				jb.put("code", 1);
			}else{
				jb.put("code", 0);
			}
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
		return null;
	}
	public String getAchievementAll() throws IOException{
		List<Achievement> la=achievementService.getAchievementAll();
		response.setCharacterEncoding("utf-8");
		JSONObject jb =new JSONObject();
		if(la.size()>0){
			jb.put("code", 1);
			jb.put("la", JsonUtil.listToJson(la));
			System.out.println(jb.get(la));
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
		response=arg0;
	}
}
