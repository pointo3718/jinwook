package com.jinwook.home.service.request;

import java.util.List;

import com.jinwook.home.service.domain.Request;
import com.jinwook.home.service.domain.Store;

public interface RequestService {

	public void addRequestAddStore(Store store);  						// 상점 예비 등록 
	
//	
//	public Request getRequestStore(int reqNo);							// 상점 등록 요청 보기
//	
//	public int updateRequestAddStore(int storeNo);						// 상점 등록 수락
//	
//	public int addRequestRefund(Request request);						// 환급 요청 등록
//
//	public int updateRequestRefund(Request request);					// 환급 요청 수락 (진욱페이 차감)
//
//	public int addRequestDeleteStore(Request request);					// 상점 삭제 신청
//	
//	public Request countPickup (int storeNo);							// 남은 픽업 준비중 개수
//	
//	public int deleteStore(Request request);							// 상점 삭제 수락
//	
//	public int addRequestAd(Request request);							// 광고 등록 신청
//	
//	public Request getRequestAd(int reqNo);								// 광고 등록 신청 보기
//	
//	public List<Request> getRequestAdStoreList(String userId);			// 상점/광고 신청 목록 보기
//		
//	public int updateRequestStatusToAccept(int reqNo);					// 요청 상태 변경 (수락)
//	
//	public int updateRequestStatusToRefuse(int reqNo);					// 요청 상태 변경 (거절)
//	
//	public List<Request> getRequestListForAdmin(Request request);  		// 요청 목록
//	
//	public int getRequestTotalCount(Request request);  					// 요청 목록 개수
	
//	public int deleteRequest(int reqNo);								// 요청 목록 삭제 (상태변경)
			
//	// 대기중인 요청 목록 개수
//	public int CountRequestWaiting(String reqCode);						// 대기중인 요청목록 개수 (뱃지로 띄워줄 예정)

}
