package com.jinwook.home;

import java.sql.Date;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.request.RequestService;

@SpringBootTest
class RequestServiceTest {

	@Autowired
	private RequestService requestService;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Test
	public void testInsertRequestAddStore() { // 상점 예비등록 + 요청 등록
		int number = 1;
		
		Store store = new Store();
		store.setUserId("test17");
		store.setStoreName("씩씩이네");
		store.setStoreAddr("서울시 강북구 씩씩이네");
		store.setStoreType("5");
		store.setStorePhone("010-9500-7003");
		store.setStoreIntro("씩씩이네에 어서오세요...");
		store.setBusinessCard("씩씩이의_영업신고증.jpg");
		store.setStoreImage("씩씩이네.jpg");
		store.setAccNo("123123-10-123153");
		store.setBank("카카오뱅크");
		store.setStoreStart(Date.valueOf("2002-03-06"));
		
		requestService.addRequestAddStore(store);

		logger.debug("상점 " + number + "개가 등록되었습니다.");
	}
	
	
	
	
}
