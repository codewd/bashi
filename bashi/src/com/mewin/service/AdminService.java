package com.mewin.service;
import com.mewin.base.BaseDao;
import com.mewin.entity.Admin;
public interface AdminService extends BaseDao<Admin> {

	boolean login(Admin admin);

}
