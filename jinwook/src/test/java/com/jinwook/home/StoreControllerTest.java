package com.jinwook.home;

//@SpringBootTest
//@AutoConfigureMockMvc
//class StoreControllerTest {
//
////    @Autowired
////    private MockMvc mockMvc;
////
////    @Autowired
////    private ObjectMapper objectMapper;
////
//////    @Autowired
//////    private Store store;
//////    
//////    @Autowired
//////    private Product product;
////
////
//////    @DisplayName("상품 삭제")
//////    @Test
//////    public void deleteStoreProductTest() throws Exception {
//////
//////    	Product product = new Product();
//////    	product.setProdNo(10024);
//////
//////    	product.save(product);
//////
//////    	mockMvc.perform(delete("/store/"))
//////    			.andExpect(status().isOk())
//////    			.andDo(print());
//////
//////    	Assertions.assertThat(product.deleteStoreProduct(10024).isEmpty());
//////    }
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
public class StoreControllerTest {

	@Autowired
	ObjectMapper mapper;

	@Autowired
	MockMvc mvc;

   @Test
   @DisplayName("updateStore GET 방식 테스트")
   public void confirmPassword() throws Exception{
     this.mvc.perform(get("/store/confirmPassword"))
                      .andExpect(status().isOk())
                      .andDo(print());
   } 
   	
	@Test
	@Transactional
	@DisplayName("updateStore 파라미터 방식 테스트")
	public void updateStore() throws Exception{
	  this.mvc.perform(post("/store/updateStore")
	                                    .param("storeIntro", "짱짱")
	                                    .param("storePhone", "010-2222-3333")
      									.param("storeImage", "짱.jpg")
      									.param("holiday", "매주 일요일")
      									.param("bank", "신한은행")
      									.param("accNo", "110020201")
      									.param("storeNo", "10000"))
	                   .andExpect(status().isOk())
	                   .andDo(print());
	}
	

//  @Test
//  @DisplayName("addStoreProduct GET 방식 테스트")
//  public void addStoreProduct() throws Exception{
//    this.mvc.perform(get("/store/addStoreProduct"))
//                     .andExpect(status().isOk())
//                     .andDo(print());
//  } 

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
	  this.mvc.perform(get("/store/getStore")
	                                    .param("storeNo", "10000"))
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
	
	
	   @Test
	   @DisplayName("getCouponList GET 방식 테스트")
	   public void getCouponList() throws Exception{
	     this.mvc.perform(get("/store/getCouponList")
         					.param("userId", "test01"))
							.andExpect(status().isOk())
							.andDo(print());
	   } 

	
	
}
