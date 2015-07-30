package com.mewin.entity;

import java.util.Date;

public class Subzt {
	private Long id;
	private String title;
	private String brief;
	private String content;
	private String url;
	private String img;
	private Zhuanti zhuanti;
	private Address father_address;
	private Address son_address;
	private Date time;

	
	
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Zhuanti getZhuanti() {
		return zhuanti;
	}

	public void setZhuanti(Zhuanti zhuanti) {
		this.zhuanti = zhuanti;
	}

	public Address getFather_address() {
		return father_address;
	}

	public void setFather_address(Address father_address) {
		this.father_address = father_address;
	}

	public Address getSon_address() {
		return son_address;
	}

	public void setSon_address(Address son_address) {
		this.son_address = son_address;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
}