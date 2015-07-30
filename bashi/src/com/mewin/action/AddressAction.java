package com.mewin.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;

import com.mewin.base.BaseAction;
import com.mewin.entity.Address;
import com.mewin.util.HqlHelper;

@Controller
public class AddressAction extends BaseAction<Address> {
	private static final long serialVersionUID = 1L;
	private Address address = new Address();

	public String list() {
		new HqlHelper(Address.class, "a")
				.addCondition(true, "a.father is not NULL")
				.addOrder("a.id", false)
				.buildPageBeanForStruts2(pageNum, addressService);
		return "list";
	}
	public void f_new_list(){
//		"北京|密云|怀柔&1,2,3#山东|青岛|济南&2,4,9"
		Map<String,String[]> fs  = new HashMap<String, String[]>();
		String rs = "";
		List<Address> father = addressService.getFather();
		for(Address a : father){
			rs += a.getName()+"|";
			List<Address> sons = addressService.getChild(a);
			String ids = "";
			ids += a.getId()+",";
			for(Address a1 : sons){
				rs += a1.getName()+"|";
				ids += a1.getId()+",";
			}
			
			rs+="&";
			rs += ids;
			rs += "#";
		}
		write(rs);
	}
	public String list_father() {
		new HqlHelper(Address.class, "a")
		.addCondition(true, "a.father is NULL")
		.addOrder("a.id", false)
		.buildPageBeanForStruts2(pageNum, addressService);
		return "list";
	}

	public String add() {
		Long father_id = Long.parseLong(request.getParameter("father_id"));
		if(father_id != -1){
			address.setFather(addressService.getById(father_id));
		}else{
			address.setFather(null);
		}
		addressService.save(address);
		return "toList";
	}
	
	public void f_getId(){
		Address a = addressService.getByFiled(request.getParameter("name"), "name");
		write(a.getId()+"");
	}
	
	public void f_getListByAddress(){
		
		
		
		
		System.out.println("lllsss");
	}

	public String addUI() {
		put("addresses",addressService.getFather());
		return "addUI";
	}

	public String edit() {
		Long father_id = Long.parseLong(request.getParameter("father_id"));
		if(father_id !=    -1){
			address.setFather(addressService.getById(father_id));
		}
		addressService.update(address);
		return "toList";
	}

	public String editUI() {
		put("addresses",addressService.getFather());
		put("address", addressService.getById(address.getId()));
		return "addUI";
	}
	
	public void f_list(){
		List<Address> list = addressService.getFather();
		
		List<String[]> list2 = new LinkedList<String[]>(); 
		
		//循环父亲
		
		for(Address f : list){
			String f_name = f.getName();
			
			String s_name = "";
			Set<Address> s = f.getChilds();
			for(Address a : s){
				s_name += a.getName()+",";
			}
			
			String[] strs = new String[]{f_name,s_name};
			list2.add(strs);
			
		}
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter print = null;
		try {
			print = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		print.write(JSONArray.fromObject(list2).toString());
		print.flush();
		print.close();
	}
	
	public void jsonAddress(){
		List<Address> list = addressService.getFather();
		List <Map<String,Object>> json = new LinkedList<Map<String,Object>>();
		
		for(Address a : list){
			Set<Address> c = a.getChilds();
			Map<String,Object> m = new HashMap<String, Object>();
			
			// v n s
			
			m.put("v",a.getId());
			m.put("n",a.getName());
			
			List <Map<String,Object>> json1 = new LinkedList<Map<String,Object>>();
			for(Address s: c){
				Map<String,Object> son = new HashMap<String, Object>();
				son.put("v",s.getId());
				son.put("n",s.getName());
				json1.add(son);
			}
			m.put("s",json1);
			json.add(m);
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
		print.write(JSONArray.fromObject(json).toString());
		print.flush();
		print.close();
		
	}

	public String delete() {
		for (String i : ids.split(",")) {
			addressService.delete(Long.parseLong(i));
		}
		return "toList";
	}

	public String delete_ajax() {
		for (String i : ids.split(",")) {
			addressService.delete(Long.parseLong(i));
		}
		return null;
	}

	public Address getModel() {
		return address;
	}

	private String ids;

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
}
