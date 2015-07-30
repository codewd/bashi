package com.mewin.base;

import java.lang.reflect.ParameterizedType;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import com.mewin.cfg.Configuration;
import com.mewin.util.HqlHelper;
import com.mewin.entity.PageBean;
// @Transactional注解可以被继承，即对子类也有效
@Transactional
@SuppressWarnings("unchecked")
public abstract class BaseDaoImpl<T> implements BaseDao<T> {


	@Resource
	private SessionFactory sessionFactory;
	protected Class<T> clazz; // 这是一个问题！

	public BaseDaoImpl() {
		// 通过反射得到T的真实类型
		ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
		this.clazz = (Class) pt.getActualTypeArguments()[0];
	}

	public void save(T entity) {
		getSession().save(entity);
	}

	public void update(T entity) {
		getSession().update(entity);
	}

	public void delete(Long id) {
		Object obj = getSession().get(clazz, id);
		getSession().delete(obj);
	}

	public T getById(Long id) {
		if (id == null) {
			return null;
		}
		return (T) getSession().get(clazz, id);
	}
	
	public T getByFiled(Object param, String filed) {
		if(param == null || filed == null){
			return null;
		}
		
		return (T)getSession().createQuery(//
				"FROM " + clazz.getSimpleName() + " WHERE "+filed+" =:param")//
				.setParameter("param", param)//
				.uniqueResult();
	}

	public List<T> getByIds(Long[] ids) {
		if (ids == null || ids.length == 0) {
			return Collections.EMPTY_LIST;
		}

		return getSession().createQuery(//
				"FROM " + clazz.getSimpleName() + " WHERE id IN(:ids)")//
				.setParameterList("ids", ids)//
				.list();
	}
	public List<T> getByIds(Object[] ids) {
		if (ids == null || ids.length == 0) {
			return Collections.EMPTY_LIST;
		}
		
		return getSession().createQuery(//
				"FROM " + clazz.getSimpleName() + " WHERE id IN(:ids)")//
				.setParameterList("ids", ids)//
				.list();
	}
	public List<T> getByFileds(Object[] ids,String filed) {
		if (ids == null || ids.length == 0) {
			return Collections.EMPTY_LIST;
		}
		
		return getSession().createQuery(//
				"FROM " + clazz.getSimpleName() + " WHERE "+filed+" IN(:ids) order by id desc")//
				.setParameterList("ids", ids)//
				.list();
	}
	
	public List<T> getByFileds(Object[] params,String[] filed) {
		if (params == null || params.length == 0) {
			return Collections.EMPTY_LIST;
		}
		
		String sql = " where 1=1 ";
		
		for(int i=0;i<filed.length;i++){
			sql += " and "+filed[i]+"='"+params[i]+"'";
		}
		
		return getSession().createQuery(//
				"FROM " + clazz.getSimpleName() + sql)//
				.list();
	}

	public List<T> findAll() {
		return getSession().createQuery(//
				"FROM " + clazz.getSimpleName() + " o order by o.id desc")//
				.list();
	}

	// 公共的查询分页信息的方法
	public PageBean getPageBean(int pageNum, String queryListHQL, Object[] parameters) {
		System.out.println("--------------> BaseDaoImpl.getPageBean()");
		int pageSize = Configuration.getPageSize();

		// 查询本页的数据列表
		Query listQuery = getSession().createQuery(queryListHQL);
		if (parameters != null && parameters.length > 0) { // 设置参数
			for (int i = 0; i < parameters.length; i++) {
				listQuery.setParameter(i, parameters[i]);
			}
		}
		listQuery.setFirstResult((pageNum - 1) * pageSize);
		listQuery.setMaxResults(pageSize);
		List list = listQuery.list(); // 执行查询

		// 查询总记录数
		Query countQuery = getSession().createQuery("SELECT COUNT(*) " + queryListHQL);
		if (parameters != null && parameters.length > 0) { // 设置参数
			for (int i = 0; i < parameters.length; i++) {
				countQuery.setParameter(i, parameters[i]);
			}
		}
		Long count = (Long) countQuery.uniqueResult(); // 执行查询

		return new PageBean(pageNum, pageSize, list, count.intValue());
	}

	public PageBean getPageBean(int pageNum, HqlHelper hqlHelper) {
		int pageSize = Configuration.getPageSize();
		List<Object> parameters = hqlHelper.getParameters();

		// 查询本页的数据列表
		Query listQuery = getSession().createQuery(hqlHelper.getQueryListHql());
		if (parameters != null && parameters.size() > 0) { // 设置参数
			for (int i = 0; i < parameters.size(); i++) {
				listQuery.setParameter(i, parameters.get(i));
			}
		}
		listQuery.setFirstResult((pageNum - 1) * pageSize);
		listQuery.setMaxResults(pageSize);
		List list = listQuery.list(); // 执行查询

		// 查询总记录数
		Query countQuery = getSession().createQuery(hqlHelper.getQueryCountHql());
		if (parameters != null && parameters.size() > 0) { // 设置参数
			for (int i = 0; i < parameters.size(); i++) {
				countQuery.setParameter(i, parameters.get(i));
			}
		}
		Long count = (Long) countQuery.uniqueResult(); // 执行查询

		return new PageBean(pageNum, pageSize, list, count.intValue());
	}
	
	public List getBySQL(String sql){
		return getSession().createSQLQuery(sql).list();
	}

	/**
	 * 获取当前可用的Session
	 * 
	 * @return
	 */
	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}

}
