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
		Request request = requestMapper.getRequestStore(10003);
		try {
			//String boardJson = new ObjectMapper().writeValueAsString(board);
            String requestJson = new ObjectMapper().registerModule(new JavaTimeModule()).writeValueAsString(request);
            System.out.println("=========================");
			System.out.println(requestJson);
			System.out.println("=========================");
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
	
	
	////////////////// 남은 픽업준비중 개수 /////////////////
	@Test
	public void testOfSelectCountPickup() {
		Request request = requestMapper.countPickup(10000);
		try {
			//String boardJson = new ObjectMapper().writeValueAsString(board);
            String requestJson = new ObjectMapper().registerModule(new JavaTimeModule()).writeValueAsString(request);
            System.out.println("=========================");
			System.out.println(requestJson);
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
	public void testOfUpdateRequestRefund() {	
		int result = requestMapper.updateRequestRefund("test05");
		System.out.println("결과는 " + result + "입니다.");
	}

	
	//////////////// 광고 신청 ///////////////////
	@Test
	public void testOfSelectRequestAd() {
		Request request = new Request();
		request.setUserId("test05");
		request.setStoreNo(10011); 
		request.setAdTitle("선경이네에서 광고 신청 합니다.");
		request.setAdContent("안녕하세요... 광고 신청합니다!! 선경이네는 산지 직송 신선식품만 취급합니다~! 사진보시고 알아서 광고 등록 해주세요"); 
		request.setAdImg("선경이네_광고_사진.jpg");  
		
		int result = requestMapper.addRequestAd(request);
		System.out.println("결과는 " + result + "입니다.");
	}
	
	
	/////////////// 광고 신청 보기 /////////////////
	@Test
	public void testOfSelectRequestAdDetail() {
		Request request = requestMapper.getRequestAd(10005);
		try {
			//String boardJson = new ObjectMapper().writeValueAsString(board);
            String requestJson = new ObjectMapper().registerModule(new JavaTimeModule()).writeValueAsString(request);
            System.out.println("=========================");
			System.out.println(requestJson);
			System.out.println("=========================");
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
	
	
	/////////////// 상점 삭제 신청 ////////////////
	@Test
	public void testOfUpdateRequestDelete() {
		Request request = new Request();
		request.setUserId("test13");
		request.setStoreNo(10014);  // 서비스에서 어떻게 가져올지 ?
		int result = requestMapper.addRequestDeleteStore(request);
		System.out.println("결과는 " + result + "입니다.");
	}
	
	
	///////////////  상점 삭제  //////////////////
	@Test
	public void testOfUpdateStoreDelete() {
		Request request = new Request();
		request.setUserId("test13");
		request.setStoreNo(10014);  // 서비스에서 어떻게 가져올지 ?
		int result = requestMapper.deleteStore(request);
		System.out.println("결과는 " + result + "입니다.");
	}
	
	////////////////////공용 ////////////////////
	//////////////// 요청 수락 ///////////////////
	@Test
	public void testOfUpdateRequestStatusForAccept() {	
		int result = requestMapper.updateRequestStatusToAccept(10004);
		System.out.println("결과는 " + result + "입니다.");
	}
	
	
	////////////////////공용 ////////////////////
	/////////////// 요청 거절 ////////////////////
	@Test
	public void testOfUpdateRequestStatusforRefuse() {	
		int result = requestMapper.updateRequestStatusToRefuse(10001);
		System.out.println("결과는 " + result + "입니다.");
	}
	
	
	///////////////  요청 목록들 확인하고 테스트 ///////////////

	
	
	///////////////  요청 목록 삭제 ///////////////
	@Test
	public void testOfUpdateDeleteStatus() {	
		int result = requestMapper.updateRequestStatusToRefuse(10004);
		System.out.println("결과는 " + result + "입니다.");
	}	
	
	
	
}

