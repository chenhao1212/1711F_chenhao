package com.chenhao.cms.entity;

public class Category {
	private Integer id;
	private String name;
	private Integer channelId;//所属栏目的ID
	private Integer sorted;//排序
	private Channel channel;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getChannelId() {
		return channelId;
	}
	public void setChannelId(Integer channelId) {
		this.channelId = channelId;
	}
	public Integer getSorted() {
		return sorted;
	}
	public void setSorted(Integer sorted) {
		this.sorted = sorted;
	}
	public Channel getChannel() {
		return channel;
	}
	public void setChannel(Channel channel) {
		this.channel = channel;
	}
	public Category(Integer id, String name, Integer channelId, Integer sorted, Channel channel) {
		super();
		this.id = id;
		this.name = name;
		this.channelId = channelId;
		this.sorted = sorted;
		this.channel = channel;
	}
	public Category() {
		super();
	}
	
}
