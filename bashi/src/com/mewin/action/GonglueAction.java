package com.mewin.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.mewin.base.BaseAction;
import com.mewin.entity.Address;
import com.mewin.entity.Gonglue;
import com.mewin.util.HqlHelper;
import com.mewin.util.UploadFile;

@Controller
public class GonglueAction extends BaseAction<Gonglue> {
	private static final long serialVersionUID = 1L;
	private Gonglue gonglue = new Gonglue();

	public String list() {
		new HqlHelper(Gonglue.class, "e").addOrder("e.id", false)
				.buildPageBeanForStruts2(pageNum, gonglueService);
		return "list";
	}

	// 按地区查看攻略
	public void f_getListByAddress() throws UnsupportedEncodingException {

		String address_name = request.getParameter("address_name");
		
		Address address = addressService.getById(Long.parseLong(address_name));
		
		List<Gonglue> list = gonglueService.getListByAddress(address);
		JsonConfig cfg = new JsonConfig();
		cfg.setExcludes(new String[]{"handler","hibernateLazyInitializer"});   
		cfg.setJsonPropertyFilter(new PropertyFilter() {
			public boolean apply(Object source, String name, Object value) {
				if (name.equals("content")||name.equals("address")) {
					return true;
				} else {
					return false;
				}
			}
		});
		jsonWrite(list, cfg);
	}

	public void f_list() {

		List<Gonglue> list = new HqlHelper(Gonglue.class, "e").addOrder("e.id",
				false).getList(pageNum, gonglueService);

		JsonConfig cfg = new JsonConfig();
		cfg.setJsonPropertyFilter(new PropertyFilter() {
			public boolean apply(Object source, String name, Object value) {
				if (name.equals("content" )|| name.equals("address")) {
					return true;
				} else {
					return false;
				}
			}
		});
		// net.sf.json.JSONException:
		// java.lang.reflect.InvocationTargetException异常
		// cfg.setExcludes(new String[] { "handler", "hibernateLazyInitializer"
		// });
		jsonWrite(list, cfg);
	}

	public String add() {

		String a1 = request.getParameter("address1");
		String a2 = request.getParameter("address2");

		System.out.println(a1 + a2 + "---------");
		
		gonglue.setAddress(addressService.getById(Long.parseLong(a2)));

		// gonglue.setHeadImg(UploadFile.upload(file, fileFileName,
		// ServletActionContext.getRequest().getRealPath("file")));

		gonglue.setHeadImg(upLoad());

		gonglueService.save(gonglue);
		

		// System.out.println(ServletActionContext.getRequest().getRealPath("file"));

		return "toList";
	}

	public String addUI() {
		return "addUI";
	}

	public String edit() {
		gonglueService.update(gonglue);
		return "toList";
	}

	public String editUI() {
		put("gonglue", gonglueService.getById(gonglue.getId()));
		return "addUI";
	}

	public String delete() {
		for (String i : ids.split(",")) {
			gonglueService.delete(Long.parseLong(i));
		}
		return "toList";
	}

	public String delete_ajax() {
		for (String i : ids.split(",")) {
			gonglueService.delete(Long.parseLong(i));
		}
		return null;
	}

	public Gonglue getModel() {
		return gonglue;
	}

	private String ids;

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
}
