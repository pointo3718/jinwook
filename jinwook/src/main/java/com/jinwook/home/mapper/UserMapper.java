package com.jinwook.home.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.service.domain.User;

@Mapper
public interface UserMapper {
	
	// INSERT
	public void addUser(User user);
		
	// SELECT ONE
	public User getUser(String userId);

	// UPDATE
	public void updateUser(User user);
	
	//DELETE
	public void deleteUser(User user);
	
//	public int getTotalCount(Search search) throws Exception ;
	

	
}
