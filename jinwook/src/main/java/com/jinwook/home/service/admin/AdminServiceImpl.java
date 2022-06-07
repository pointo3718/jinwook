package com.jinwook.home.service.admin;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.common.PaginationInfo;
import com.jinwook.home.mapper.AdminMapper;
import com.jinwook.home.service.domain.Complain;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper adminMapper;
	
		
	///////////////// 유저 상세 //////////////////	
	@Override
	public User getUserAdmin(String userId) {
		return adminMapper.getUserAdmin(userId);
	}
	
	
	///////////////// 유저 목록 //////////////////
	@Override
	public List<User> getUserListAdmin(User user) {
		List<User> userList = Collections.emptyList();

		int userTotalCount = adminMapper.getUserTotalCount(user);
		
		PaginationInfo paginationInfo = new PaginationInfo(user);
		paginationInfo.setTotalRecordCount(userTotalCount);

		user.setPaginationInfo(paginationInfo);
		
		if (userTotalCount > 0) {
			userList = adminMapper.getUserListAdmin(user);
		}

		return userList;
	}
	
	
	///////////////// 상점 목록 //////////////////
	@Override
	public List<Store> getStoreListAdmin(Store store) {
		List<Store> storeList = Collections.emptyList();
	
		int storeTotalCount = adminMapper.getStoreTotalCount(store);

		PaginationInfo paginationInfo = new PaginationInfo(store);
		paginationInfo.setTotalRecordCount(storeTotalCount);

		store.setPaginationInfo(paginationInfo);
		
		if (storeTotalCount > 0) {
			storeList = adminMapper.getStoreListAdmin(store);
		}
	
		return storeList;
	}
	
	///////////////// 신고 목록 //////////////////
	@Override
	public List<Complain> getComplainListAdmin(Complain complain) {
		List<Complain> complainList = Collections.emptyList();
	
		int complainTotalCount = adminMapper.getComplainTotalCount(complain);

		PaginationInfo paginationInfo = new PaginationInfo(complain);
		paginationInfo.setTotalRecordCount(complainTotalCount);

		complain.setPaginationInfo(paginationInfo);
		
		if (complainTotalCount > 0) {
			complainList = adminMapper.getComplainListAdmin(complain);
		}
	
		return complainList;
	}
	

	///////////////// 블랙리스트 목록 //////////////////
	@Override
	public List<User> getBlacklistAdmin(User user) {
		List<User> blacklist = Collections.emptyList();

		int blacklistTotalCount = adminMapper.getBlacklistTotalCount(user);

		PaginationInfo paginationInfo = new PaginationInfo(user);
		paginationInfo.setTotalRecordCount(blacklistTotalCount);

		user.setPaginationInfo(paginationInfo);
		
		if (blacklistTotalCount > 0) {
			blacklist = adminMapper.getBlacklistAdmin(user);
		}
		return blacklist;
	}
	
	
	///////////////// 블랙리스트 등록 //////////////////	
	@Override
	public boolean updateBlacklist(User user) {
		int queryResult = 0;

		user = adminMapper.getUserAdmin("test01");

		if (user != null && user.isBlacklistStatus() == true) {
			queryResult = adminMapper.updateBlacklist(user);
		}

		return (queryResult == 1) ? true : false;
	}
	
}


