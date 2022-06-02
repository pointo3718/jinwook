package com.jinwook.home;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.CollectionUtils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.jinwook.home.mapper.AdminMapper;
import com.jinwook.home.service.domain.Complain;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;


@SpringBootTest
public class AdminMapperTest {

	@Autowired
	private AdminMapper adminMapper;
	
	
	///////////////// ���� �� //////////////////
	@Test
	public void testOfSelectDetail() {
		User user = adminMapper.getUserAdmin("test01");
		try {
			//String boardJson = new ObjectMapper().writeValueAsString(board);
            String userJson = new ObjectMapper().registerModule(new JavaTimeModule()).writeValueAsString(user);

			System.out.println("=========================");
			System.out.println(userJson);
			System.out.println("=========================");

		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
	
	
	///////////////// ���� ��� //////////////////
	@Test
	public void testSelectUserList() {
		int userTotalCount = adminMapper.getUserTotalCount();
		if (userTotalCount > 0) {
			List<User> userList = adminMapper.getUserListAdmin();
			
			// ����Ʈ�� ����ִ��� üũ
			if (CollectionUtils.isEmpty(userList) == false) { 		
				for (User user : userList) {
					System.out.println("=========================");
					System.out.println(user.getUserId());
					System.out.println(user.getUserName());
					System.out.println(user.getPhone());
					System.out.println(user.getRole());
					System.out.println("=========================");
				}
			}
		}
	}
	
	
	///////////////// ���� ��� //////////////////
	@Test
	public void testSelectStoreList() {
		int storeTotalCount = adminMapper.getStoreTotalCount();
		if (storeTotalCount > 0) {
			List<Store> storeList = adminMapper.getStoreListAdmin();
			
			// ����Ʈ�� ����ִ��� üũ
			if (CollectionUtils.isEmpty(storeList) == false) { 	
				for (Store store : storeList) {
					System.out.println("=========================");
					System.out.println(store.getStoreNo());
					System.out.println(store.getStoreName());
					System.out.println(store.getUserId());
					System.out.println(store.getStoreAddr());
					/////////////////////////////////////////
					//////// userVO�� ���� �� ���� �ʿ�//////////
					///////userName, phone, businessNo//////
					System.out.println("=========================");
				}
			}
		}
	}

	///////////////// �Ű� ��� //////////////////
	@Test
	public void testSelectComplainList() {
		int complainTotalCount = adminMapper.getComplainTotalCount();
		if (complainTotalCount > 0) {
			List<Complain> complainList = adminMapper.getComplainListAdmin();
			
			// ����Ʈ�� ����ִ��� üũ
			if (CollectionUtils.isEmpty(complainList) == false) { 		
				for (Complain complain : complainList) {
					System.out.println("=========================");
					System.out.println(complain.getComplainNo());
					System.out.println(complain.getUserId());
					
					System.out.println(complain.getComplainId());
					System.out.println(complain.getComplainDate());
					System.out.println(complain.getComplainCode());
					System.out.println(complain.getComplainTarget());
					System.out.println("=========================");
				}
			}
		}
	}
	
	
	///////////////// ������Ʈ ��� //////////////////
	@Test
	public void testSelectBliacklist() {
		int blacklistTotalCount = adminMapper.getBlacklistTotalCount();
		if (blacklistTotalCount > 0) {
			List<User> blacklist = adminMapper.getBlacklistAdmin();
	
			// ����Ʈ�� ����ִ��� üũ
			if (CollectionUtils.isEmpty(blacklist) == false) { 		
				for (User user : blacklist) {
				System.out.println("=========================");
				System.out.println(user.getUserId());
				System.out.println(user.getUserName());
				System.out.println(user.getNickName());
				System.out.println(user.getBirth());
				System.out.println(user.getGender());
				System.out.println(user.getEmail());
				System.out.println(user.getPhone());
				System.out.println(user.getBlacklistRegDate());
				System.out.println(user.getBlacklistEndDate());
				System.out.println("=========================");
				}
			}
		}
	}
	
	
	///////////////// ������Ʈ ��� //////////////////
	@Test
	public void testOfUpdateBlacklist() {
		User user = new User();
		user.setBlackPeriod("7days");
		user.setUserId("test01");
		

		int result = adminMapper.updateBlacklist(user);
		if (result == 1) {
			User user2 = adminMapper.getUserAdmin("test01");
			try {
				//String boardJson = new ObjectMapper().writeValueAsString(board);
                String userJson = new ObjectMapper().registerModule(new JavaTimeModule()).writeValueAsString(user2);

				System.out.println("=========================");
				System.out.println(userJson);
				System.out.println("=========================");

			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		}
	}

	
}
