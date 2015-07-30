package com.mewin.entity;

import java.util.Date;

public class Order {
	private long id;
	private String name;
	private String idCard;
	private String phone;
	private String address;
	private String yuanwang;
	private Integer cr;
	private Integer lr;
	private Integer et;
	private String ht;
	private String jg;//价格档次
	private Date gotime;
	private Date backtime;
	private Date time = new Date();

	public Date getGotime() {
		return gotime;
	}

	public String getJg() {
		return jg;
	}

	public void setJg(String jg) {
		this.jg = jg;
	}

	public void setGotime(Date gotime) {
		this.gotime = gotime;
	}

	public Date getBacktime() {
		return backtime;
	}

	public void setBacktime(Date backtime) {
		this.backtime = backtime;
	}

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

	public Integer getCr() {
		return cr;
	}

	public void setCr(Integer cr) {
		this.cr = cr;
	}

	public Integer getLr() {
		return lr;
	}

	public void setLr(Integer lr) {
		this.lr = lr;
	}

	public Integer getEt() {
		return et;
	}

	public void setEt(Integer et) {
		this.et = et;
	}

	public String getHt() {
		return ht;
	}

	public void setHt(String ht) {
		this.ht = ht;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
}