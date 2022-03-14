package com.lhz.pojo;

import java.io.Serializable;
import java.util.Date;

public class Orders implements Serializable {
	
	private String oid;
	private String cid;
	private String uid;
	private Date otime;
	private String wait;
	private String wstate;
	
	private Card card;
	private User user;
	
	public Orders() {}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public Date getOtime() {
		return otime;
	}

	public void setOtime(Date otime) {
		this.otime = otime;
	}
	
	

	public String getWait() {
		return wait;
	}

	public void setWait(String wait) {
		this.wait = wait;
	}

	public String getWstate() {
		return wstate;
	}

	public void setWstate(String wstate) {
		this.wstate = wstate;
	}

	public Card getCard() {
		return card;
	}

	public void setCard(Card card) {
		this.card = card;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Orders [oid=" + oid + ", cid=" + cid + ", uid=" + uid + ", otime=" + otime + ", wait=" + wait
				+ ", wstate=" + wstate + ", card=" + card + ", user=" + user + "]";
	}

	
	
}
