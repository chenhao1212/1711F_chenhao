package com.chenhao.cms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chenhao.cms.entity.Article;
import com.chenhao.cms.entity.User;
import com.chenhao.cms.service.ArticleService;
import com.chenhao.cms.service.UserService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private ArticleService service;
	
	@Autowired
	private UserService userSerice;
	
	/**
	 * 进入管理员页面
	 */
	@RequestMapping(value = {"","/","index"})
	public String index() {
		return "admin/index";
	}
	/**
	 * 
	    * @Title: ReviewArticles
	    * @Description:审核文章
	    * @param @return    参数
	    * @return String    返回类型
	    * @throws
	 */
	@RequestMapping("ReviewArticles")
	public String ReviewArticles() {
		return "admin/articles";
	}
	
	
	
	@RequestMapping("queryAllArticle")
	public String queryAllArticle(Model m,Article article,@RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "8")Integer pageSize) {
		PageInfo<Article> info = service.selects(article,page,pageSize);
		m.addAttribute("info", info);
		m.addAttribute("article", article);
		return "admin/articles";
	}
	
	/**
	 * 
	    * @Title: updateHot
	    * @Description:修改文章状态
	    * @param @param article
	    * @param @return    参数
	    * @return boolean    返回类型
	    * @throws
	 */
	@ResponseBody
	@RequestMapping("updateHotAndStatus")
	public boolean updateHot(Article article) {
		return service.updateHot(article)>0;
	}
	
	
	/**
	 * 
	    * @Title: queryArticleById
	    * @Description:查询一篇文章
	    * @param @param id
	    * @param @return    参数
	    * @return Article    返回类型
	    * @throws
	 */
	@ResponseBody
	@RequestMapping("queryArticleById")
	public Article queryArticleById(Integer id) {
		Article article=service.queryArticleById(id);
		
		return article;
		
	}
	/**
	 * 
	    * @Title: queryAllUser
	    * @Description:用户列表
	    * @param @param m
	    * @param @param user
	    * @param @param page
	    * @param @param pageSize
	    * @param @return    参数
	    * @return String    返回类型
	    * @throws
	 */
	
	@RequestMapping("queryAllUser")
	public String queryAllUser(Model m,User user,@RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "8")Integer pageSize) {
		PageInfo<User> info = userSerice.queryAllUser(user, page, pageSize);
		m.addAttribute("info", info);
		m.addAttribute("user", user);
		return "admin/users";
	}
	/**
	 * 
	    * @Title: updateUserStatus
	    * @Description:改变用户状态
	    * @param @return    参数
	    * @return String    返回类型
	    * @throws
	 */
	@ResponseBody
	@RequestMapping("updateUserStatus")
	public boolean updateUserStatus(User user) {
		return userSerice.updateUserStatus(user)>0;
	}
}
	

