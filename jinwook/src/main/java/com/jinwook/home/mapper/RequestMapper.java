package com.jinwook.home.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.service.domain.Request;
import com.jinwook.home.service.domain.Store;

@Mapper
public interface RequestMapper {
	
	public int addRequestAddStoreForAdmin(Request request);			// 상점 등록 요청 등록

	public int addRequestAddStore(Store store);  					// 상점 예비 등록 
	
	public Request getRequestStore(int reqNo);						// 상점 등록 요청 보기
	
	public int updateRequestAddStore(int storeNo);					// 상점 등록 수락
	
	public int addRequestRefund(Request request);					// 환급 요청 등록

	public int updateRequestRefund(String userId);					// 환급 요청 수락

	public int addRequestDeleteStore(Request request);				// 상점 삭제 신청
	
	public Request countPickup (int storeNo);					// 남은 픽업 준비중 개수
	
	public int deleteStore(Request request);						// 상점 삭제 수락
	
	public int addRequestAd(Request request);						// 광고 등록 신청
	
	public Request getRequestAd(int reqNo);							// 광고 등록 신청 보기
	
	public int updateRequestStatusToAccept(int reqNo);				// 요청 상태 변경 (수락)
	
	public int updateRequestStatusToRefuse(int reqNo);				// 요청 상태 변경 (거절)
	
	public int deleteRequest(int reqNo);							// 요청 목록 삭제 (상태변경)
		
	public Store checkStoreStatus(int storeNo);  					// ***삭제예정*** (상점 등록 수락 확인을 위한 method)

	
	
//	public addRequestRefund	// 환급 신청
//	public updateJpay // 환급 수락, 진욱페이 차감

}
