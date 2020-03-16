package com.chenhao.cms.dao;

import java.util.List;

import com.chenhao.cms.entity.Article;

public interface ArticleMapper {

	int insert(Article article);

	List<Article> queryAllArticleByUserId(Article article);

	Article queryArticleById(Integer id);
	
	int updateHot(Article article);
}
