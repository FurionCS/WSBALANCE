package com.wsbalance.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.wsbalance.pojo.Achievement;
import com.wsbalance.pojo.Page;
import com.wsbalance.pojo.Performance;
import com.wsbalance.service.AchievementService;
import com.wsbalance.util.ExcelJxl;
import com.wsbalance.util.ExeclUtil;
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
	private Page page;
	public void setPage(Page page) {
		this.page = page;
	}
	public Page getPage() {
		return page;
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
	public String getPerformanceByPage() throws IOException{
		List<Performance> lp=achievementService.getPerformanceByPage(page);
		response.setCharacterEncoding("utf-8");
		JSONObject jb =new JSONObject();
		if(lp.size()>0){
			jb.put("code", 1);
			jb.put("lp", lp);
			jb.put("count", achievementService.getAchievementCount(page));
		}else{
			jb.put("code", 0);
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
		return null;
		
	}
	public String DownPerformanceToExcel() throws IOException{
		response.setCharacterEncoding("utf-8");
		JSONObject jb =new JSONObject();
		try{
		List<Performance> lp=achievementService.getPerformanceAll();
		String[][] body=new String[lp.size()][5];
		for(int i=0;i<lp.size();i++){
			body[i][0]=lp.get(i).getAgname();
			body[i][1]=lp.get(i).getAgwxnum();
			body[i][2]=Double.toString(lp.get(i).getMoney());
			body[i][3]=Double.toString(lp.get(i).getTeam());
			body[i][4]=Double.toString(lp.get(i).getPersonmoney());
		}
		String[] title = {"姓名","微信号","团队业绩","团队奖金","个人奖金"};
		ExcelJxl.JXLWrite(title, body);
		jb.put("code", 1);
		}catch(Exception e){
			System.out.println("");
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
