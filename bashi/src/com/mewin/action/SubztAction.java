package com.mewin.action;

import java.util.List;

import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.springframework.stereotype.Controller;

import com.mewin.base.BaseAction;
import com.mewin.entity.Address;
import com.mewin.entity.Subzt;
import com.mewin.entity.Zhuanti;
import com.mewin.util.HqlHelper;

@Controller
public class SubztAction extends BaseAction<Subzt> {
	private static final long serialVersionUID = 1L;
	private Subzt subzt = new Subzt();

	public String list() {
		new HqlHelper(Subzt.class, "e").addOrder("e.id", false)
				.buildPageBeanForStruts2(pageNum, subztService);
		return "list";
	}
	public void f_list() {
		Long zhuanti_id = Long.parseLong(request.getParameter("zhuanti_id"));
		Zhuanti z = zhuantiService.getById(zhuanti_id);
		
		JsonConfig cfg = new JsonConfig();
		cfg.setExcludes(new String[]{"handler","hibernateLazyInitializer"});
		cfg.setJsonPropertyFilter(new PropertyFilter() {
			public boolean apply(Object source, String name, Object value) {
				if (name.equals("zhuanti") || name.equals("father_address")|| name.equals("son_address")) {
					return true;
				} else {
					return false;
				}
			}
		});
		
		jsonWrite(new HqlHelper(Subzt.class, "e")
			.addCondition(true,"e.zhuanti=?",z)
			.addOrder("e.id", false)
			.getList(pageNum, subztService),cfg);
	}

	public String add() {
		
		String a1 = request.getParameter("address1");
		String a2 = request.getParameter("address2");
		if(file!=null){
			subzt.setImg(upLoad());
		}

		Address father = addressService.getById(Long.parseLong(a1));
		
		subzt.setFather_address(father);
		
		if(a2!=null ||!"".equals(a2)){
			Address son = addressService.getById(Long.parseLong(a2));
			subzt.setSon_address(son);
		}
		
		subztService.save(subzt);
		return "toList";
	}

	public String addUI() {
		List<Zhuanti> zhuantis = zhuantiService.findAll();
		put("zhuantis",zhuantis);
		return "addUI";
	}

	public String edit() {
		
		subztService.update(subzt);
		return "toList";
	}

	public String editUI() {
		List<Zhuanti> zhuantis = zhuantiService.findAll();
		put("zhuantis",zhuantis);
		put("subzt", subztService.getById(subzt.getId()));
		return "addUI";
	}

	public String delete() {
		for (String i : ids.split(",")) {
			subztService.delete(Long.parseLong(i));
		}
		return "toList";
	}

	public String delete_ajax() {
		for (String i : ids.split(",")) {
			subztService.delete(Long.parseLong(i));
		}
		return null;
	}

	public Subzt getModel() {
		return subzt;
	}

	private String ids;

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
}
