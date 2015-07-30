package com.mewin.action;

import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;

import org.springframework.stereotype.Controller;

import com.mewin.base.BaseAction;
import com.mewin.entity.User;
import com.mewin.util.HqlHelper;
import com.mewin.util.VcodeFactory.SampleImageCaptchaService;

@Controller
public class UserAction extends BaseAction<User> {
	private static final long serialVersionUID = 1L;
	private User user = new User();

	public String list() {
		new HqlHelper(User.class, "e").addOrder("e.id", false)
				.buildPageBeanForStruts2(pageNum, userService);
		return "list";
	}

	public String add() {
		userService.save(user);
		return "toList";
	}

	public String addUI() {
		return "addUI";
	}

	public String edit() {
		userService.update(user);
		return "toList";
	}

	public String editUI() {
		put("user", userService.getById(user.getId()));
		return "addUI";
	}
	
	public String loginUI(){
		return "loginUI";
	}
	public String login(){
		System.out.println("okkk");
		
		boolean vCodeOK = SampleImageCaptchaService.getInstance().validateResponseForID(request.getSession(true).getId(), request.getParameter("vCode"));
		boolean loginOK = userService.login(user);
		put("error_user",user);
		if(loginOK){
			if(vCodeOK){
				sput("user",userService.getByFiled(user.getAccount(),"account"));
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
		request.getSession().removeAttribute("user");
		request.getSession().removeAttribute("admin");
		return "loginUI";
	}
	
	public void f_login(){
		if(userService.login(user)){
			if(vCodeOK()){
				System.out.println(request.getParameter("vCode"));
				sput("user",userService.getByFiled(user.getAccount(),"account"));
				write("1");
			}else{
				write("验证码错误");
			}
		}else{
			write("用户名或密码错误");
		}
	}
	
	public void f_regist(){
		
		if(vCodeOK()){
			user.setType(1);
			userService.save((user));
			write("1");
		}else{
			write("-1");
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

	public String delete() {
		for (String i : ids.split(",")) {
			userService.delete(Long.parseLong(i));
		}
		return "toList";
	}

	public String delete_ajax() {
		for (String i : ids.split(",")) {
			userService.delete(Long.parseLong(i));
		}
		return null;
	}
	
	private boolean vCodeOK(){
		return SampleImageCaptchaService.getInstance().validateResponseForID(request.getSession(true).getId(), request.getParameter("vCode"));
	}
	
	public User getModel() {
		return user;
	}

	private String ids;

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
}
