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
			  							.param("store.storeNo", "10010")
              							.param("user.userId", "test01")
              							.param("buyerName", "등록1")
              							.param("buyerPhone", "010-1234-5678")
//              							.param("pickupTime", "08:16:09")
	                                    .param("orderReq", "빨리요~")
	                                    .param("orderPrice", "200000")
      									.param("prodCount", "2")
      									.param("orderDate", "2022-01-01")
      									.param("orderStatus", "0")
      									.param("finalPrice", "195000"))
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
	
	@Test
	@Transactional
	@DisplayName("updateOrders 파라미터 방식 테스트")
	public void updateOrders() throws Exception{
	  this.mvc.perform(post("/orders/updateOrders")
	                                    .param("orderNo", "10046")
	  									.param("orderStatus", "5"))
	  									.andExpect(status().isOk())
	  									.andDo(print());
	}
	
	@Test
	@Transactional
	@DisplayName("getOrders 파라미터 방식 테스트")
	public void getOrders() throws Exception{
	  this.mvc.perform(get("/orders/getOrders")
	                                    .param("orderNo", "10000"))
	  									.andExpect(status().isOk())	
	  									.andDo(print());
	}
	
	@Test
	@Transactional
	@DisplayName("addOrdersCart 파라미터 방식 테스트")
	public void addOrdersCart() throws Exception{
	  this.mvc.perform(post("/orders/addOrdersCart")
			  							.param("userId", "test01")
			  							.param("product.prodNo", "10003")
			  							.param("prodCount", "2")
			  							.param("storeName", "진욱이네")
			  							.param("cartStatus", "false"))
	  									.andExpect(status().isOk())
	  									.andDo(print());
			  
	}
	
	@Test
	@Transactional
	@DisplayName("getOrdersCartList 파라미터 방식 테스트")
	public void getOrdersCartList() throws Exception{
	  this.mvc.perform(get("/orders/getOrdersCartList")
			  							.param("userId", "test01")
	                                    .param("cartStatus", "false")
	  									.param("storeName", "진욱이네"))
	  									.andExpect(status().isOk())
	  									.andDo(print());
	}
	
	@Test
	@Transactional
	@DisplayName("updateOrdersCart 파라미터 방식 테스트")
	public void updateOrdersCart() throws Exception{
	  this.mvc.perform(post("/orders/updateOrdersCart")
			  							.param("prodCount", "4")
	                                    .param("userId", "10046")
	  									.param("cartNo", "10005"))
	  									.andExpect(status().isOk())
	  									.andDo(print());
	}
	
	@Test
	@Transactional
	@DisplayName("deleteOrdersCart 파라미터 방식 테스트")
	public void deleteOrdersCart() throws Exception{
	  this.mvc.perform(post("/orders/deleteOrdersCart")
	                                    .param("cartNo", "10011"))
	  									.andExpect(status().isOk())
	                   					.andDo(print());
	}
	
	@Test
	@Transactional
	@DisplayName("deleteOrderCartAfter 파라미터 방식 테스트")
	public void deleteOrderCartAfter() throws Exception{
	  this.mvc.perform(post("/orders/deleteOrderCartAfter")
			  							.param("orders.orderNo", "10003")
	                                    .param("cartStatus", "true")
	                                    .param("userId", "test01")
	  									.param("cartNo", "10006"))
	  									.andExpect(status().isOk())
	  									.andDo(print());
	}
	
	@Test
	@Transactional
	@DisplayName("addOrdersJpayPassword 파라미터 방식 테스트")
	public void addOrdersJpayPassword() throws Exception{
	  this.mvc.perform(post("/orders/addOrdersJpayPassword")
									  	.param("userId", "test01")
			  							.param("jpPassword", "123456"))
	  									.andExpect(status().isOk())
	  									.andDo(print());
			  
	}
	
	@Test
	@Transactional
	@DisplayName("updateOrdersJpayPassword 파라미터 방식 테스트")
	public void updateOrdersJpayPassword() throws Exception{
	  this.mvc.perform(post("/orders/updateOrdersJpayPassword")
	                                    .param("userId", "test01")
	  									.param("jpPassword", "654321"))
	  									.andExpect(status().isOk())
	  									.andDo(print());
	}
	
	@Test
	@Transactional
	@DisplayName("addOrdersJpayCharge 파라미터 방식 테스트")
	public void addOrdersJpayCharge() throws Exception{
	  this.mvc.perform(post("/orders/addOrdersJpayCharge")
			  							.param("userId", "test01")
//			  							.param("orderNo", "0")
			  							.param("jpStatus", "1")
			  							.param("finalPrice", "0")
			  							.param("chargePay", "0")
									  	.param("jpDate", "2022-06-08"))
	  									.andExpect(status().isOk())
	  									.andDo(print());
	}
	
	@Test
	@Transactional
	@DisplayName("getOrdersJpaylist 파라미터 방식 테스트")
	public void getOrdersJpaylist() throws Exception{
	  this.mvc.perform(get("/orders/getOrdersJpaylist")
			  							.param("userId", "test01"))
	  									.andExpect(status().isOk())
	  									.andDo(print());
	}
	
	@Test
	@Transactional
	@DisplayName("getOrdersNoticelist 파라미터 방식 테스트")
	public void getOrdersNoticelist() throws Exception{
	  this.mvc.perform(get("/orders/getOrdersNoticelist")
			  							.param("receiveId", "test01"))
	  									.andExpect(status().isOk())
	  									.andDo(print());
	}
}
