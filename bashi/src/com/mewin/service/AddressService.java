package com.mewin.service;

import java.util.List;

import com.mewin.base.BaseDao;
import com.mewin.entity.Address;
import com.mewin.entity.Type;

public interface AddressService extends BaseDao<Address> {
	
	public List<Address> getFather();
	public List<Address> getChild();
	public List<Address> getChild(Address a);
	

}
