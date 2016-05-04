package com.wsbalance.pojo;

import java.util.Date;


/**
 * 
 * @微商用户表
 * @author cs
 *
 */
public class WSUsers{
	private int WSUID;            //ID
	private String WSUWXNUM;      //微信号
	private String WSUNAME;       //名字
	private String WSUTEL;        //电话
	private String WSUIDCARD;     //身份证
	private int WSPUID;           //上级ID
	private int WSLEVEL;          //等级  0为总代，1为一级代理。。。。
	private String WSAUTHORIZATION;  //授权号
	private Date WSCREATEDAY;     //录入时间
	
	public int getWSUID() {
		return WSUID;
	}
	public void setWSUID(int wSUID) {
		WSUID = wSUID;
	}
	public String getWSUWXNUM() {
		return WSUWXNUM;
	}
	public void setWSUWXNUM(String wSUWXNUM) {
		WSUWXNUM = wSUWXNUM;
	}
	public String getWSUNAME() {
		return WSUNAME;
	}
	public void setWSUNAME(String wSUNAME) {
		WSUNAME = wSUNAME;
	}
	public String getWSUTEL() {
		return WSUTEL;
	}
	public void setWSUTEL(String wSUTEL) {
		WSUTEL = wSUTEL;
	}
	public String getWSUIDCARD() {
		return WSUIDCARD;
	}
	public void setWSUIDCARD(String wSUIDCARD) {
		WSUIDCARD = wSUIDCARD;
	}
	public int getWSPUID() {
		return WSPUID;
	}
	public void setWSPUID(int wSPUID) {
		WSPUID = wSPUID;
	}
	public int getWSLEVEL() {
		return WSLEVEL;
	}
	public void setWSLEVEL(int wSLEVEL) {
		WSLEVEL = wSLEVEL;
	}
	public String getWSAUTHORIZATION() {
		return WSAUTHORIZATION;
	}
	public void setWSAUTHORIZATION(String wSAUTHORIZATION) {
		WSAUTHORIZATION = wSAUTHORIZATION;
	}
	public Date getWSCREATEDAY() {
		return WSCREATEDAY;
	}
	public void setWSCREATEDAY(Date wSCREATEDAY) {
		WSCREATEDAY = wSCREATEDAY;
	}
	public WSUsers() {
		super();
	}
	
	
}
