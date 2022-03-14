package com.lhz.pojo;

import java.io.Serializable;

public class Admin implements Serializable {

	private String aid;
	private String admin;
	private String password;
	
	public Admin () {}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Admin [aid=" + aid + ", admin=" + admin + ", password=" + password + "]";
	};
	
	
}
