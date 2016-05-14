package com.wsbalance.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.ScrollableResults;
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
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	public List<Achievement> getAchievementAll(){
		return getSession().createQuery("from Achievement").list();
	}
	/**
	 * 得到处理过的业绩通过分页
	 * @param page
	 * @return
	 */
	public List<Performance> getPerformanceByPage(Page page){
		Query query=getSession().createSQLQuery("select * from V_WSBALANCE_PERFORMANCE Where agname like ? or agwxnum like ?");
		return query.setString(0, "%"+page.getStrWhere()+"%").setString(1, "%"+page.getStrWhere()+"%").setFirstResult((page.getPageIndex() - 1) * page.getPageSize()).setMaxResults(page.getPageSize()).list();
		
	}
	/**
	 * 得到业绩数量
	 * @param page
	 * @return
	 */
	public int getAchievementCount(Page page){
		return getSession().createSQLQuery("select * from V_WSBALANCE_PERFORMANCE Where agname like ? or agwxnum like ?").setString(0, "%"+page.getStrWhere()+"%").setString(1, "%"+page.getStrWhere()+"%").list().size();
	}
	/**
	 * 得到处理过的业绩表所有记录
	 * @return
	 */
	public List<Performance> getPerformanceAll(){
			List<Performance> lp=new ArrayList<Performance>();
			List list=getSession().createSQLQuery("select * from V_WSBALANCE_PERFORMANCE").list();
			Iterator it=list.iterator();
			while(it.hasNext()){
				Object[] obj=(Object[]) it.next();
				Performance p=new Performance(Integer.parseInt(String.valueOf(obj[0])),(String)obj[1],(String)obj[2],Double.parseDouble(String.valueOf(obj[3])),Double.parseDouble(String.valueOf(obj[4])),Double.parseDouble(String.valueOf(obj[5])));
				lp.add(p);
			}
		
		return lp;
	}
	/**
	 * 删除
	 * @return
	 */
	public boolean deleteAllAchievement(){
		try{
		getSession().createSQLQuery("delete from T_WSBALANCE_ACHIEVEMENT where 1=1").executeUpdate();
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
}
