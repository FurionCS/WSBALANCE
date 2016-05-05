package com.wsbalance.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wsbalance.dao.AgentDao;
import com.wsbalance.pojo.Agent;


@Service
public class AgentService {
	@Autowired
	private AgentDao agentDao;
	
	public boolean addAgent(Agent agent){
		return agentDao.addAgent(agent);
	}

}
