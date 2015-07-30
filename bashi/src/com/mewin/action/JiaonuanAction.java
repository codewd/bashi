package com.mewin.action;

import org.springframework.stereotype.Controller;

import com.mewin.base.BaseAction;
import com.mewin.util.HqlHelper;
import com.mewin.util.UploadFile;
import com.mewin.entity.Jiaonuan;

@Controller
public class JiaonuanAction extends BaseAction<Jiaonuan> {
	private static final long serialVersionUID = 1L;
	private Jiaonuan jiaonuan = new Jiaonuan();

	public String list() {
		new HqlHelper(Jiaonuan.class, "e").addOrder("e.id", false)
				.buildPageBeanForStruts2(pageNum, jiaonuanService);
		return "list";
	}
	public void f_add(){
		jiaonuanService.save(jiaonuan);
		write("1");
	}

	public String add() {
		jiaonuanService.save(jiaonuan);
		return "toList";
	}

	public String addUI() {
		return "addUI";
	}

	public String edit() {
		jiaonuanService.update(jiaonuan);
		return "toList";
	}

	public String editUI() {
		put("jiaonuan", jiaonuanService.getById(jiaonuan.getId()));
		return "addUI";
	}

	public String delete() {
		for (String i : ids.split(",")) {
			jiaonuanService.delete(Long.parseLong(i));
		}
		return "toList";
	}

	public String delete_ajax() {
		for (String i : ids.split(",")) {
			jiaonuanService.delete(Long.parseLong(i));
		}
		return null;
	}
	
	public String upLoadImg(){
		
		if(file!=null){

			String path = Thread.currentThread().getContextClassLoader()
					.getResource("").toString().replace("WEB-INF/classes/", "")
					+ "file/roll/";

			path = path.replaceAll("file:", "");

			UploadFile.upload(file, fileFileName, path, "jiaonuan");
			put("msg","上传成功！");
		}
		
		return "upLoadImg";
	}
	

	public Jiaonuan getModel() {
		return jiaonuan;
	}

	private String ids;

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
}
