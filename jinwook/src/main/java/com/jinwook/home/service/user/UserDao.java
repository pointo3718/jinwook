package com.jinwook.home.service.user;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.service.domain.User;

@Mapper
public interface UserDao {

	public User selectUser(String userId);
	
}
