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
	/**
	 * 更新下属代理数量
	 * @param id
	 * @param isupdate
	 * @return
	 */
	public boolean updateagcount(int id,boolean isupdate){
		Agent agent=(Agent) getSession().load(Agent.class, id);
		if(isupdate){
		agent.setAgcount(agent.getAgcount()+1);
		}else{
			if(agent.getAgcount()>0){
			agent.setAgcount(agent.getAgcount()-1);
			}
		}
		return true;
	}
	/**
	 * 得到代理
	 * @param id
	 * @return
	 */
	public Agent getAgentByID(int id){
		return (Agent)getSession().get(Agent.class, id);
	}
	/**
	 * 通过夫id 得到下属代理
	 * @param pid
	 * @return
	 */
	public List<Agent> findHAgent(int pid){
		try{
			Query query=getSession().createQuery("from Agent where agpid=?");
			query.setInteger(0, pid);
			return query.list();
		}catch(Exception e){
			System.out.println(e.getMessage()); 
			return null;
		}
	}
	/**
	 * 得到所有代理
	 * @return
	 */
	public List<Agent> getAgentAllOrderBy(){
		try{
			Query query=getSession().createQuery("from Agent order by agpid ");
			return query.list();
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	
	/**
	 * 得到代理通过父id
	 * @param agpid
	 * @return
	 */
	public List<Agent> getAgentByagpid(int agpid){
		try{
			Query query=getSession().createQuery("from Agent where agpid=? order by aglevel");
			query.setInteger(0, agpid);
			return query.list();
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	
	public boolean changeAgent(Agent agent){
		try{
		Agent ag=(Agent) getSession().load(Agent.class, agent.getAgid());
		ag.setAgname(agent.getAgname());
		ag.setAgidcard(agent.getAgidcard());
		ag.setAglevel(agent.getAglevel());
		ag.setAgstatus(agent.getAgstatus());
		ag.setAgauthorization(agent.getAgauthorization());
		ag.setAgtel(agent.getAgtel());
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
}
