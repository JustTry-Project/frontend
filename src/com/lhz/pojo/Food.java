package com.lhz.pojo;

import java.io.Serializable;
import java.util.Date;

public class Food implements Serializable {
	
	private String fid;
	private String fname;
	private String fpicture;
	private Double fprice;
	private String fdesc;
	private Date ftime;
	private String tid;
	
	public Food() {}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFpicture() {
		return fpicture;
	}

	public void setFpicture(String fpicture) {
		this.fpicture = fpicture;
	}

	public Double getFprice() {
		return fprice;
	}

	public void setFprice(Double fprice) {
		this.fprice = fprice;
	}

	public String getFdesc() {
		return fdesc;
	}

	public void setFdesc(String fdesc) {
		this.fdesc = fdesc;
	}

	public Date getFtime() {
		return ftime;
	}

	public void setFtime(Date ftime) {
		this.ftime = ftime;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	@Override
	public String toString() {
		return "Food [fid=" + fid + ", fname=" + fname + ", fpicture=" + fpicture + ", fprice=" + fprice + ", fdesc="
				+ fdesc + ", ftime=" + ftime + ", tid=" + tid + "]";
	}
	
	
	
	
}
