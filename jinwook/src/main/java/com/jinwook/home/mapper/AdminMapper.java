package com.jinwook.home.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.domain.Complain;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;


@Mapper
public interface AdminMapper {

	public User getUserAdmin(String userId);  						// 유저 상세정보
	
	public List<User> getUserListAdmin(User user);					// 유저 목록
	
	public List<Store> getStoreListAdmin(Store store);				// 상점 목록
	
	public int addComplain();										// 신고 등록
	
	public List<Complain> getComplainListAdmin(Complain complain);	// 신고 목록
	
	public List<User> getBlacklistAdmin(User user);					// 블랙리스트 목록

	public int updateBlacklist(Complain complain);					// 블랙리스트 등록
	
	public int updateComplainStatus(int complainNo);				// 신고 상태 변경
		
	public int getUserTotalCount(User user);						// 유저 목록 개수
	
	public int getStoreTotalCount(Store store);						// 상점 목록 개수
	
	public int getComplainTotalCount(Complain complain);			// 신고 목록 개수
	
	public int getComplainTotalCountAll();							// 대기중인 신고 목록 개수
	public int getWatingInquiryCount();	// 대기중인 문의 목록 개수
	
	public int getBlacklistTotalCount(User user);					// 블랙리스트 목록 개수


}
