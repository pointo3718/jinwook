package com.jinwook.home.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.service.domain.Complain;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;


@Mapper
public interface AdminMapper {

	public User getUserAdmin(String userId);  		// ���� ������
	
	public List<User> getUserListAdmin();			// ���� ���
	
	public List<Store> getStoreListAdmin();			// ���� ���
	
	public List<Complain> getComplainListAdmin();	// �Ű� ���
	
	public List<User> getBlacklistAdmin();			// ������Ʈ ���

	public int updateBlacklist(User user);	// ������Ʈ ���
	
	
	public int getUserTotalCount();				// ���� ��� ����
	
	public int getStoreTotalCount();			// ���� ��� ����
	
	public int getComplainTotalCount();			// �Ű� ��� ����
	
	public int getBlacklistTotalCount();		// ������Ʈ ��� ����


}
