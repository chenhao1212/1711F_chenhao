package com.chenhao.cms.dao;

import java.util.List;

import com.chenhao.cms.entity.Article;
import com.chenhao.cms.entity.Comment;

public interface CommentMapper {
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
	List<Comment> selects(Article article);
	
	int updateArticleCommentNum(Integer articleId);
	
	
	List<Article> selectsByCommentNum(Article article);
}
