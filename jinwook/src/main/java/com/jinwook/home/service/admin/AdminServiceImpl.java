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
	
		
	///////////////// ���� �� //////////////////	
	@Override
	public User getUserAdmin(String userId) {
		return adminMapper.getUserAdmin(userId);
	}
	
	
	///////////////// ���� ��� //////////////////
	@Override
	public List<User> getUserListAdmin() {
		List<User> userList = Collections.emptyList();

		int userTotalCount = adminMapper.getUserTotalCount();

		if (userTotalCount > 0) {
			userList = adminMapper.getUserListAdmin();
		}

		return userList;
	}
	
	
	///////////////// ���� ��� //////////////////
	@Override
	public List<Store> getStoreListAdmin() {
		List<Store> storeList = Collections.emptyList();
	
		int storeTotalCount = adminMapper.getStoreTotalCount();
	
		if (storeTotalCount > 0) {
			storeList = adminMapper.getStoreListAdmin();
		}
	
		return storeList;
	}
	
	///////////////// �Ű� ��� //////////////////
	@Override
	public List<Complain> getComplainListAdmin() {
		List<Complain> complainList = Collections.emptyList();
	
		int complainTotalCount = adminMapper.getComplainTotalCount();
	
		if (complainTotalCount > 0) {
			complainList = adminMapper.getComplainListAdmin();
		}
	
		return complainList;
	}
	
	
	
}

