package com.chenhao.cms.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chenhao.cms.dao.UserMapper;
import com.chenhao.cms.entity.User;
import com.chenhao.cms.service.UserService;
import com.chenhao.cms.util.CmsException;
import com.chenhao.cms.util.Md5Util;
import com.chenhao.utils.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper dao;
	
	@Override
	public PageInfo<User> queryAllUser(User user, Integer page, Integer pageSize) {
		PageHelper.startPage(page, pageSize);
		List<User> list = dao.queryAllUser(user);
		return new PageInfo<User>(list);
	}

	@Override
	public int updateUserStatus(User user) {
		// TODO Auto-generated method stub
		return dao.updateUserStatus(user);
	}

	@Override
	public int insertUser(User user) {
		if(!StringUtils.hasText(user.getUsername())) {
			throw new CmsException("用户名不能为空");
		}
		if(!(user.getUsername().length()>=2) && !(user.getUsername().length()<=10)) {
			throw new CmsException("用户名长度为2-10");
		}
		if(!StringUtils.hasText(user.getPassword()))
			throw new CmsException("密码不能为空");
		if(!(user.getPassword().length()>=6) && !(user.getPassword().length()<=10))
			throw new CmsException("密码长度为6-10");
		if(!StringUtils.hasText(user.getRepassword())) {
			throw new CmsException("确认密码不能为空");
		}
		User uu=this.queryUserByUsername(user.getUsername());
		if(null!=uu) {
			throw new CmsException("注册失败，用户名已存在");
		}
		if(!user.getPassword().equals(user.getRepassword())) {
			throw new CmsException("两次密码不一致");
		}
		user.setPassword(Md5Util.encode(user.getPassword()));
		user.setCreated(new Date());
		user.setNickname(user.getUsername());
		user.setLocked("0");
		return dao.insertUser(user);
	}

	@Override
	public User queryUserByUsername(String username) {
		// TODO Auto-generated method stub
		return dao.queryUserByUsername(username);
	}

	@Override
	public User login(User user) {
		if(!StringUtils.hasText(user.getUsername())) {
			throw new CmsException("用户名不能为空");
		}
		User u = this.queryUserByUsername(user.getUsername());
		if(null==u) {
			throw new CmsException("该用户名不存在");
		}
		if(!Md5Util.encode(user.getPassword()).equals(u.getPassword())) {
			throw new CmsException("密码不正确");
		}
		if(u.getLocked().equals("1")) {
			throw new CmsException("当前账户被禁用");
		}
		return u;
	}
	
	
}
