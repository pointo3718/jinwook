package com.jinwook.home.service.admin;

import java.util.List;

import com.jinwook.home.service.domain.Complain;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;

public interface AdminService {

		public User getUserAdmin(String userId); // 유저 상세

		public List<User> getUserListAdmin();	// 유저 목록
		
		public List<Store> getStoreListAdmin();	// 상점 목록
		
		
		public List<User> getBlacklistAdmin();	// 상점 목록
		
		public int getBlacklistAdmin();	// 상점 목록


}
