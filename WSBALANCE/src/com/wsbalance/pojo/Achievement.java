package com.wsbalance.pojo;

import java.util.Date;
/**
 * 
 * @业绩表
 * @author cs
 *
 */
public class Achievement {
	private int AID;       //业绩id
	private WSUsers WSUSER;  //总代ID
	private double Money;  //业绩
	private double PROPORTION;  //比例
	private Date LASTTIME;      //最新更新时间
	public int getAID() {
		return AID;
	}
	public void setAID(int aID) {
		AID = aID;
	}
	
	public WSUsers getWSUSER() {
		return WSUSER;
	}
	public void setWSUSER(WSUsers wSUSER) {
		WSUSER = wSUSER;
	}
	public double getMoney() {
		return Money;
	}
	public void setMoney(double money) {
		Money = money;
	}
	public double getPROPORTION() {
		return PROPORTION;
	}
	public void setPROPORTION(double pROPORTION) {
		PROPORTION = pROPORTION;
	}
	public Date getLASTTIME() {
		return LASTTIME;
	}
	public void setLASTTIME(Date lASTTIME) {
		LASTTIME = lASTTIME;
	}
	public Achievement() {
		super();
	}
	
}
