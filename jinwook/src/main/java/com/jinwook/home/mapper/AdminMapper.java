package com.jinwook.home.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.service.domain.Complain;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;


@Mapper
public interface AdminMapper {

	public User getUserAdmin(String userId);  		// 유저 상세정보
	
	public List<User> getUserListAdmin();			// 유저 목록
	
	public List<Store> getStoreListAdmin();			// 상점 목록
	
	public int addComplain();						// 신고 등록
	
	public List<Complain> getComplainListAdmin();	// 신고 목록
	
	public List<User> getBlacklistAdmin();			// 블랙리스트 목록

	public int updateBlacklist(User user);			// 블랙리스트 등록
	
	public int getUserTotalCount();				// 유저 목록 개수
	
	public int getStoreTotalCount();			// 상점 목록 개수
	
	public int getComplainTotalCount();			// 신고 목록 개수
	
	public int getBlacklistTotalCount();		// 블랙리스트 목록 개수


}
