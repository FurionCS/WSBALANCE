package com.wsbalance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wsbalance.dao.AgentDao;
import com.wsbalance.pojo.Agent;
import com.wsbalance.pojo.Page;


@Service
public class AgentService {
	@Autowired
	private AgentDao agentDao;
	
	public boolean addAgent(Agent agent){
		return agentDao.addAgent(agent);
	}
	public List<Agent> getAgentByAgwxnum(String agwxnum){
		return agentDao.getAgentByAgwxnum(agwxnum);
	}
	public List<Agent> getAgentByPage(Page page){
		return agentDao.getAgentByPage(page);
	}
	public int getAgentCount(Page page){
		return agentDao.getAgentCount(page);
	}
	public boolean updateagcount(int id,boolean isupdate){
		return agentDao.updateagcount(id, isupdate);
	}
	public Agent getAgentByID(int id){
		return agentDao.getAgentByID(id);
	}
	public List<Agent> findHAgent(int pid){
		return agentDao.findHAgent(pid);
	}
	public List<Agent> getAgentByagpid(int agpid){
		return agentDao.getAgentByagpid(agpid);
	}
	public boolean changeAgent(Agent agent){
		return agentDao.changeAgent(agent);
	}
	public boolean delete(Agent agent){
		return agentDao.delete(agent);
	}
}
