package com.mewin.service.impl;

import org.springframework.stereotype.Service;
import com.mewin.base.BaseDaoImpl;
import com.mewin.entity.User;
import com.mewin.service.UserService;
@Service
public class UserServiceImpl extends BaseDaoImpl<User> implements UserService {

	public boolean login(User user) {
		return getSession().createQuery("From User u where u.account=? and u.psw=?")
		.setString(0, user.getAccount())
		.setString(1, user.getPsw()).uniqueResult() != null;
	}
}
