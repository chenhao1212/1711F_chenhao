package com.chenhao.cms.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chenhao.cms.entity.Article;
import com.chenhao.cms.entity.Category;
import com.chenhao.cms.entity.Channel;
import com.chenhao.cms.entity.Collect;
import com.chenhao.cms.entity.Comment;
import com.chenhao.cms.entity.Slide;
import com.chenhao.cms.entity.User;
import com.chenhao.cms.service.ArticleService;
import com.chenhao.cms.service.ChannelService;
import com.chenhao.cms.service.CollectService;
import com.chenhao.cms.service.CommentService;
import com.chenhao.cms.service.SlideService;
import com.github.pagehelper.PageInfo;

@Controller
public class IndexController {
	@Autowired
	private ChannelService channelService;
	@Autowired
	private ArticleService articleservice;
	@Autowired
	private SlideService slideService;
	@Autowired 
	private CommentService commentService;
	@Autowired
	private CollectService Collectservice;
	
	
	@RequestMapping(value = {"","/","index"})
	public String index(Model m,Article article,@RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "5")Integer pageSize) {
		List<Channel> list=channelService.queryAllChannel();
		
		m.addAttribute("channel", list);
		if(article.getChannelId()!=null) {
			List<Category> queryCategoryByChannelId = channelService.queryCategoryByChannelId(article.getChannelId());
			m.addAttribute("category", queryCategoryByChannelId);
		}
		if(article.getChannelId()==null) {
			article.setHot(1);
			List<Slide> queryAllSlide = slideService.queryAllSlide();
			m.addAttribute("slides", queryAllSlide);
		}
		m.addAttribute("article", article);
		//查询所有文章
		PageInfo<Article> info=articleservice.selects(article, page, pageSize);
		m.addAttribute("info", info);
		PageInfo<Article>  infolist= articleservice.selects(new Article(), 1, 10);
		m.addAttribute("infolist", infolist);
		return "index/index";
	}
	
	
	@RequestMapping("queryOneArticleById")
	public String queryOneArticleById(Model m,Integer id,@RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "5")Integer pageSize,HttpSession session) {
		Article article=articleservice.queryArticleById(id);
		PageInfo<Comment> info = commentService.selects(article, page, pageSize);
		PageInfo<Article> infotwo = commentService.selectsByCommentNum(new Article(), page, pageSize);
		User user = (User) session.getAttribute("user");
		Collect selectByTitleAndUserId = null;
		if(null!=user) {
			selectByTitleAndUserId = Collectservice.selectByTitleAndUserId(article.getTitle(),user.getId());
		}
		m.addAttribute("article", article);
		m.addAttribute("info", info);
		m.addAttribute("infotwo", infotwo);
		m.addAttribute("collect", selectByTitleAndUserId);
		return "index/articleDetail";
	}
	
	
	/**
	 * 增加评论
	 */
	@ResponseBody
	@RequestMapping("addComment")
	public boolean addComment(Comment comment,HttpSession session) {
		System.out.println(comment.toString());
		User user = (User) session.getAttribute("user");
		if(null==user)
			return false;//未登录
		comment.setUser_id(user.getId());
		comment.setCreated(new Date());
		return commentService.insertComment(comment)>0;
		
	}
	
	/**
	 * 
	    * @Title: addComment
	    * @Description:收藏文章
	    * @param @param comment
	    * @param @param session
	    * @param @return    参数
	    * @return boolean    返回类型
	    * @throws
	 */
	@ResponseBody
	@RequestMapping("addCollect")
	public boolean addComment(Collect collect,HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(null==user)
			return false;//未登录
		collect.setUser(user);
		collect.setCreated(new Date());
		return Collectservice.insert(collect)>0;
		
	}
	/**
	 * 
	    * @Title: addComment
	    * @Description:取消收藏
	    * @param @param comment
	    * @param @param session
	    * @param @return    参数
	    * @return boolean    返回类型
	    * @throws
	 */
	@ResponseBody
	@RequestMapping("deleteCollect")
	public boolean deleteCollect(Integer id) {
		return Collectservice.delete(id)>0;
	}
	
}
