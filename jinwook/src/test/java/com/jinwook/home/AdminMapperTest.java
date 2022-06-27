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
	
	
	///////////////// 유저 상세 //////////////////
	@Test
	public void testOfSelectUserDetail() {
		User user = adminMapper.getUserAdmin("test02");
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
	
	
	///////////////// 유저 목록 //////////////////
	@Test
	public void testSelectUserList() {
		
		User user2 = new User();
		
		int userTotalCount = adminMapper.getUserTotalCount(user2);
		if (userTotalCount > 0) {
			List<User> userList = adminMapper.getUserListAdmin(user2);
			
			// 리스트가 비어있는지 체크
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
	

	///////////////// 상점 목록 //////////////////
	@Test
	public void testSelectStoreList() {
		
		Store store2 = new Store();
		
		int storeTotalCount = adminMapper.getStoreTotalCount(store2); // 목록 개수
		if (storeTotalCount > 0) {
			List<Store> storeList = adminMapper.getStoreListAdmin(store2);
			
			// 리스트가 비어있는지 체크
			if (CollectionUtils.isEmpty(storeList) == false) { 	
				for (Store store : storeList) {
					System.out.println("=========================");
					System.out.println(store.getStoreNo());
					System.out.println(store.getStoreName());
					System.out.println(store.getStoreAddr());
					System.out.println(store.getUserId());
					
					User user = adminMapper.getUserAdmin(store.getUserId()); 
					System.out.println(user.getUserName());
					System.out.println(user.getBusinessNo());
					System.out.println("=========================");
				}
			}
		}
	}

	
	///////////////// 신고 목록 //////////////////
	@Test
	public void testSelectComplainList() {
		
		Complain complain2 = new Complain();
		
		int complainTotalCount = adminMapper.getComplainTotalCount(complain2);
		if (complainTotalCount > 0) {
			List<Complain> complainList = adminMapper.getComplainListAdmin(complain2);
			
			// 리스트가 비어있는지 체크
			if (CollectionUtils.isEmpty(complainList) == false) { 		
				for (Complain complain : complainList) {
					System.out.println("=========================");
					System.out.println(complain.getComplainNo());
					System.out.println(complain.getUserId());
					
					System.out.println(complain.getComplainId());
					System.out.println(complain.getComplainDate());
					System.out.println(complain.getComplainCode());
					System.out.println("=========================");
				}
			}
		}
	}
	
	
	///////////////// 블랙리스트 목록 //////////////////
	@Test
	public void testSelectBliacklist() {
		
		User user2 = new User();
		
		int blacklistTotalCount = adminMapper.getBlacklistTotalCount(user2);
		if (blacklistTotalCount > 0) {
			List<User> blacklist = adminMapper.getBlacklistAdmin(user2);
	
			// 리스트가 비어있는지 체크
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
	
	
	///////////////// 블랙리스트 등록 //////////////////
	@Test
	public void testOfUpdateBlacklist() {
		Complain complain = new Complain();
		complain.getUser().setBlackPeriod("6month");
		complain.getUser().setUserId("jw1111");
		
		int result = adminMapper.updateBlacklist(complain);
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
