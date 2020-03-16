package com.chenhao.cms.service;

import com.chenhao.cms.entity.User;
import com.github.pagehelper.PageInfo;

public interface UserService {
	
	PageInfo<User> queryAllUser(User user,Integer page,Integer pageSize);

	int updateUserStatus(User user);
	
	int insertUser(User user);
	
	
	User queryUserByUsername(String username);
	
	User login(User user);
}
