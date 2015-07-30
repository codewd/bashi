package com.mewin.entity;

import java.util.Date;

public class News {
	
	private long id;
	private String title;
	private String content;
	private String auther;
	private Integer click;
	private String ip;
	private String topImg;
	private String filePath;
	private String url;
	private String brief;
	private Integer flag;
	private String date;
	private Date time = new Date();
	
	private Type type;

	
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAuther() {
		return auther;
	}

	public void setAuther(String auther) {
		this.auther = auther;
	}

	public Integer getClick() {
		return click;
	}

	public void setClick(Integer click) {
		this.click = click;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getTopImg() {
		return topImg;
	}

	public void setTopImg(String topImg) {
		this.topImg = topImg;
	}

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public Integer getFlag() {
		return flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
}