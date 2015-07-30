package com.mewin.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mewin.base.BaseDaoImpl;
import com.mewin.entity.News;
import com.mewin.entity.Type;
import com.mewin.service.NewsService;
@Service
public class NewsServiceImpl extends BaseDaoImpl<News> implements NewsService {

	public List<News> getNewsByType(Type t) {
		return getSession().createQuery("from News n where n.type=? order by n.id desc")
				.setEntity(0, t)
				.list();
	}

	public List<News> getKuanghuan() {
		return getSession().createQuery("from News n where n.Type.id=1 order by n.id desc")
				.setMaxResults(3).list();
	}

	public List<News> getTop3(Type type) {
		
		return getSession().createQuery("from News n where n.type=? order by n.id desc")
				.setMaxResults(3)
				.setEntity(0,type)
				.list();
	}
}
