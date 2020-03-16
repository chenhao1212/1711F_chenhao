package com.chenhao.cms.controller;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chenhao.cms.entity.Article;
import com.chenhao.cms.entity.Collect;
import com.chenhao.cms.entity.User;
import com.chenhao.cms.service.ArticleService;
import com.chenhao.cms.service.CollectService;
import com.github.pagehelper.PageInfo;

/**
 * 
    * @ClassName: MyController
    * @Description: 个人中心controller
    * @author 陈浩
    * @date 2020年3月4日
    *
 */
@RequestMapping("my")
@Controller
public class MyController {
	@Autowired
	private CollectService collectService;
	/**
	 * 
	    * @Title: index
	    * @Description: TODO进入个人中心首页
	    * @param @return    参数
	    * @return String    返回类型
	    * @throws
	 */
	@RequestMapping(value= {" ","/","index"})
	public String index() {
		return "my/index";
	}
	/**
	 * 
	    * @Title: articles
	    * @Description:文章显示
	    * @param @return    参数
	    * @return String    返回类型
	    * @throws
	 */
	@RequestMapping("articles")
	public String articles() {
		return "my/articles";
	}
	
	
	@RequestMapping("publish")
	public String publish() {
		return "my/publish";
	}
	
	
	@Autowired
	private ArticleService service;
	
	/**
	 * 
	    * @Title: publish
	    * @Description:发布文章，添加文章
	    * @param @param File
	    * @param @param article
	    * @param @return    参数
	    * @return boolean    返回类型
	    * @throws
	 */
	@ResponseBody
	@RequestMapping("addArticle")
	public boolean AddArtile(@Param("file")MultipartFile file,Article article,HttpSession session) {
		System.out.println(article.toString());
		if(null!=file && !file.isEmpty()) {
			String fileName = file.getOriginalFilename();
			String newFileName=UUID.randomUUID()+fileName.substring(fileName.lastIndexOf("."));
			
			String path="d:/pic/";
			File f=new File(path, newFileName);
			try {
				file.transferTo(f);
				article.setPicture(newFileName);
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			User user = (User) session.getAttribute("user");
			article.setUserId(user.getId());
			article.setCreated(new Date());
			article.setHits(0);
			article.setDeleted(0);
			article.setHot(0);
			article.setStatus(0);
			return service.AddArtile(article)>0;
		}
		return false;
	}
	
	/**
	 * 
	    * @Title: queryAllArticles
	    * @Description:查询所有文章并分页
	    * @param @param m
	    * @param @param page
	    * @param @param pageSize
	    * @param @return    参数
	    * @return String    返回类型
	    * @throws
	 */
	@RequestMapping("queryAllArticles")
	public String queryAllArticles(Model m,HttpSession session,@RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "4")Integer pageSize) {
		Article article=new Article();
		User user = (User) session.getAttribute("user");
		article.setUserId(user.getId());//只显示当前登录人的文章
		PageInfo<Article> info=service.selects(article,page,pageSize);
		m.addAttribute("info", info);
		return "my/articles";
		
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
	
	@RequestMapping("queryAllCollect")
	public String queryAllCollect(HttpSession session,Model m,@RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "10")Integer pageSize) {
		User user = (User) session.getAttribute("user");
		PageInfo<Collect> info = collectService.selects(user.getId(), page, pageSize);
		m.addAttribute("info", info);
		return "my/collect";
	}
	
}
