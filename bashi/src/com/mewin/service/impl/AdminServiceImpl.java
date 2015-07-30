package com.mewin.service.impl;

import org.springframework.stereotype.Service;

import com.mewin.base.BaseDaoImpl;
import com.mewin.entity.Admin;
import com.mewin.entity.User;
import com.mewin.service.AdminService;
@Service
public class AdminServiceImpl extends BaseDaoImpl<Admin> implements AdminService {
	public boolean login(Admin admin) {
		return getSession().createQuery("From Admin a where a.account=? and a.psw=?")
		.setString(0, admin.getAccount())
		.setString(1, admin.getPsw()).uniqueResult() != null;
	}
}
