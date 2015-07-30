package com.mewin.service;
import java.util.List;

import com.mewin.base.BaseDao;
import com.mewin.entity.News;
import com.mewin.entity.Type;
public interface NewsService extends BaseDao<News> {
	
	public List<News> getNewsByType(Type t);

	public List<News> getKuanghuan();

	public List<News> getTop3(Type type);
}
