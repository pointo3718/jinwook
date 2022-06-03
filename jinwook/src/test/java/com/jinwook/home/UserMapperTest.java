package com.jinwook.home;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.jinwook.home.mapper.UserMapper;
import com.jinwook.home.service.domain.User;

import lombok.Data;


@Data
@SpringBootTest
class UserMapperTest {

	@Autowired
	private UserMapper userMapper;

	//@Test
	public void getUserTest() {
		User user = userMapper.getUser("test01");
		System.out.println("-------------------------------------------");
		System.out.println(user.toString());
		System.out.println("-------------------------------------------");
//		try {
//			//String boardJson = new ObjectMapper().writeValueAsString(board);
//            String userJson = new ObjectMapper().registerModule(new JavaTimeModule()).writeValueAsString(user);
//
//			System.out.println("=========================");
//			System.out.println(userJson);
//			System.out.println("=========================");
//
//		} catch (JsonProcessingException e) {
//			e.printStackTrace();
//		}
	}
	
	//@Test
	public void addUserTest() {
		User user = new User();
		user.setUserId("dk1dk");
		user.setPassword("dkdk");
		user.setBirth("19990000");
		user.setEmail("asda@1asd");
		user.setGrade("일반");
		user.setRole("사장");
		user.setUserName("ㅁ");
		user.setGender("남");
		user.setPhone("010-1231-5678");
		user.setBusinessNo("12312323");
		user.setUserByeStatus(false);
		user.setJpBalance(0);
		user.setJpPassword("123456");
		user.setNickName("아아아1");
		user.setBlacklistStatus(false);
		
		userMapper.addUser(user);
		
	}
	
	//@Test
	public void updateUserTest() {
		User user = userMapper.getUser("test01");
		
		user.setPassword("1111");
		user.setRpId("nini");
		user.setBusinessNo("12121111");
		user.setNickName("nini2ni");
		user.setEmail("qq@qq");
		
		userMapper.updateUser(user);
		
	}
	
	@Test
	public void deleteUserTest() {
		User user = userMapper.getUser("dk1dk");
		user.setUserByeStatus(true);
		
		
		
		userMapper.deleteUser(user);
	}
	
	

}
