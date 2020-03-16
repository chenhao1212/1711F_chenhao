package com.chenhao.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chenhao.cms.dao.ArticleMapper;
import com.chenhao.cms.entity.Article;
import com.chenhao.cms.service.ArticleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class ArticleServiceImpl implements ArticleService{
	@Autowired
	private ArticleMapper dao;
	
	@Override
	public void insert(Article article) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PageInfo<Article> selects(Article article, Integer page, Integer pageSize) {
		PageHelper.startPage(page, pageSize);
		List<Article> list=dao.queryAllArticleByUserId(article);
		return new PageInfo(list);
	}

	@Override
	public int AddArtile(Article article) {
		// TODO Auto-generated method stub
		return dao.insert(article);
	}

	@Override
	public Article queryArticleById(Integer id) {
		// TODO Auto-generated method stub
		return dao.queryArticleById(id);
	}

	@Override
	public int updateHot(Article article) {
		// TODO Auto-generated method stub
		return dao.updateHot(article);
	}
	
}
