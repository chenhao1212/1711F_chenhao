package com.chenhao.cms.entity;

import java.io.Serializable;
import java.util.Date;

public class Comment implements Serializable{

	
	    /**
	    * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	    */
	    
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Integer user_id;
	private Integer article_id;
	private String content;
	private Date created;
	private User user;
	private Article article;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Integer getArticle_id() {
		return article_id;
	}
	public void setArticle_id(Integer article_id) {
		this.article_id = article_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public Comment(Integer id, Integer user_id, Integer article_id, String content, Date created, User user,
			Article article) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.article_id = article_id;
		this.content = content;
		this.created = created;
		this.user = user;
		this.article = article;
	}
	public Comment() {
		super();
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", user_id=" + user_id + ", article_id=" + article_id + ", content=" + content
				+ ", created=" + created + ", user=" + user + ", article=" + article + "]";
	}
	
}
