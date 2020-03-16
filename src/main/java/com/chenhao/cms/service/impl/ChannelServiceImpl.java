package com.chenhao.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chenhao.cms.dao.ChannelMapper;
import com.chenhao.cms.entity.Category;
import com.chenhao.cms.entity.Channel;
import com.chenhao.cms.service.ChannelService;
@Service
public class ChannelServiceImpl implements ChannelService {
	@Autowired
	private ChannelMapper dao;

	@Override
	public List<Channel> queryAllChannel() {
		// TODO Auto-generated method stub
		return dao.queryAllChannel();
	}

	@Override
	public List<Category> queryCategoryByChannelId(Integer channelId) {
		// TODO Auto-generated method stub
		return dao.queryCategoryByChannelId(channelId);
	}
	
}
