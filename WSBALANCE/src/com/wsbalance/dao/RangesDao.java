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
	
	/**
	 * 删除范围
	 * @param range
	 * @return
	 */
	public boolean deleteRange(Ranges range){
		try{
			getSession().delete(range);
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return false;
	}
	/**
	 * 增加一个范围
	 * @param range
	 * @return
	 */
	public boolean addRange(Ranges range){
		try{
			getSession().save(range);
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}
	/**
	 * 更新范围
	 * @param range
	 * @return
	 */
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
	/**
	 * 得到比例
	 * @param money
	 * @return
	 */
	public double getProportion(double money){
		Query query=getSession().createQuery("from Ranges where minnum<=? and maxnum>?");
		query.setDouble(0, money);
		query.setDouble(1, money);
		List<Ranges> lr=query.list();
		if(lr.size()>0){
			return lr.get(0).getProportion();
		}else{
			return -1;
		}
	}

}
