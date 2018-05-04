package com.bilin.crm.web;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bilin.crm.common.UserUtils;
import com.bilin.crm.domain.User;
import com.bilin.crm.service.IUserService;

@Controller
public class LoginController {
	@Autowired
	IUserService loginService; 
	
	@Autowired 
	private  HttpServletRequest request;  
	
	public IUserService getLoginService() {
		return loginService;
	}

	public void setLoginService(IUserService loginService) {
		this.loginService = loginService;
	} 
	
	@RequestMapping(value = "/relogin")
	public String relogin(Model model){
		return "outlogin";    
	} 
	
	@RequestMapping(value = "/logout")
	public String logout(Model model){
		 request.getSession().removeAttribute("loginUserInfo");        //注销session中的id对象
		 request.getSession().removeAttribute("roleguid"); 
		 request.getSession().invalidate();   
		return "login";    
	}
	
	@RequestMapping(value = "/login")
	public String login(Model model){
		String userCode= request.getParameter("userCode");
		String password = request.getParameter("password"); 
		try{
			if(userCode==null&&password==null){
				return "login";                                   
			}else{
				User user = new User();
		    	request.getSession().setAttribute("loginUserInfo", user);       
		        UserUtils.setUser(user);   
				user = loginService.getUser(userCode,password);  
				if(user!=null){
					request.getSession().setAttribute("loginUserInfo", user); 
					return "main";       
				}else{
					model.addAttribute("loginInfo", "用户名或密码错误！");  
					model.addAttribute("userCode", userCode);
					model.addAttribute("password", password); 
					request.getSession().setAttribute("loginUserInfo", null);  
					UserUtils.setUser(null);   
				}
				return "/login"; 
			}
		}catch(Exception e){
			e.printStackTrace();
			model.addAttribute("loginInfo", "登录异常,请联系管理员!");
			model.addAttribute("userCode", ""); 
			model.addAttribute("password", "");  
			return "/login"; 
		}
	}
	
	@RequestMapping(value = "/checkUser")
	public String checkUser(Model model,String userCode,String password){
		User user= loginService.getUser(userCode,password); 
		request.getSession().setAttribute("loginUserInfo", user);     
		if(user!=null){
			return "main";      
		}else{
			model.addAttribute("loginInfo", "用户名和密码错误!");    
			model.addAttribute("userCode", userCode);  
			model.addAttribute("password", password);   
		}
		return "/login";
	}
}
