package com.chenhao.cms.service;

import java.util.List;

import com.chenhao.cms.entity.Category;
import com.chenhao.cms.entity.Channel;

public interface ChannelService {

	List<Channel> queryAllChannel();

	List<Category> queryCategoryByChannelId(Integer channelId);

}
