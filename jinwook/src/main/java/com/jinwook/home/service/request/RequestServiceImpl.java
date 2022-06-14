package com.jinwook.home.service.request;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jinwook.home.common.PaginationInfo;
import com.jinwook.home.mapper.RequestMapper;
import com.jinwook.home.service.domain.Request;
import com.jinwook.home.service.domain.Store;


@Service
public class RequestServiceImpl implements RequestService {
	
	
	@Autowired
	private RequestMapper requestMapper;
	
	
	// ========== 상점 등록 요청 ===========
	// 1.상점 예비 등록  2.예비 등록된 storeNo + userId 가져오기  3. storeNo + userId 포함해 요청 넣기
	@Override
	public void addRequestAddStore(Store store) {		
		requestMapper.addRequestAddStore(store); 			// 1. 상점 예비 등록
		
		Store newStore = requestMapper.getNewStore();
		int storeNo = newStore.getStoreNo(); 				// 2. 예비 등록된 storeNo
		String userId = newStore.getUserId();  				// 2. 예비 등록된 상점의 userId
		
		Request request = new Request();
		request.setStoreNo(storeNo);
		request.setUserId(userId);
		requestMapper.addRequestAddStoreForAdmin(request);	// 3. storeNo + userId 포함해 요청 넣기
	}

	
	// ========== 상점 등록 요청 보기 ===========
	@Override
	public Request getRequestStore(int reqNo) {
		return requestMapper.getRequestStore(reqNo);
	}

	
	// ========== 상점 등록 요청 수락 ===========
	// 1.reqStatus 변경  2. 상점 등록
	@Override
	public boolean updateRequestAddStore(int reqNo) {
		requestMapper.updateRequestStatusToAccept(reqNo); // 1. reqStatus 변경
		
		int queryResult = 0;
		Request request = requestMapper.getRequestStore(reqNo);
		System.out.println(request);
		queryResult = requestMapper.updateRequestAddStore(request.getStore().getStoreNo()); // 2. 상점 등록

		return (queryResult == 1) ? true : false;
	}
	
	
	// ========== 환급 요청 등록 ===========
	@Override
	public boolean addRequestRefund(Request request) {
		int queryResult = 0;
		queryResult = requestMapper.addRequestRefund(request);

		return (queryResult == 1) ? true : false;
	}
	
	
	// ========== 환급 요청 수락 ===========
	// 1. reqStatus 변경   2. 상점 등록
	@Override
	public boolean updateRequestRefund(Request request) {
		
		requestMapper.updateRequestStatusToAccept(request.getReqNo()); // 1. reqStatus 변경
		
		int queryResult = 0;
		queryResult = requestMapper.updateRequestRefund(request); // 2. 진욱페이 차감

		return (queryResult == 1) ? true : false;
	}
	
	
	// ========== 상점 삭제 신청 ===========
	@Override
	public boolean addRequestDeleteStore(Request request) {
		int queryResult = 0;
		queryResult = requestMapper.addRequestDeleteStore(request);

		return (queryResult == 1) ? true : false;
	}


	// =========== 남은 픽업개수 ===========
	@Override
	public int countPickup(int storeNo) {
		
		System.out.println(storeNo);
		
		Request request = requestMapper.countPickup(storeNo);
		int countPickup = request.getCountPickup();
		
		return countPickup;
	}
	
	
	// ========== 상점 삭제 수락 ===========
	// 1. reqStatus 변경   2. 상점 삭제
	@Override
	public boolean deleteStore(Request request) {
		requestMapper.updateRequestStatusToAccept(request.getReqNo()); // 1. reqStatus 변경
			
		int queryResult = 0;
		queryResult = requestMapper.deleteStore(request); // 2. 상점 등록

		return (queryResult == 1) ? true : false;
	}

	// ========== 광고 등록 신청 ===========
	@Override
	public boolean addRequestAd(Request request) {
		int queryResult = 0;
		queryResult = requestMapper.addRequestAd(request);

		return (queryResult == 1) ? true : false;
	}
	
	
	// ========== 광고 등록 요청 보기 ===========
	@Override
	public Request getRequestAd(int reqNo) {
		return requestMapper.getRequestAd(reqNo);
	}
	
	
	// ========== 광고 등록 요청 수락 ===========
	@Override
	public int updateRequestStatusToAccept(int reqNo) {
		return requestMapper.updateRequestStatusToAccept(reqNo);
	}
	
	
	// ============= 요청 거절 ================
	@Override
	public int updateRequestStatusToRefuse(int reqNo) {
		return requestMapper.updateRequestStatusToRefuse(reqNo);
	}
	
	
	// ========== 상점/광고 신청 목록 (사장님용) ============
	@Override
	public List<Request> getRequestAdStoreList(String userId) {		
		List<Request> adStoreList = Collections.emptyList();

		int adStoreTotalCount = requestMapper.getRequestAdStoreTotalCount(userId);
		
		if (adStoreTotalCount > 0) {
			adStoreList = requestMapper.getRequestAdStoreList(userId);
		}
		return adStoreList;
	}
	
	
	// ============== 요청 목록 (관리자용) ================
	@Override
	public List<Request> getRequestListForAdmin(Request request) {		
		List<Request> requestStoreList = Collections.emptyList();

		int requestTotalCount = requestMapper.getRequestTotalCount(request);
		
		PaginationInfo paginationInfo = new PaginationInfo(request);
		paginationInfo.setTotalRecordCount(requestTotalCount);

		request.setPaginationInfo(paginationInfo);
		
		if (requestTotalCount > 0) {
			requestStoreList = requestMapper.getRequestListForAdmin(request);
		}
		return requestStoreList;
	}
	
	
	// ================= 요청 목록 삭제 ===================
	@Override
	public int deleteRequest(int reqNo) {
		return requestMapper.deleteRequest(reqNo);
	}
	
	
	// ============== 대기중인 요청 목록 개수 ================
	@Override
	public int CountRequestWaiting(String reqCode) {
		return requestMapper.CountRequestWaiting(reqCode);
	}
	
}
