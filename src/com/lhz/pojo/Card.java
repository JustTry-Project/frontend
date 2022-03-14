package com.lhz.pojo;

import java.io.Serializable;
import java.util.Date;

public class Card implements Serializable {
	
	private String cid;
	private String fid;
	private Integer num;
	private String uid;
	private Double tprice;
	private Character pay;
	private Date ctime;
	
	private Food food;
	
	public Card() {}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	

	public Double getTprice() {
		return tprice;
	}

	public void setTprice(Double tprice) {
		this.tprice = tprice;
	}

	public Character getPay() {
		return pay;
	}

	public void setPay(Character pay) {
		this.pay = pay;
	}

	public Date getCtime() {
		return ctime;
	}

	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}
	
	

	public Food getFood() {
		return food;
	}

	public void setFood(Food food) {
		this.food = food;
	}

	@Override
	public String toString() {
		return "Card [cid=" + cid + ", fid=" + fid + ", num=" + num + ", uid=" + uid + ", tprice=" + tprice + ", pay="
				+ pay + ", ctime=" + ctime + ", food=" + food + "]";
	}

	
	
	
	
}
