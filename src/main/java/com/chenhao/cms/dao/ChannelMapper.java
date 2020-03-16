package com.chenhao.cms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenhao.cms.entity.Category;
import com.chenhao.cms.entity.Channel;

public interface ChannelMapper {

	List<Channel> queryAllChannel();

	List<Category> queryCategoryByChannelId(Integer channelid);
	
}
