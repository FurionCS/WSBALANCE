package com.wsbalance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wsbalance.dao.AchievementDao;
import com.wsbalance.pojo.Achievement;
import com.wsbalance.pojo.Page;
import com.wsbalance.pojo.Performance;


@Service
public class AchievementService {
	@Autowired
	private AchievementDao achievementDao;
	public List<Achievement> getAchievementByAgent(int agent){
		return achievementDao.getAchievementByAgent(agent);
	}
	public boolean addAchievement(Achievement achievement){
		return achievementDao.addAchievement(achievement);
	}
	public boolean removeAddAchievement(int id,double changemoney){
		return achievementDao.removeAddAchievement(id, changemoney);
	}
	public boolean updateAchievement(Achievement achievement){
		return achievementDao.updateAchievement(achievement);
	}
	
	public List<Performance> getPerformanceByPage(Page page){
		return achievementDao.getPerformanceByPage(page);
	}
	public List<Achievement> getAchievementAll(){
		return achievementDao.getAchievementAll();
	}
	public int getAchievementCount(Page page){
		return achievementDao.getAchievementCount(page);
	}
	public List<Performance> getPerformanceAll(){
		return achievementDao.getPerformanceAll();
	}
	public boolean deleteAllAchievement(){
		return achievementDao.deleteAllAchievement();
	}
}

