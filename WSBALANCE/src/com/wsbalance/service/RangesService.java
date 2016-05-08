package com.wsbalance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wsbalance.dao.RangesDao;
import com.wsbalance.pojo.Ranges;

@Service
public class RangesService {
	@Autowired
	private RangesDao rangesDao;
	
	public List<Ranges> getRangesAll(){
		return rangesDao.getRangesAll();
	}
	public boolean deleteRange(Ranges range){
		return rangesDao.deleteRange(range);
	}
	
}
