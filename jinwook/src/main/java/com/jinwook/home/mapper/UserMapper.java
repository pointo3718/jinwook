package com.jinwook.home.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import com.jinwook.home.service.domain.User;

import io.lettuce.core.dynamic.annotation.Param;

@Mapper
public interface UserMapper {
	
	// INSERT
	public void addUser(User user) throws Exception;
		
	// SELECT ONE
	public User getUser(String userId) throws Exception;

	// UPDATE
	public void updateUser(User user) throws Exception;
	
	//DELETE
	public void deleteUser(User user) throws Exception;
	
	//CHECK DUPLICATION ID
	public int checkId(String userId) throws Exception;
	
	//CHECK DUPLICATION NICKNAME
	public int checkNickName(String nickName) throws Exception;

	//CHECK DUPLICATION PHONE
	public int checkPhone(String phone) throws Exception;
	
	//CHECK DUPLICATION EMAIL
	public int checkEmail(String email) throws Exception;
	
	//CHECK DUPLICATION PASSWORD
	public int checkPassword(User user) throws Exception;
	
	//FIND ID PHONE
	public User findIdPhone(User user) throws Exception;
	
	//FIND ID EMAIL
	public User findIdEmail(User user) throws Exception;
	
	//FIND PASSWORD PHONE
	public User findPasswordPhone(User user) throws Exception;
	
	//FIND PASSWORD EMAIL 
	public User findPasswordEmail(User user) throws Exception;
	
//	//UPDATE PASSWORD
//	public void updatePassword(User user) throws Exception; 

	
//	public int getTotalCount(Search search) throws Exception ;
	

	
}
