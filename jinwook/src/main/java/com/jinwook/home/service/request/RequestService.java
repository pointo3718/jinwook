package com.jinwook.home.service.request;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jinwook.home.service.domain.Attach;
import com.jinwook.home.service.domain.Request;
import com.jinwook.home.service.domain.Store;

public interface RequestService {

	public void addRequestAddStore(Store store, MultipartHttpServletRequest mpRequest) throws Exception;  						// 상점 예비 등록 
	
	public Request getRequestStore(int reqNo);							// 상점 등록 요청 보기

	public boolean updateRequestAddStore(int storeNo);					// 상점 등록 수락

	public boolean addRequestRefund(Request request);					// 환급 요청 등록

	public boolean updateRequestRefund(Request request);				// 환급 요청 수락 (진욱페이 차감)

	public boolean addRequestDeleteStore(Request request);				// 상점 삭제 신청
	
	public int countPickup (int storeNo);								// 남은 픽업 준비중 개수
	
	public boolean deleteStore(Request request);						// 상점 삭제 수락
	
	public boolean addRequestAd(Request request, MultipartHttpServletRequest mpRequest) throws Exception;  							// 광고 등록 신청
	
	public Request getRequestAd(int reqNo);								// 광고 등록 신청 보기
	
	public List<Request> getRequestAdStoreList(String userId);			// 상점/광고 신청 목록 보기
		
	public int updateRequestStatusToAccept(int reqNo);					// 요청 상태 변경 (수락) -> 광고 요청 수락
	
	public int updateRequestStatusToRefuse(int reqNo);					// 요청 상태 변경 (거절)
	
	public List<Request> getRequestListForAdmin(Request request);  		// 요청 목록
		
	public int deleteRequest(int reqNo);								// 요청 목록 삭제 (상태변경)
				
	public int CountRequestWaiting(String reqCode);						// 대기중인 요청목록 개수 (뱃지로 띄워줄 예정)

	public Attach selectStoreAttachList(int storeNo); 					// 상점 사진 조회
	
	public Attach selectReqAttachList(int reqNo); 						// 광고 사진 조회

}
