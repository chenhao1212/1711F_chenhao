package com.chenhao.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chenhao.cms.dao.CollectMapper;
import com.chenhao.cms.entity.Collect;
import com.chenhao.cms.service.CollectService;
import com.chenhao.cms.util.CmsException;
import com.chenhao.utils.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class CollectServiceImpl implements CollectService{
	@Autowired
	private CollectMapper dao;
	@Override
	public int insert(Collect collect) {
		if(!StringUtils.isHttpUrl(collect.getUrl())) {
			throw new CmsException("不是合法的url");
		}
		return dao.insert(collect);
	}

	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return dao.delete(id);
	}

	@Override
	public PageInfo<Collect> selects(Integer userId,Integer page,Integer pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, pageSize);
		return new PageInfo<Collect>(dao.selects(userId));
	}

	@Override
	public Collect selectByTitleAndUserId(String title, Integer userId) {
		// TODO Auto-generated method stub
		return dao.selectByTitleAndUserId(title, userId);
	}
	
}
