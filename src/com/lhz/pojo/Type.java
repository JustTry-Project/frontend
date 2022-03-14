package com.lhz.pojo;

import java.io.Serializable;
import java.util.Date;

public class Type implements Serializable {
	
	private String tid;
	private String tname;
	private String tpicture;
	private Date ttime;
	
	public Type() {}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getTpicture() {
		return tpicture;
	}

	public void setTpicture(String tpicture) {
		this.tpicture = tpicture;
	}

	public Date getTtime() {
		return ttime;
	}

	public void setTtime(Date ttime) {
		this.ttime = ttime;
	}

	@Override
	public String toString() {
		return "Type [tid=" + tid + ", tname=" + tname + ", tpicture=" + tpicture + ", ttime=" + ttime + "]";
	}
	
	
}
