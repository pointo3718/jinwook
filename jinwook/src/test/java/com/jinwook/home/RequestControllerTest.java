package com.jinwook.home;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import javax.transaction.Transactional;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

import com.fasterxml.jackson.databind.ObjectMapper;

@SpringBootTest
@AutoConfigureMockMvc
public class RequestControllerTest {
	
	@Autowired
	ObjectMapper mapper;

	@Autowired
	MockMvc mvc;

	
	@Test
	@Transactional
	@DisplayName("addRequestAddStore 파라미터 방식 테스트")
	public void addRequestAddStore() throws Exception{
	  this.mvc.perform(post("/request/addRequestAddStore")
	                                    .param("prodNo", "10025")
	                                    .param("prodName", "수박")
      									.param("price", "1000")
      									.param("prodInfo", "맛나요")
      									.param("prodOrign", "과천")
      									.param("prodImg", "수박.jpg")
      									.param("isSoldOut", "1"))
	                   .andExpect(status().isOk())
	                   .andDo(print());
	}
}
