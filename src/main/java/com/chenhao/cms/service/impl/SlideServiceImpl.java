package com.chenhao.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chenhao.cms.dao.SlideMapper;
import com.chenhao.cms.entity.Slide;
import com.chenhao.cms.service.SlideService;
@Service
public class SlideServiceImpl implements SlideService {
	
	@Autowired
	private SlideMapper dao;
	@Override
	public List<Slide> queryAllSlide() {
		// TODO Auto-generated method stub
		return dao.queryAllSlide();
	}
}
