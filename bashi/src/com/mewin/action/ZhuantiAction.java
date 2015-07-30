package com.mewin.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.ServletActionContext;
import org.json.JSONWriter;
import org.springframework.stereotype.Controller;

import com.mewin.base.BaseAction;
import com.mewin.entity.Zhuanti;
import com.mewin.util.HqlHelper;

@Controller
public class ZhuantiAction extends BaseAction<Zhuanti> {
	private static final long serialVersionUID = 1L;
	private Zhuanti zhuanti = new Zhuanti();

	public String list() {
		new HqlHelper(Zhuanti.class, "e").addOrder("e.id", false)
				.buildPageBeanForStruts2(pageNum, zhuantiService);
		return "list";
	}

	public void f_list() throws Exception {
		
//		Thread.sleep(2000);
		
		List<Zhuanti> list = new HqlHelper(Zhuanti.class, "e").addOrder("e.id",
				false).getList(pageNum, zhuantiService);
		JsonConfig cfg = new JsonConfig();
		cfg.setExcludes(new String[]{"handler","hibernateLazyInitializer"});
		cfg.setJsonPropertyFilter(new PropertyFilter() {
			public boolean apply(Object source, String name, Object value) {
				if (name.equals("subzts") || name.equals("jianjie")) {
					return true;
				} else {
					return false;
				}
			}
		});
		jsonWrite(list,cfg);
	}
	public void f_getOne(){
		
		jsonWrite(zhuantiService.getById(zhuanti.getId()));
	}
	public void test(){
		
		System.out.println("1:"+ServletActionContext.getRequest().getRealPath("file"));
		System.out.println("2:"+this.getClass().getClassLoader().getResource(""));
		
		String p = Thread.currentThread().getContextClassLoader().getResource("").toString();
		
		 p = p.replace("classes/", "");
		
		
		System.out.println("3:"+p);
	}

	public String add() {
		zhuanti.setHeadImg(upLoad());// 保存图片
		zhuantiService.save(zhuanti);
		return "toList";
	}

	public String addUI() {
		return "addUI";
	}

	public String edit() {
		zhuantiService.update(zhuanti);
		return "toList";
	}

	public String editUI() {
		put("zhuanti", zhuantiService.getById(zhuanti.getId()));
		return "addUI";
	}

	public String delete() {
		for (String i : ids.split(",")) {
			zhuantiService.delete(Long.parseLong(i));
		}
		return "toList";
	}

	public String delete_ajax() {
		for (String i : ids.split(",")) {
			zhuantiService.delete(Long.parseLong(i));
		}
		return null;
	}

	public Zhuanti getModel() {
		return zhuanti;
	}

	private String ids;

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

}
