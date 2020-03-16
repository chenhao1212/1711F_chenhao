package com.chenhao.cms.service.impl;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.internal.runners.JUnit4ClassRunner;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.chenhao.cms.entity.Article;
import com.chenhao.cms.service.ArticleService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:spring.xml")
public class ArticleServiceImplTest {
	
	
	@Resource
	private ArticleService articleService;
	
	@Test
	public void testInsert() {
		Article a=new Article();
		a.setTitle("test");
		a.setUserId(1);
		a.setChannelId(1);
		a.setCategoryId(1);
		 
		articleService.insert(a);
	}

	@Test
	public void testSelects() {
		fail("Not yet implemented");
	}

}
