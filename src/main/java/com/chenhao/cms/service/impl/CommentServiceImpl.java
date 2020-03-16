package com.chenhao.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chenhao.cms.dao.CommentMapper;
import com.chenhao.cms.entity.Article;
import com.chenhao.cms.entity.Comment;
import com.chenhao.cms.service.CommentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private CommentMapper dao;
	
	@Override
	public int insertComment(Comment comment) {
		//增加评论
		try {
			dao.insertComment(comment);
			dao.updateArticleCommentNum(comment.getArticle_id());
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PageInfo<Comment> selects(Article article,Integer page,Integer pageSize) {
		PageHelper.startPage(page, pageSize);
		List<Comment> list=dao.selects(article);
		return new PageInfo<Comment>(list);
	}

	@Override
	public PageInfo<Article> selectsByCommentNum(Article article,Integer page,Integer pageSize) {
		PageHelper.startPage(page, pageSize);
		PageInfo<Article> infotwo=new PageInfo<Article>(dao.selectsByCommentNum(article));
		return infotwo;
	}
	
}
