package com.mewin.entity;

import java.util.Date;

public class Admin {
	private Long id;
	private String account;
	private String psw;
	private String name;
	private String bz;
	private Date time = new Date();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
}