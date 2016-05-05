package com.wsbalance.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.wsbalance.pojo.Agent;
import com.wsbalance.service.AgentService;

@Controller
public class AgentAction extends ActionSupport implements ServletResponseAware{
	private Agent agent;
	public void setAgent(Agent agent) {
		this.agent = agent;
	}
	public Agent getAgent() {
		return agent;
	}
	@Autowired
	private AgentService agentService;
	
	public String addAgent() throws IOException{
		agent.setAgcreateday(new Date());
		response.setCharacterEncoding("utf-8");
		JSONObject jb =new JSONObject();
		if(agentService.addAgent(agent)){
			jb.put("code", 1);
		}else{jb.put("code", 0);};
		PrintWriter out=response.getWriter();
		out.print(jb);
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
		return null;
	}
	private ServletResponse response;
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.response=arg0;
	}
}
