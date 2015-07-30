package com.mewin.service;
import java.util.List;

import com.mewin.base.BaseDao;
import com.mewin.entity.Type;
public interface TypeService extends BaseDao<Type> {
	/**
	 * 获取所有的父类型
	 * @return
	 */
	public List<Type> getFather();
}
