package com.jinwook.home.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.service.domain.Request;
import com.jinwook.home.service.domain.Store;

@Mapper
public interface RequestMapper {
	
	public int addRequestAddStoreForAdmin(Request request);			// 상점 등록 요청 등록

	public int addRequestAddStore(Store store);  					// 상점 예비 등록 
	
	public Store getRequestStore(String userId);					// 상점 등록 요청 보기
	
	public int updateRequestAddStore(int storeNo);					// 상점 등록 수락
	
	public int addRequestRefund(Request request);					// 환급 요청 등록

	public int updateRequestRefund(String userId);					// 환급 요청 수락

	
	
	
	public int updateRequestStatusToAccept(Request request);		// 요청 상태 변경 (수락)
		
	public Store checkStoreStatus(int storeNo);  					// ***삭제예정*** (상점 등록 수락 확인을 위한 method)

	
	
//	public addRequestRefund	// 환급 신청
//	public updateJpay // 환급 수락, 진욱페이 차감

}
