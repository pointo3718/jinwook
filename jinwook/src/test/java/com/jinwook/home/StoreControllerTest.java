package com.jinwook.home;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.HashMap;

import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Store;

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
