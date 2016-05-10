package com.wsbalance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wsbalance.dao.AchievementDao;
import com.wsbalance.pojo.Achievement;
import com.wsbalance.pojo.Agent;


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
	public boolean updateAchievement(Achievement achievement){
		return achievementDao.updateAchievement(achievement);
	}
	public List<Achievement> getAchievementAll(){
		return achievementDao.getAchievementAll();
	}
}

