package com.jinwook.home;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
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
public class OrdersControllerTest {

	@Autowired
	ObjectMapper mapper;

	@Autowired
	MockMvc mvc;
	
	@Test
	@Transactional
	@DisplayName("addOrders 파라미터 방식 테스트")
	public void addOrders() throws Exception{
	  this.mvc.perform(post("/orders/addOrders")
			  							.param("orderNo", "10100")
			  							.param("storeNo", "10010")
              							.param("userId", "test01")
              							.param("buyerName", "등록1")
              							.param("buyerPhone", "010-1234-5678")
              							.param("pickupTime", "08:16:09")
	                                    .param("orderReq", "빨리요~")
	                                    .param("orderPrice", "200000")//6
      									.param("prodCount", "2")//7
      									.param("orderDate", "2022-01-01")//8
      									.param("orderStatus", "0")//9
      									.param("finalPrice", "195000"))//10
	                   .andExpect(status().isOk())
	                   .andDo(print());
	}
	
	@Test
	@Transactional
	@DisplayName("deleteOrders 파라미터 방식 테스트")
	public void deleteOrders() throws Exception{
	  this.mvc.perform(post("/orders/deleteOrders")
	                                    .param("orderNo", "10025"))
	  .andExpect(status().isOk())
	                   					.andDo(print());
	}
	
	@Test
	@Transactional
	@DisplayName("getOrdersList 파라미터 방식 테스트")
	public void getOrdersList() throws Exception{
	  this.mvc.perform(get("/orders/getOrdersList")
	                                    .param("userId", "test01"))
	  									.andExpect(status().isOk())
	                   					.andDo(print());
	}
	
}
