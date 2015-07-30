package com.mewin.entity;

import java.util.Date;

public class Jiaonuan {
	private long id;
	private String name;
	private String idCard;
	private String phone;
	private String address;
	private String yuanwang;
	private Date time = new Date();

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getYuanwang() {
		return yuanwang;
	}

	public void setYuanwang(String yuanwang) {
		this.yuanwang = yuanwang;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
}