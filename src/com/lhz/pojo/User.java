package com.lhz.pojo;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
	
	private String uid;
	private String username;
	private String password;
	private String phone;
	private String nike;
	private Date utime;
	private Double acount;
	
	public User() {}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNike() {
		return nike;
	}

	public void setNike(String nike) {
		this.nike = nike;
	}

	public Date getUtime() {
		return utime;
	}

	public void setUtime(Date utime) {
		this.utime = utime;
	}

	public Double getAcount() {
		return acount;
	}

	public void setAcount(Double acount) {
		this.acount = acount;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password=" + password + ", phone=" + phone + ", nike="
				+ nike + ", utime=" + utime + ", acount=" + acount + "]";
	}
	
	
	
	
}
