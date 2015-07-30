package com.mewin.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.springframework.stereotype.Controller;

import com.mewin.base.BaseAction;
import com.mewin.entity.News;
import com.mewin.entity.Type;
import com.mewin.util.HqlHelper;
import com.mewin.util.UploadFile;

@Controller
public class NewsAction extends BaseAction<News> {
	private static final long serialVersionUID = 1L;
	private News news = new News();

	public String list() {
		new HqlHelper(News.class, "e").addOrder("e.id", false)
				.buildPageBeanForStruts2(pageNum, newsService);
		return "list";
	}

	public void f_list() {
		String t = request.getParameter("a_type");

		Map<String, List<News>> newMap = new HashMap<String, List<News>>();
		List<List<News>> newss = new LinkedList<List<News>>();

		String[] type_ids = t.split(",");

		for (String t_id : type_ids) {
			Type type = typeService.getById(Long.parseLong(t_id));
			List<News> n_list = newsService.getTop3(type);
			newss.add(n_list);
			newMap.put("a" + t_id, n_list);
		}

		JsonConfig cfg = new JsonConfig();
		cfg.setJsonPropertyFilter(new PropertyFilter() {
			public boolean apply(Object source, String name, Object value) {
				if (name.equals("content") || name.equals("filePath")) {
					return true;
				} else {
					return false;
				}
			}
		});
		jsonWrite(newMap, cfg);
	}

	public void f_bake() {
		String t = request.getParameter("a_type");

		Map<String, List<News>> newMap = new HashMap<String, List<News>>();
		List<List<News>> newss = new LinkedList<List<News>>();

		String[] type_ids = t.split(",");

		for (String t_id : type_ids) {
			Type type = typeService.getById(Long.parseLong(t_id));
			// = newsService.getNewsByType(type);
			// System.out.println(n_list.size()+"xxxxx");
			List<News> n_list = new HqlHelper(News.class, "e")
					.addCondition("e.type=?", type).addOrder("e.id", false)
					.getList(pageNum, newsService);
			newss.add(n_list);
			newMap.put("a" + t_id, n_list);
		}

		JsonConfig cfg = new JsonConfig();
		cfg.setJsonPropertyFilter(new PropertyFilter() {
			public boolean apply(Object source, String name, Object value) {
				if (name.equals("content") || name.equals("filePath")) {
					return true;
				} else {
					return false;
				}
			}
		});
		jsonWrite(newMap, cfg);
	}

	public void kuanghuan() {
		String t = request.getParameter("a_type");
		if (t != null || !"".equals(t)) {
			Type type = typeService.getById(Long.parseLong(t));
			System.out.println(type.getId());
			JsonConfig cfg = new JsonConfig();
			cfg.setJsonPropertyFilter(new PropertyFilter() {
				public boolean apply(Object source, String name, Object value) {
					if (name.equals("content") || name.equals("filePath")) {
						return true;
					} else {
						return false;
					}
				}
			});
			jsonWrite(
					new HqlHelper(News.class, "e")
							.addCondition(true, "e.type=?", type)
							.addOrder("e.id", false)
							.getList(pageNum, newsService), cfg);
		}
	}

	public String add() {
		news.setTopImg(upLoad());
		newsService.save(news);
		return "toList";
	}

	public void ajax_getContent() {
		write(newsService.getById(news.getId()).getContent());
	}

	public String addUI() {

		put("types", typeService.getFather());

		return "addUI";
	}

	public String edit() {
		newsService.update(news);
		return "toList";
	}

	public String editUI() {
		System.out.println(newsService.getById(news.getId()).getType().getId());
		put("news", newsService.getById(news.getId()));
		return "editUI";
	}

	public String delete() {
		for (String i : ids.split(",")) {
			newsService.delete(Long.parseLong(i));
		}
		return "toList";
	}

	public String delete_ajax() {
		for (String i : ids.split(",")) {
			newsService.delete(Long.parseLong(i));
		}
		return null;
	}

	public News getModel() {
		return news;
	}

	private String ids;

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public void writeType() {
		List<Map<String, Object>> jsons = new LinkedList<Map<String, Object>>();
		List<Type> types = typeService.getFather();
		for (Type t : types) {
			List<Map<String, Object>> sonList = new LinkedList<Map<String, Object>>();
			Map m = new HashMap<String, Object>();
			Map son = new HashMap<String, Object>();

			for (Type t1 : t.getChilds()) {
				son.put("v", t1.getId() + "");
				son.put("n", t1.getTitle());
				sonList.add(son);
			}

			m.put("v", t.getId() + "");
			m.put("n", t.getTitle());
			if (son.size() > 0) {
				m.put("s", sonList);
			}
			jsons.add(m);
		}
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter print = null;
		try {
			print = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		print.write(JSONArray.fromObject(jsons).toString());
		print.flush();
		print.close();

	}

	public String uploadImg() {

		String name = request.getParameter("name");

		if (file == null) {
			return "uploadImg";
		}
		String path = Thread.currentThread().getContextClassLoader()
				.getResource("").toString().replace("WEB-INF/classes/", "")
				+ "file/roll/";

		path = path.replaceAll("file:", "");

		System.out.println("path:" + path);
		UploadFile.upload(file, fileFileName, path, name);
		return "uploadImg";
		// return "uploadImg";
	}
}
