package com.wsbalance.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.wsbalance.pojo.Agent;
import com.wsbalance.pojo.Page;
import com.wsbalance.service.AgentService;
import com.wsbalance.util.JsonUtil;

@Scope("prototype")
@Controller
public class AgentAction extends ActionSupport implements SessionAware,ServletResponseAware{
	private Agent agent;
	public void setAgent(Agent agent) {
		this.agent = agent;
	}
	public Agent getAgent() {
		return agent;
	}
	private Page page;
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	private int id;
	private String name;
	private int level;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	@Autowired
	private AgentService agentService;
	
	public String addAgent() throws IOException{
		agent.setAgcreateday(new Date());
		response.setCharacterEncoding("utf-8");
		JSONObject jb =new JSONObject();
		if(agentService.addAgent(agent)){
			agentService.updateagcount(agent.getAgpid(), true);
			jb.put("code", 1);
		}else{jb.put("code", 0);};
		PrintWriter out=response.getWriter();
		out.print(jb);
		out.flush();out.close();
		return null;
	}
	public String getAgentByAgwxnum() throws IOException{
		List<Agent> lg=agentService.getAgentByAgwxnum(agent.getAgwxnum());
		response.setCharacterEncoding("utf-8");
		JSONObject jb =new JSONObject();
		if(lg.size()>0){
			jb.put("code", 1);
			jb.put("agent", lg.get(0));
		}else{
			jb.put("code", 0);
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
		out.flush();out.close();
		return null;
	}
	public String getAgentByPage() throws IOException{
		if(!page.getStrWhere().equals("")){
			page.setStrWhere(" aglevel=0 and (agwxnum like '%"+page.getStrWhere()+"%' or agname like '%"+page.getStrWhere()+"%' or agtel like '%"+page.getStrWhere()+"%')");
		}else{
			page.setStrWhere(" aglevel=0");
		}
		List<Agent> lg=agentService.getAgentByPage(page);
		int count=agentService.getAgentCount(page);
		response.setCharacterEncoding("utf-8");
		JSONObject jb =new JSONObject();
		if(lg.size()>0){
			jb.put("code", 1);
			jb.put("lg", JsonUtil.listToJson(lg));
			jb.put("count", count);
		}else{
			jb.put("code", 0);
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
		out.flush();out.close();
		return null;
	}
	public String getAgentAllByPage() throws IOException{
		if(!page.getStrWhere().equals("")){
			page.setStrWhere("aglevel!=1 and (agwxnum like '%"+page.getStrWhere()+"%' or agname like '%"+page.getStrWhere()+"%' or agtel like '%"+page.getStrWhere()+"%')");
		}else{
			page.setStrWhere(" 1=1 and aglevel!=-1");
		}
		List<Agent> lg=agentService.getAgentByPage(page);
		int count=agentService.getAgentCount(page);
		response.setCharacterEncoding("utf-8");
		JSONObject jb =new JSONObject();
		if(lg.size()>0){
			jb.put("code", 1);
			jb.put("lg", JsonUtil.listToJson(lg));
			jb.put("count", count);
		}else{
			jb.put("code", 0);
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
		out.flush();out.close();
		return null;
	}
	public String getAgentTreeData() throws IOException{
		JSONObject json =new JSONObject();
		response.setCharacterEncoding("utf-8");
		List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		List<Agent> lg=agentService.getAgentByagpid(id);
		for(int i = 0;i < lg.size(); i ++){
			HashMap<String,Object> hm = new HashMap<String,Object>();   //最外层，父节点           
			hm.put("id", lg.get(i).getAgid());
			if(lg.get(i).getAglevel()==0){
			hm.put("name", lg.get(i).getAgname()+"(总代)");
			}else{
				hm.put("name", lg.get(i).getAgname()+"("+lg.get(i).getAglevel()+"级代理)");
			}
			hm.put("pId",id);
			if(lg.get(i).getAgcount()>0){
				hm.put("isParent", true);
				hm.put("icon", "img/diy/10.png");
			}else{
				hm.put("isParent", false);
				hm.put("icon", "img/diy/11.png");
			}
			list.add(hm);
		}	
		JSONArray arr = new JSONArray().fromObject(list);
		try {
			json.put("success", true);
			json.put("arr", arr);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		response.getWriter().write(arr.toString());
		return null;
	}
	public String getAgentByID(){
		Agent ag=agentService.getAgentByID(agent.getAgid());
		session.put("agent", ag);
		return "editagent";
	}
	
	public String changeAgent() throws IOException{
		System.out.println("vvvvvvvv");
		response.setCharacterEncoding("utf-8");
		JSONObject jb =new JSONObject();
		if(agentService.changeAgent(agent)){
			jb.put("code", 1);
		}else{
			jb.put("code", 0);
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
		out.flush();out.close();
		return null;
	}
	private ServletResponse response;
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.response=arg0;
	}
	private Map session;
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		session=arg0;
	}
}
