package com.wsbalance.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.wsbalance.pojo.Agent;
import com.wsbalance.pojo.Page;

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
	
	/**
	 * 得到代理通过微信号
	 * @param agwxnum
	 * @return
	 */
	public List<Agent> getAgentByAgwxnum(String agwxnum){
		Query query=getSession().createQuery("From Agent where agwxnum=?");
		query.setString(0, agwxnum);
		List<Agent> lg=query.list();
		return lg;
	}
	/**
	 * 得到代理通过分页
	 * @param page
	 * @return
	 */
	public List<Agent> getAgentByPage(Page page){
		Query query=getSession().createQuery("From Agent where "+page.getStrWhere()+" order by "+page.getOrderby());
		List<Agent> la=query.setFirstResult((page.getPageIndex() - 1) * page.getPageSize()).setMaxResults(page.getPageSize()).list();
		return la;
	}
	/**
	 * 得到代理数量
	 * @param page
	 * @return
	 */
	public int getAgentCount(Page page){
		return getSession().createQuery("From Agent where "+page.getStrWhere()+" order by "+page.getOrderby()).list().size();
	}
}
