package com.mewin.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mewin.base.BaseDaoImpl;
import com.mewin.entity.Type;
import com.mewin.service.TypeService;
@Service
public class TypeServiceImpl extends BaseDaoImpl<Type> implements TypeService {
	
	public List<Type> getFather(){
		return getSession().createQuery("FROM Type t where t.father=null").list();
	}
}
