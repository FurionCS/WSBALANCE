package com.wsbalance.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.wsbalance.pojo.Ranges;


@Service
public class RangesDao extends BaseDao{
	
	
	/**
	 * 得到范围所有列表
	 * order by minnum
	 * @return
	 */
	public List<Ranges> getRangesAll(){
		Query query=getSession().createQuery("From Ranges order by minnum");
		return query.list();
	}
	
	public boolean deleteRange(Ranges range){
		try{
			getSession().delete(range);
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return false;
	}
	public boolean addRange(Ranges range){
		try{
			getSession().save(range);
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}
	public boolean updateRange(Ranges range){
		try{
		Ranges ranges=(Ranges) getSession().load(Ranges.class, range.getRid());
		ranges.setMinnum(range.getMinnum());
		ranges.setMaxnum(range.getMaxnum());
		range.setProportion(range.getProportion());
		return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return  false;
		}
	}

}
