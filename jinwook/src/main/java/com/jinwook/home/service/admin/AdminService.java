package com.jinwook.home.service.admin;

import java.util.List;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.domain.Complain;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;

public interface AdminService {

		public User getUserAdmin(String userId); // 유저 상세 

		public List<User> getUserListAdmin(User user);	// 유저 목록
		
		public List<Store> getStoreListAdmin(Store store);	// 상점 목록
		
		public List<Complain> getComplainListAdmin(Complain complain);	// 신고 목록
		
		public List<User> getBlacklistAdmin(User user);	// 블랙리스트 목록 
		
		public boolean	updateBlacklist(User user);	// 블랙리스트 등록 

}
