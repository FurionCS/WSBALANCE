package com.wsbalance.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.wsbalance.pojo.Achievement;
import com.wsbalance.pojo.Page;
import com.wsbalance.pojo.Performance;
import com.wsbalance.service.AchievementService;
import com.wsbalance.util.ExportUtils;
import com.wsbalance.util.JsonUtil;

@Scope("prototype")
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
		out.flush();
		out.close();
		return null;
	}
	public String addAchieve() throws IOException{
		response.setCharacterEncoding("utf-8");
		JSONObject jb =new JSONObject();
		try{
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
		}}catch(Exception e){
			System.out.println(e.getMessage());
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
		out.flush();
		out.close();
		return null;
	}
	
	public String addOneAchievement(){
		try{
			if(achievement.getAid()==-1){
				achievementService.addAchievement(achievement);
			}else{
				achievementService.updateAchievement(achievement);
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
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
		out.flush();
		out.close();
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
		out.flush();
		out.close();
		return null;
	}
	/*public String getInputStream() throws IOException{
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
		}catch(Exception e){
			System.out.println("");
			jb.put("code", 0);
			PrintWriter out=response.getWriter();
			out.print(jb);
			out.flush();
			out.close();
			return null;
		}
	
		return null;
		
	}
	*/
	/**
	 * 使用的包有：
	 * poi-3.2-FINAL-20081019.jar
	 *poi-contrib-3.2-FINAL-20081019.jar
	 *poi-scratchpad-3.2-FINAL-20081019.jar
	 * @throws IOException
	 */
	public void downexcel() throws IOException{
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename=Achievement.xls");
		HSSFWorkbook  wb=new HSSFWorkbook();
		HSSFSheet sheet=wb.createSheet("sheet0");
		String[] title = {"姓名","微信号","团队业绩","团队奖金","个人奖金"};
		List<Performance> lp=achievementService.getPerformanceAll();
		ExportUtils.outputHeaders(title, sheet);
		ExportUtils.outputColumns(title, lp, sheet, 1);
		ServletOutputStream out=response.getOutputStream();
		wb.write(out);
		out.flush();
		out.close();
	}
	public String deleteAllAchievement() throws IOException{
		response.setCharacterEncoding("utf-8");
		JSONObject jb =new JSONObject();
		try{
			achievementService.deleteAllAchievement();
			jb.put("code", 1);
		}catch(Exception e){
			jb.put("code", 0);
			
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
		out.flush();
		out.close();
		return null;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return "success";
	}
	private HttpServletResponse response;
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		response=arg0;
	}
}
