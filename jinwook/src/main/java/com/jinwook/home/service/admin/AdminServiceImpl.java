package com.jinwook.home.service.admin;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<User> getUserListAdmin() {
		List<User> userList = Collections.emptyList();

		int userTotalCount = adminMapper.getUserTotalCount();

		if (userTotalCount > 0) {
			userList = adminMapper.getUserListAdmin();
		}

		return userList;
	}
	
	
	///////////////// 상점 목록 //////////////////
	@Override
	public List<Store> getStoreListAdmin() {
		List<Store> storeList = Collections.emptyList();
	
		int storeTotalCount = adminMapper.getStoreTotalCount();
	
		if (storeTotalCount > 0) {
			storeList = adminMapper.getStoreListAdmin();
		}
	
		return storeList;
	}
	
	///////////////// 신고 목록 //////////////////
	@Override
	public List<Complain> getComplainListAdmin() {
		List<Complain> complainList = Collections.emptyList();
	
		int complainTotalCount = adminMapper.getComplainTotalCount();
	
		if (complainTotalCount > 0) {
			complainList = adminMapper.getComplainListAdmin();
		}
	
		return complainList;
	}
	

	///////////////// 블랙리스트 목록 //////////////////
	@Override
	public List<User> getBlacklistAdmin() {
		List<User> blacklist = Collections.emptyList();

		int blacklistTotalCount = adminMapper.getBlacklistTotalCount();

		if (blacklistTotalCount > 0) {
			blacklist = adminMapper.getBlacklistAdmin();
		}

		return blacklist;
	}
	
	
	///////////////// 블랙리스트 등록 //////////////////	
	@Override
	public boolean updateBlacklist(Long idx) {
		int queryResult = 0;

		BoardDTO board = boardMapper.selectBoardDetail(idx);

		if (board != null && "N".equals(board.getDeleteYn())) {
			queryResult = boardMapper.deleteBoard(idx);
		}

		return (queryResult == 1) ? true : false;
	}
	
}


