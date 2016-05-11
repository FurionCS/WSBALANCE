package com.wsbalance.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.wsbalance.pojo.Achievement;
import com.wsbalance.pojo.Page;
import com.wsbalance.pojo.Performance;


@Service
public class AchievementDao extends BaseDao{
	/**
	 * 得到业绩通过Agent
	 * @param agent
	 * @return
	 */
	public List<Achievement> getAchievementByAgent(int agent){
		Query query=getSession().createQuery("From Achievement where agent=?");
		query.setInteger(0, agent);
		return query.list();
	}
	
	/**
	 * 增加业绩
	 * @param achievement
	 * @return
	 */
	public boolean addAchievement(Achievement achievement){
		try{
			getSession().save(achievement);
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}
	/**
	 * 更新业绩
	 * @param achievement
	 * @return
	 */
	public boolean updateAchievement(Achievement achievement){
		try{
			Achievement achieve=(Achievement) getSession().load(Achievement.class, achievement.getAid());
			achieve.setMoney(achievement.getMoney());
			achieve.setProportion(achievement.getProportion());
			achieve.setLasttime(new Date());
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}
	public List<Achievement> getAchievementAll(){
		return getSession().createQuery("from Achievement").list();
	}
	public List<Performance> getPerformanceByPage(Page page){
		Query query=getSession().createSQLQuery("select * from V_WSBALANCE_PERFORMANCE Where agname like ? or agwxnum like ?");
		return query.setString(0, "%"+page.getStrWhere()+"%").setString(1, "%"+page.getStrWhere()+"%").setFirstResult((page.getPageIndex() - 1) * page.getPageSize()).setMaxResults(page.getPageSize()).list();
		
	}
	public int getAchievementCount(Page page){
		return getSession().createSQLQuery("select * from V_WSBALANCE_PERFORMANCE Where agname like ? or agwxnum like ?").setString(0, "%"+page.getStrWhere()+"%").setString(1, "%"+page.getStrWhere()+"%").list().size();
	}
	
}
