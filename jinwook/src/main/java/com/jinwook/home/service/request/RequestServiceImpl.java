package com.jinwook.home.service.request;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	// ========== 상점 등록 요청 목록 ===========

}
