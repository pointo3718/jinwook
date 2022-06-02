package com.jinwook.home.service.admin;

import java.util.List;

import com.jinwook.home.service.domain.Complain;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;

public interface AdminService {

		public User getUserAdmin(String userId); // ���� ��

		public List<User> getUserListAdmin();	// ���� ���
		
		public List<Store> getStoreListAdmin();	// ���� ���
		
		public List<Complain> getComplainListAdmin();	// ���� ���

}
