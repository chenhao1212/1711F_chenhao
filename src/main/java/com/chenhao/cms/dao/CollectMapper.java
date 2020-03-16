package com.chenhao.cms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chenhao.cms.entity.Collect;

public interface CollectMapper {
	/**
	 * 
	 * @Title: insert 
	 * @Description: 收藏
	 * @param collect
	 * @return
	 * @return: int
	 */
	int insert(Collect collect);
	/**
	 * 
	 * @Title: delete 
	 * @Description: 取消收藏
	 * @param id
	 * @return
	 * @return: int
	 */
	int delete(Integer id);
	/**
	 * 
	 * @Title: selects 
	 * @Description: 显示我的收藏夹
	 * @param userId
	 * @return
	 * @return: List<Collect>
	 */
	List<Collect> selects(Integer userId);
	
	/**
	 * 
	 * @Title: selectByUrlAndUserId 
	 * @Description: 根据title和userid 查询此文章是否被该用户收藏过
	 * @param url
	 * @param userId
	 * @return
	 * @return: Collect
	 */
	Collect selectByTitleAndUserId(@Param("title")String title,@Param("userId")Integer userId);
	

}
