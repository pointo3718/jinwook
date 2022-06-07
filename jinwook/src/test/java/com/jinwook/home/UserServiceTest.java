package com.jinwook.home;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.user.UserService;





@SpringBootTest
class UserServiceTest {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	//@Test
	public void getUserTest() throws Exception{
		User user = userService.getUser("test02");
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
		user.setUserId("dk1111dk");
		user.setPassword("dk11dk");
		user.setBirth("19991000");
		user.setEmail("asd11a@1asd");
		user.setGrade("일반");
		user.setRole("사장");
		user.setUserName("ㅁ");
		user.setGender("남");
		user.setPhone("010-1421-5678");
		user.setBusinessNo("1231222323");
		user.setUserByeStatus(false);
		user.setJpBalance(0);
		user.setJpPassword("123456");
		user.setNickName("아1아1아1");
		user.setBlacklistStatus(false);
		
		userService.addUser(user);
		
	}
	
	//@Test
	public void updateUserTest() throws Exception {
		User user = userService.getUser("test01");
		
		user.setPassword("1111");
		user.setRpId("nini");
		user.setBusinessNo("12121111");
		user.setNickName("nini2ni");
		user.setEmail("qq@qq");
		
		userService.updateUser(user);
		
	}
	
	//@Test
	public void deleteUserTest() throws Exception {
		User user = userService.getUser("test02");
		user.setUserByeStatus(true);
		
		userService.deleteUser(user);
	}
	
	//@Test
	public void checkIdTest() throws Exception{
		System.out.println("----------------------------------");
		System.out.println(userService.checkId("dk1dk"));
		System.out.println("----------------------------------");
//	 	Assert.assertTrue( userService.checkId("testUserId"+System.currentTimeMillis()) );
	}
	
	//@Test
	public void checkNickNameTest() throws Exception{
		System.out.println("----------------------------------");
		System.out.println(userService.checkNickName("ㅁ"));
		System.out.println("----------------------------------");
//	 	Assert.assertTrue( userService.checkId("testUserId"+System.currentTimeMillis()) );
	}
	
	@Test
	public void confirmPasswordTest() throws Exception{
		User user = new User();
		user.setUserId("test01");
		user.setPassword("1111");
		System.out.println("----------------------------------");
		System.out.println(userService.confirmPassword(user));
		System.out.println("----------------------------------");
//	 	Assert.assertTrue( userService.checkId("testUserId"+System.currentTimeMillis()) );
	}
}
