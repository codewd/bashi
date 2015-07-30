package com.mewin.action;

import org.springframework.stereotype.Controller;
import com.mewin.base.BaseAction;
import com.mewin.util.HqlHelper;
import com.mewin.entity.Type;

@Controller
public class TypeAction extends BaseAction<Type> {
	private static final long serialVersionUID = 1L;
	private Type type = new Type();

	public String list() {
		new HqlHelper(Type.class, "e").addOrder("e.id", false)
				.addCondition(true, "e.father=null")
				.buildPageBeanForStruts2(pageNum, typeService);
		return "list";
	}

	public String add() {
		typeService.save(type);
		return "toList";
	}
	public String addFather() {
		type.setFather(null);
		typeService.save(type);
		return "toList";
	}

	public String addUI() {
		return "addUI";
	}
	public String addFatherUI() {
		return "addFatherUI";
	}
	public String addSonUI() {
		System.out.println(request.getParameter("fatherId"));
		put("fatherId",request.getParameter("fatherId"));
		return "addSonUI";
	}

	public String edit() {
		String title = type.getTitle();
		type= typeService.getById(type.getId());
		type.setTitle(title);
		typeService.update(type);
		return "toList";
	}
	
	public String editFather(){
		typeService.update(type);
		return "toList";
		
	}

	public String editUI() {
		put("fatherId",request.getParameter("fatherId"));
		put("type", typeService.getById(type.getId()));
		return "addUI";
	}
	public String editFatherUI() {
		put("type", typeService.getById(type.getId()));
		return "addUI";
	}

	public String delete() {
		for (String i : ids.split(",")) {
			typeService.delete(Long.parseLong(i));
		}
		return "toList";
	}

	public String delete_ajax() {
		for (String i : ids.split(",")) {
			typeService.delete(Long.parseLong(i));
		}
		return null;
	}

	public Type getModel() {
		return type;
	}

	private String ids;

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
}
