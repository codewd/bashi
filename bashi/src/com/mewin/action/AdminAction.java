package com.mewin.action;

import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;

import org.springframework.stereotype.Controller;

import com.mewin.base.BaseAction;
import com.mewin.util.HqlHelper;
import com.mewin.util.VcodeFactory.SampleImageCaptchaService;
import com.mewin.entity.Admin;

@Controller
public class AdminAction extends BaseAction<Admin> {
	private static final long serialVersionUID = 1L;
	private Admin admin = new Admin();

	public String list() {
		new HqlHelper(Admin.class, "e").addOrder("e.id", false)
				.buildPageBeanForStruts2(pageNum, adminService);
		return "list";
	}

	public String add() {
		adminService.save(admin);
		return "toList";
	}

	public String addUI() {
		return "addUI";
	}

	public String edit() {
		adminService.update(admin);
		return "toList";
	}

	public String editUI() {
		put("admin", adminService.getById(admin.getId()));
		return "addUI";
	}

	public String delete() {
		for (String i : ids.split(",")) {
			adminService.delete(Long.parseLong(i));
		}
		return "toList";
	}

	public String delete_ajax() {
		for (String i : ids.split(",")) {
			adminService.delete(Long.parseLong(i));
		}
		return null;
	}

	public String loginUI(){
		return "adminLoginUI";
	}
	public String login(){
		
		boolean vCodeOK = SampleImageCaptchaService.getInstance().validateResponseForID(request.getSession(true).getId(), request.getParameter("vCode"));
		boolean loginOK = adminService.login(admin);
		put("error_admin",admin);
		if(loginOK){
			if(vCodeOK){
				sput("admin",adminService.getByFiled(admin.getAccount(),"account"));
				return "main";
			}else{
				put("msg","验证码错误");
				return "loginUI";
			}
		}else{
			put("msg","用户名或密码错误");
			return "loginUI";
		}
	}
	public String logout(){
		request.getSession().removeAttribute("admin");
		return "loginUI";
	}
	
	public void f_login(){
		if(adminService.login(admin)){
			if(vCodeOK()){
				sput("admin",adminService.getByFiled(admin.getAccount(),"account"));
				write("1");
			}else{
				write("验证码错误");
			}
		}else{
			write("用户名或密码错误");
		}
	}
	
	public void vCode() throws Exception{
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		BufferedImage bufferedImage = SampleImageCaptchaService.getInstance()
				.getImageChallengeForID(request.getSession(true).getId());
		ServletOutputStream servletOutputStream = response.getOutputStream();
		ImageIO.write(bufferedImage, "jpg", servletOutputStream);
		try {
			servletOutputStream.flush();
		} finally {
			servletOutputStream.close();
		}
	}
	
	private boolean vCodeOK(){
		return SampleImageCaptchaService.getInstance().validateResponseForID(request.getSession(true).getId(), request.getParameter("vCode"));
	}
	
	public Admin getModel() {
		return admin;
	}

	private String ids;

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
}
