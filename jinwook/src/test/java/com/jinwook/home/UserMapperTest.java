package com.jinwook.home;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.jinwook.home.mapper.UserMapper;
import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.user.UserService;
import com.jinwook.home.service.user.UserServiceImpl;

<<<<<<< HEAD


=======
>>>>>>> refs/remotes/origin/master
@SpringBootTest
class UserMapperTest {

	@Autowired
	private UserMapper userMapper;

	//@Test
	public void getUserTest() throws Exception{
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
	public void addUserTest()  throws Exception{
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
	public void updateUserTest() throws Exception {
		User user = userMapper.getUser("test01");
		
		user.setPassword("1111");
		user.setRpId("nini");
		user.setBusinessNo("12121111");
		user.setNickName("nini2ni");
		user.setEmail("qq@qq");
		
		userMapper.updateUser(user);
		
	}
	
	@Test
	public void deleteUserTest() throws Exception {
		User user = userMapper.getUser("test02");
		user.setUserByeStatus(true);
		
		userMapper.deleteUser(user);
	}
	
	//@Test
	public void checkIdTest() throws Exception{
		User user = new User();
		UserServiceImpl userServiceImpl=null;
		UserService userService = null;
		System.out.println("----------------------------------");
		System.out.println(userService.checkId("dk1dk"));
		System.out.println("----------------------------------");
//	 	Assert.assertTrue( userService.checkId("testUserId"+System.currentTimeMillis()) );
	}
	
	//@Test
	public void checkNickNameTest() throws Exception{
		User user = new User();
		System.out.println("----------------------------------");
		System.out.println(userMapper.checkNickName("ㅁ"));
		System.out.println("----------------------------------");
//	 	Assert.assertTrue( userService.checkId("testUserId"+System.currentTimeMillis()) );
	}
}
