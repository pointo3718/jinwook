package com.jinwook.home.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;

@Mapper
public interface RequestMapper {

	public int addRequestAddStore(Store store);  		// 상점 등록 신청
	
	public int updateRequestAddStore(int storeNo);  	// 상점 등록 수락
	
	public Store checkStoreStatus(int storeNo);  	// 상점 등록 수락 확인을 위한 method

	

}
