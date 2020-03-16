package com.chenhao.cms.dao;

import java.util.List;

import com.chenhao.cms.entity.User;

public interface UserMapper {
	/**
	 * 
	    * @Title: queryAllUser
	    * @Description: 查询所有用户
	    * @param @param user
	    * @param @return    参数
	    * @return List<User>    返回类型
	    * @throws
	 */
	List<User> queryAllUser(User user);
	
	/**
	 * 
	    * @Title: updateUserStatus
	    * @Description:改变用户状态
	    * @param @param user
	    * @param @return    参数
	    * @return int    返回类型
	    * @throws
	 */
	int updateUserStatus(User user);
	
	
	int insertUser(User user);
	
	
	User queryUserByUsername(String username);
}
