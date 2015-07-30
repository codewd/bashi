package com.mewin.entity;

import java.util.HashSet;
import java.util.Set;

public class Type {
	private long id;
	private String title;
	private Type father;
	private Set<Type> childs = new HashSet<Type>();

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Set<Type> getChilds() {
		return childs;
	}

	public void setChilds(Set<Type> childs) {
		this.childs = childs;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Type getFather() {
		return father;
	}

	public void setFather(Type father) {
		this.father = father;
	}
	
	public String toString(){
		return title; 
	}

	
}