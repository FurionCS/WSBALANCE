package com.wsbalance.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.wsbalance.pojo.Agent;

@Service
public class AgentDao extends BaseDao{
	
	
	/**
	 * 增加一个代理
	 * @param agent
	 * @return
	 */
	public boolean addAgent(Agent agent){
		try{ 
			getSession().save(agent);
			}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
			}
		return true;
	}
	
	
	public List<Agent> getAgentByAgwxnum(String agwxnum){
		Query query=getSession().createQuery("From Agent where agwxnum=?");
		query.setString(0, agwxnum);
		List<Agent> lg=query.list();
		return lg;
	}
}
