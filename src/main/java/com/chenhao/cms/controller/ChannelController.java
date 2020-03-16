package com.chenhao.cms.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chenhao.cms.entity.Article;
import com.chenhao.cms.entity.Category;
import com.chenhao.cms.entity.Channel;
import com.chenhao.cms.service.ChannelService;

@Controller
@RequestMapping("channel")
public class ChannelController {
	@Resource
	private ChannelService service;
	
	/**
	 * 
	    * @Title: queryAllChannel
	    * @Description:查询所有的栏目
	    * @param @return    参数
	    * @return List<Channel>    返回类型
	    * @throws
	 */
	@ResponseBody
	@RequestMapping("queryAllChannel")
	public List<Channel> queryAllChannel() {
		List<Channel> list=service.queryAllChannel();
		return list;
	}
	
	/**
	 * 
	    * @Title: queryAllChannel
	    * @Description:根据栏目查分类
	    * @param @return    参数
	    * @return List<Channel>    返回类型
	    * @throws
	 */
	@ResponseBody
	@RequestMapping("queryCategoryByChannelId")
	public List<Category> queryCategoryByChannelId(Integer channelId) {
		List<Category> list=service.queryCategoryByChannelId(channelId);
		return list;
	}
	
	
}
