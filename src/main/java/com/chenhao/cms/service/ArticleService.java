package com.chenhao.cms.service;

import java.util.List;

import com.chenhao.cms.entity.Article;
import com.github.pagehelper.PageInfo;

public interface ArticleService {
	public void insert(Article article);
	
	public PageInfo<Article> selects(Article article, Integer page, Integer pageSize);

	public int AddArtile(Article article);

	public Article queryArticleById(Integer id);
	
	int updateHot(Article article);
}
