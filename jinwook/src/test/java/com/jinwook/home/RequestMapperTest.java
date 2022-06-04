package com.jinwook.home;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.jinwook.home.mapper.RequestMapper;
import com.jinwook.home.service.domain.Request;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;

@SpringBootTest
public class RequestMapperTest {

	@Autowired
	private RequestMapper requestMapper;
	
	
	////////////////// 상점 예비 등록 /////////////////
	@Test
	public void testOfInsertRequestAdd() {
		Store store = new Store();
		store.setUserId("test13");
		store.setStoreName("부들이네");
		store.setStoreAddr("서울시 강북구 진욱이네");
		store.setStoreType("3");
		store.setStorePhone("010-9500-7753");
		store.setStoreIntro("부들이네에 어서오세요...");
		store.setBussinessCard("부들이의_영업신고증.jpg");
		store.setStoreImage("부들이네.jpg");
		store.setAccNo("123123-12-123123");
		store.setBank("농협");

		int result = requestMapper.addRequestAddStore(store);
		System.out.println("결과는 " + result + "입니다.");
	}
	
	
	/////////////////// 상점 등록 요청 추가 /////////////////
	@Test
	public void testOfInsertRequestAddForAdmin() {
		Request request = new Request();
		request.setUserId("test12");
		request.setStoreNo(10014);  // 서비스에서 어떻게 가져올지 ?
		
		Store store = requestMapper.checkStoreStatus(10014);
		
		
		request.setStoreNo(1); //??
		store.setStoreAddr("서울시 강북구 진욱이네");
		store.setStoreType("3");
		store.setStorePhone("010-9500-7753");
		store.setStoreIntro("부들이네에 어서오세요...");
		store.setBussinessCard("부들이의_영업신고증.jpg");
		store.setStoreImage("부들이네.jpg");
		store.setAccNo("123123-12-123123");
		store.setBank("농협");

		int result = requestMapper.addRequestAddStoreForAdmin(request);
		System.out.println("결과는 " + result + "입니다.");
	}
	
	
	////////////////// 상점 등록 요청 보기 /////////////////
	@Test
	public void testOfSelectRequestAddStoreDetail() {
		Store store = requestMapper.getRequestStore("test13");
		try {
			//String boardJson = new ObjectMapper().writeValueAsString(board);
            String storeJson = new ObjectMapper().registerModule(new JavaTimeModule()).writeValueAsString(store);

			System.out.println("=========================");
			System.out.println(storeJson);
			System.out.println("=========================");

		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
	
	
	///////////////// 상점 등록 수락 (요청 목록의 코드와 상점 코드를 모두 바꿔줘야 ...) //////////////////
	@Test
	public void testOfUpdateStoreStatus() {		
		int result = requestMapper.updateRequestAddStore(10014);
		if (result == 1) {
			Store store = requestMapper.checkStoreStatus(10014);
			try {
				//String boardJson = new ObjectMapper().writeValueAsString(board);
				String storeJson = new ObjectMapper().registerModule(new JavaTimeModule()).writeValueAsString(store);
	
				System.out.println("=========================");
				System.out.println(storeJson);
				System.out.println("=========================");
	
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	//////////// 요청 상태 수락으로 변경 /////////////
//	@Test
//	public void testOfUpdateRequestStatus() {	
//		Request request = new Request();
//		request.setReqCode("1");
//		request.setUserId("test12");
//		int result = requestMapper.updateRequestStatusToAccept(request);
//		System.out.println("결과는 " + result + "입니다.");
//	}
	
	
	///////////////// 환급 신청 //////////////////
	@Test
	public void testOfInsertRequestRefund() {
		Request request = new Request();
		request.setUserId("test05");
		request.setRefundMoney(5000);  // 서비스에서 어떻게 가져올지 ?
		int result = requestMapper.addRequestRefund(request);
		System.out.println("결과는 " + result + "입니다.");
	}
	
	
	/////////////// 환급 신청 수락 ////////////////
	@Test
	public void testOfUpdateRequestStatus() {	
		Request request = new Request();
		request.setReqCode("1");
		request.setUserId("test12");
		int result = requestMapper.updateRequestStatusToAccept(request);
		System.out.println("결과는 " + result + "입니다.");
	}


	
	//////////////// 광고 신청 ///////////////////
	//////////////// 광고 수락 ///////////////////
	///////////////  요청 목록 삭제 ///////////////
	///////////////  요청  ///////////////
	
}

