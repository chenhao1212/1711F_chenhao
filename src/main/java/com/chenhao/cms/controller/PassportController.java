package com.chenhao.cms.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chenhao.cms.entity.User;
import com.chenhao.cms.service.UserService;
import com.chenhao.cms.util.CmsException;
import com.chenhao.cms.util.Result;
/**
 * 
    * @ClassName: PassportController
    * @Description:登录注册
    * @author 
    * @date 2020年3月11日
    *
 */
@Controller
@RequestMapping("passport")
public class PassportController {
	
	@Autowired
	private UserService userservice;
	
	@GetMapping("reg")
	public String reg() {
		return "passport/reg";
	}
	
	@ResponseBody
	@RequestMapping("insert")
	public Result<User> insert(Model m,User user) {
		Result<User> result=new Result<User>();
		try {
			if(userservice.insertUser(user)>0) {
				result.setCode(200);
				result.setMsg("注册成功");
			}
		} catch (CmsException e) {
			e.printStackTrace();//打印异常消息在控制台
			result.setCode(300);
			result.setMsg("注册失败-"+e.getMessage());
			
		}catch (Exception e) {
			e.printStackTrace();//打印异常消息在控制台
			result.setCode(500);
			result.setMsg("注册失败,不可预知异常-"+e.getMessage());
		}
		return result;
	}
	
	@PostMapping("reg")
	@ResponseBody
	public boolean reg(User user) {
		if(user.getCreated()==null) {
			user.setCreated(new Date());
		}
		return userservice.insertUser(user)>0;
	}
	
	@GetMapping("login")
	public String login() {
		return "passport/login";
	}
	/**
	 * 
	 * @Title: login 
	 * @Description: 去登录-管理员用户
	 * @return
	 * @return: String
	 */
	
	@PostMapping("login")
	@ResponseBody
	public Result<User> adminlogin(User user,Model m,HttpSession session) {
		Result<User> result=new Result<User>();
		try {
			User u = userservice.login(user);
			if(null!=u) {
				result.setCode(200);
				result.setMsg("登录成功");
				if(u.getRole()==0) {
					session.setAttribute("user", u);
				}else {
					session.setAttribute("admin", u);
				}
			}
			
		} catch (CmsException e) {
			e.printStackTrace();//打印异常消息在控制台
			result.setCode(300);
			result.setMsg("登录失败-"+e.getMessage());
			
		}catch (Exception e) {
			e.printStackTrace();//打印异常消息在控制台
			result.setCode(500);
			result.setMsg("登录失败,不可预知异常-"+e.getMessage());
		}
		return result;
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		//清除session里面所有东西
		session.invalidate();
		
		return "redirect:/";//重定向回到首页
	}
	/**
	 * 
	    * @Title: checkName
	    * @Description:检查用户是否存在
	    * @param @param username
	    * @param @return    参数
	    * @return boolean    返回类型
	    * @throws
	 */
	@ResponseBody
	@RequestMapping("checkName")
	public boolean checkName(String username) {
		
		return userservice.queryUserByUsername(username)==null;
	}
	/**
	 * 普通用户登录
	 */
	@GetMapping("admin/login")
	public String adminlogin() {
		return "passport/adminlogin";
	}
}	
