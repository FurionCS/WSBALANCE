package com.wsbalance.pojo;

import java.io.Serializable;

public class Performance implements Serializable{
	private int agid;           //代理id
	private String agname;      //代理名字
	private String agwxnum;     //代理微信号
	private double money;       //代理团队业绩
	private double team;        //代理团队奖金
	private double personmoney; //个人奖金
	private double moneyperson; //个人业绩
	
	public Performance() {
		super();
	}
	
	public Performance(int agid, String agname, String agwxnum, double money,
			double team, double personmoney, double moneyperson) {
		super();
		this.agid = agid;
		this.agname = agname;
		this.agwxnum = agwxnum;
		this.money = money;
		this.team = team;
		this.personmoney = personmoney;
		this.moneyperson = moneyperson;
	}

	public int getAgid() {
		return agid;
	}
	public void setAgid(int agid) {
		this.agid = agid;
	}
	public String getAgname() {
		return agname;
	}
	public void setAgname(String agname) {
		this.agname = agname;
	}
	public String getAgwxnum() {
		return agwxnum;
	}
	public void setAgwxnum(String agwxnum) {
		this.agwxnum = agwxnum;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public double getTeam() {
		return team;
	}
	public void setTeam(double team) {
		this.team = team;
	}
	public double getPersonmoney() {
		return personmoney;
	}
	public void setPersonmoney(double personmoney) {
		this.personmoney = personmoney;
	}
	public double getMoneyperson() {
		return moneyperson;
	}
	public void setMoneyperson(double moneyperson) {
		this.moneyperson = moneyperson;
	}
	
}
