package com.mewin.base;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.mewin.entity.User;
import com.mewin.service.AddressService;
import com.mewin.service.AdminService;
import com.mewin.service.GonglueService;
import com.mewin.service.JiaonuanService;
import com.mewin.service.NewsService;
import com.mewin.service.OrderService;
import com.mewin.service.SubztService;
import com.mewin.service.TypeService;
import com.mewin.service.UserService;
import com.mewin.service.ZhuantiService;
import com.mewin.util.UploadFile;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class BaseAction<T> extends ActionSupport implements ModelDriven<T>,
		ServletRequestAware, ServletResponseAware {

	private static final long serialVersionUID = 1L;

	protected HttpServletResponse response;
	protected HttpServletRequest request;
	protected String checkbox;
	protected String leftId = "l1";
	protected File file;
	protected String fileFileName;
	protected long entityId;

	// ModelDriven支持
	protected T model;

	public BaseAction() {
		try {
			// 通过反射获取model的真实类型
			ParameterizedType pt = (ParameterizedType) this.getClass()
					.getGenericSuperclass();
			Class<T> clazz = (Class<T>) pt.getActualTypeArguments()[0];
			// 通过反射创建model的实例
			model = clazz.newInstance();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		if (request != null)
			ActionContext.getContext().put("leftId",
					request.getAttribute("leftId"));
	}

	public T getModel() {
		return model;
	}

	@Resource
	protected GonglueService gonglueService;
	@Resource
	protected JiaonuanService jiaonuanService;
	@Resource
	protected OrderService orderService;
	@Resource
	protected UserService userService;
	@Resource
	protected NewsService newsService;
	@Resource
	protected TypeService typeService;
	@Resource
	protected AddressService addressService;
	@Resource
	protected ZhuantiService zhuantiService;
	@Resource
	protected AdminService adminService;
	@Resource
	protected SubztService subztService;
	
	////////////////////////////////////
	public void put(String key, Object value) {
		ActionContext.getContext().put(key, value);
	}

	public void sput(String key, Object value) {
		ActionContext.getContext().getSession().put(key, value);
	}
	public T sget(String key) {
		return (T)ActionContext.getContext().getSession().get(key);
	}

	public void push(Object value) {
		ActionContext.getContext().getValueStack().push(value);
	}

	public Object get(String key) {
		return ActionContext.getContext().getSession().get(key);
	}

	public String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}

	public User currentUser() {
		return (User) get("user");
	}

	public void rput(String key, Object o) {
		ServletActionContext.getRequest().setAttribute(key, o);
	}
	
	public String upLoad(){
		if(file ==null){
			return null;
		}
		
		String path = Thread.currentThread().getContextClassLoader().getResource("").toString().replace("WEB-INF/classes/","")+"file/";
		
		path = path.replaceAll("file:", "");
		
		return UploadFile.upload(file,fileFileName,path);
	}
	public void jsonWrite(List<T> list){
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter print = null;
		JsonConfig cfg = new JsonConfig();
		cfg.setExcludes(new String[]{"handler","hibernateLazyInitializer"});
		try {
			print = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		print.write(JSONArray.fromObject(list,cfg).toString());
		print.flush();
		print.close();
	}
	public void jsonWrite(Object list,JsonConfig config){
		//response.setHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter print = null;
		try {
			print = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		print.write(JSONArray.fromObject(list,config).toString());
		print.flush();
		print.close();
	}
	public void jsonWrite(Object[] list){
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter print = null;
		try {
			print = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		print.write(JSONArray.fromObject(list).toString());
		print.flush();
		print.close();
	}
	public void jsonWrite(String content){
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter print = null;
		try {
			print = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		print.write(JSONArray.fromObject(content).toString());
		print.flush();
		print.close();
	}
	public void jsonWrite(T t){
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter print = null;
		
		JsonConfig cfg = new JsonConfig();
		cfg.setExcludes(new String[]{"handler","hibernateLazyInitializer"});
		try {
			print = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		print.write(JSONArray.fromObject(t,cfg).toString());
		print.flush();
		print.close();
	}
	
	public void write(String msg){
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter print = null;
		try {
			print = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		print.write(msg);
		print.flush();
		print.close();
	}
	
	/////////////////////////////

	public void sremove(String key) {
		ActionContext.getContext().getSession().remove(key);
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response = response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}

	// ============== 分页用的参数 =============

	protected int pageNum = 1; // 当前页
	protected int pageSize = 10; // 每页显示多少条记录

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getCheckbox() {
		return checkbox;
	}

	public void setCheckbox(String checkbox) {
		this.checkbox = checkbox;
	}

	public String getLeftId() {
		return leftId;
	}

	public void setLeftId(String leftId) {
		this.leftId = leftId;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public long getEntityId() {
		return entityId;
	}

	public void setEntityId(long entityId) {
		this.entityId = entityId;
	}

}
