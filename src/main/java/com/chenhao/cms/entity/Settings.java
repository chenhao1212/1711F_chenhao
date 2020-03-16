package com.chenhao.cms.entity;

public class Settings {
	private Integer id;
	private String siteDomain;
	private String siteName;
	private Integer article_list_size;//文章没页显示的条目
	private Integer slide_size;//显示多少个广告
	private String adminUsername;
	private String adminPassword;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSiteDomain() {
		return siteDomain;
	}
	public void setSiteDomain(String siteDomain) {
		this.siteDomain = siteDomain;
	}
	public String getSiteName() {
		return siteName;
	}
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
	public Integer getArticle_list_size() {
		return article_list_size;
	}
	public void setArticle_list_size(Integer article_list_size) {
		this.article_list_size = article_list_size;
	}
	public Integer getSlide_size() {
		return slide_size;
	}
	public void setSlide_size(Integer slide_size) {
		this.slide_size = slide_size;
	}
	public String getAdminUsername() {
		return adminUsername;
	}
	public void setAdminUsername(String adminUsername) {
		this.adminUsername = adminUsername;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public Settings(Integer id, String siteDomain, String siteName, Integer article_list_size, Integer slide_size,
			String adminUsername, String adminPassword) {
		super();
		this.id = id;
		this.siteDomain = siteDomain;
		this.siteName = siteName;
		this.article_list_size = article_list_size;
		this.slide_size = slide_size;
		this.adminUsername = adminUsername;
		this.adminPassword = adminPassword;
	}
	public Settings() {
		super();
	}
	
}
