package com.mewin.service;
import com.mewin.base.BaseDao;
import com.mewin.entity.User;
public interface UserService extends BaseDao<User> {

	boolean login(User user);

}
