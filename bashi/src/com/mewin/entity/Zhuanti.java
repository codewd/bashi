package com.mewin.entity;

import java.util.Set;

public class Zhuanti {
	private Long id;
	private String zbt;
	private String fbt;
	private String headImg;
	private String dzzz;
	private String jianjie;
	private String luxian;
	private Set<Subzt> subzts;
	
	

	public Set<Subzt> getSubzts() {
		return subzts;
	}

	public void setSubzts(Set<Subzt> subzts) {
		this.subzts = subzts;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getZbt() {
		return zbt;
	}

	public void setZbt(String zbt) {
		this.zbt = zbt;
	}

	public String getFbt() {
		return fbt;
	}

	public void setFbt(String fbt) {
		this.fbt = fbt;
	}

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}

	public String getDzzz() {
		return dzzz;
	}

	public void setDzzz(String dzzz) {
		this.dzzz = dzzz;
	}

	public String getJianjie() {
		return jianjie;
	}

	public void setJianjie(String jianjie) {
		this.jianjie = jianjie;
	}

	public String getLuxian() {
		return luxian;
	}

	public void setLuxian(String luxian) {
		this.luxian = luxian;
	}
}