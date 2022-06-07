package com.jinwook.home;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

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
public class StoreRestControllerTest {

	@Autowired
	ObjectMapper mapper;

	@Autowired
	MockMvc mvc;

	@Test
	@Transactional
	@DisplayName("addStoreProduct 파라미터 방식 테스트")
	public void addStoreProduct() throws Exception{
	  this.mvc.perform(post("/store/addStoreProduct")
              							.param("storeNo", "10000")
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
	
	@Test
	@Transactional
	@DisplayName("updateStoreProduct 파라미터 방식 테스트")
	public void updateStoreProduct() throws Exception{
	  this.mvc.perform(post("/store/updateStoreProduct")
	                                    .param("prodNo", "10025")
	                                    .param("prodName", "사과")
      									.param("price", "1000")
      									.param("prodInfo", "맛나요")
      									.param("prodOrign", "과천")
      									.param("prodImg", "수박.jpg")
      									.param("isSoldOut", "1"))
	                   .andExpect(status().isOk())
	                   .andDo(print());
	}
	
	@Test
	@Transactional
	@DisplayName("deleteStoreProduct 파라미터 방식 테스트")
	public void deleteStoreProduct() throws Exception{
	  this.mvc.perform(post("/store/deleteStoreProduct")
	                                    .param("prodNo", "10025"))
	  									.andExpect(status().isOk())
	                   					.andDo(print());
	}
	
	@Test
	@Transactional
	@DisplayName("isSoldout 파라미터 방식 테스트")
	public void isSoldout() throws Exception{
	  this.mvc.perform(post("/store/isSoldout")
	                                    .param("prodNo", "10025"))
      									.andExpect(status().isOk())
	                   					.andDo(print());
	}
	
	@Test
	@Transactional
	@DisplayName("isOpen 파라미터 방식 테스트")
	public void isOpen() throws Exception{
	  this.mvc.perform(post("/store/isOpen")
	                                    .param("storeNo", "10000"))
	  									.andExpect(status().isOk())
	                   					.andDo(print());
	}
	
	@Test
	@Transactional
	@DisplayName("addOrderCoupon 파라미터 방식 테스트")
	public void addOrderCoupon() throws Exception{
	  this.mvc.perform(post("/store/addOrderCoupon")
	                                    .param("couponNo", "10000"))
	  									.andExpect(status().isOk())
	                   					.andDo(print());
	}
	
	@Test
	@Transactional
	@DisplayName("getStore 파라미터 방식 테스트")
	public void getStore() throws Exception{
	  this.mvc.perform(post("/store/getStore")
	                                    .param("prodNo", "10000"))
	  									.andExpect(status().isOk())	
	                   					.andDo(print());
	}
	
	@Test
	@Transactional
	@DisplayName("getStoreWallet 파라미터 방식 테스트")
	public void getStoreWallet() throws Exception{
	  this.mvc.perform(get("/store/getStoreWallet")
	                                    .param("storeNo", "10000"))
	  									.andExpect(status().isOk())
	                   					.andDo(print());
	}
	
	
	
}
