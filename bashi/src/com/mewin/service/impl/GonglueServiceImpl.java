package com.mewin.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mewin.base.BaseDaoImpl;
import com.mewin.entity.Address;
import com.mewin.entity.Gonglue;
import com.mewin.service.GonglueService;
@Service
public class GonglueServiceImpl extends BaseDaoImpl<Gonglue> implements GonglueService {

	public List<Gonglue> getListByAddress(Address address) {
		return getSession().createQuery("from Gonglue g where g.address=?")
				.setEntity(0,address)
				.list();
	}
}
