package com.jinwook.home.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.service.domain.User;

@Mapper
public interface UserMapper {
	
	public User getUser(String userId);
	
	

	
}
