package com.jinwook.home;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.jinwook.home.mapper.UserMapper;
import com.jinwook.home.service.domain.User;



@SpringBootTest
class UserMapperTest {

	@Autowired
	private UserMapper userMapper;

	@Test
	public void testOfSelectDetail() {
		User user = userMapper.getUser("test01");
		System.out.println(user.toString());
		try {
			//String boardJson = new ObjectMapper().writeValueAsString(board);
            String userJson = new ObjectMapper().registerModule(new JavaTimeModule()).writeValueAsString(user);

			System.out.println("=========================");
			System.out.println(userJson);
			System.out.println("=========================");

		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}

}
