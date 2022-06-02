package com.jinwook.home;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.jinwook.home.mapper.ProductMapper;
import com.jinwook.home.service.domain.Product;



@SpringBootTest
class ProductMapperTest {

	@Autowired
	private ProductMapper productMapper;

	@Test
	public void testOfSelectDetail() {
		Product product = productMapper.selectProductDetail(10000);
		try {
			//String boardJson = new ObjectMapper().writeValueAsString(board);
            String productJson = new ObjectMapper().registerModule(new JavaTimeModule()).writeValueAsString(product);

			System.out.println("=========================");
			System.out.println(productJson);
			System.out.println("=========================");

		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
	   
	   
}
	   
	   
	   
	