package com.mewin.entity;

import java.util.Set;

public class Address {
	private Long id;
	private String name;
	private Address father;
	private Set<Address> childs;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Address getFather() {
		return father;
	}

	public void setFather(Address father) {
		this.father = father;
	}

	public Set<Address> getChilds() {
		return childs;
	}

	public void setChilds(Set<Address> childs) {
		this.childs = childs;
	}

	
}