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

}
