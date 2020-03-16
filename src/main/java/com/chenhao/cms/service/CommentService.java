package com.chenhao.cms.service;

import java.util.List;

import com.chenhao.cms.entity.Article;
import com.chenhao.cms.entity.Comment;
import com.github.pagehelper.PageInfo;

public interface CommentService {
	/**
	 * 
	    * @Title: insertComment
	    * @Description:增加评论
	    * @param @param comment
	    * @param @return    参数
	    * @return int    返回类型
	    * @throws
	 */
	int insertComment(Comment comment);
	/**
	 * 
	    * @Title: selects
	    * @Description:根据文章查评论
	    * @param @param article
	    * @param @return    参数
	    * @return List<Comment>    返回类型
	    * @throws
	 */
	
	PageInfo<Article> selectsByCommentNum(Article article,Integer page,Integer pageSize);
	
	
	
	
	PageInfo<Comment> selects(Article article,Integer page,Integer pageSize);
}
