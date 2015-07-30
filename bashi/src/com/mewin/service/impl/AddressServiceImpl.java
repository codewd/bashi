package com.mewin.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mewin.base.BaseDaoImpl;
import com.mewin.entity.Address;
import com.mewin.service.AddressService;
@Service
@SuppressWarnings("unchecked")
public class AddressServiceImpl extends BaseDaoImpl<Address> implements AddressService {

	
	public List<Address> getFather() {
		return getSession().createQuery("From Address a where a.father is NULL").list();
	}
	public List<Address> getChild() {
		return getSession().createQuery("From Address a where a.father is not NULL").list();
	}
	@Override
	public List<Address> getChild(Address a) {
		return getSession().createQuery("From Address a where a.father is ?").setEntity(0, a).list();
	}
}
