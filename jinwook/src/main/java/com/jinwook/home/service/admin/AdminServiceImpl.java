package com.jinwook.home.service.admin;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.common.PaginationInfo;
import com.jinwook.home.mapper.AdminMapper;
import com.jinwook.home.service.domain.Chart;
import com.jinwook.home.service.domain.Complain;
import com.jinwook.home.service.domain.Request;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper adminMapper;
	
	
	////////////// 카테고리별 상점 목록 ///////////////
	@Override
	public List<Store> getStoreList(String storeType) {
		List<Store> storeList = Collections.emptyList();

		storeList = adminMapper.getStoreList(storeType);	
		return storeList;
	}
	
		
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
	
	///////////////// 레시피 신고 등록 ///////////////
	@Override
	public boolean addComplainRecipe(Complain complain) {
		int queryResult = 0;
		queryResult = adminMapper.addComplainRecipe(complain);
		
		return (queryResult == 1) ? true : false;
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
	
	
	///////////////// 신고 목록 삭제 //////////////////	
	@Override
	public boolean deleteComplain(int complainNo) {
		int queryResult = 0;
		
		queryResult = adminMapper.deleteComplain(complainNo);
		System.out.println("신고 목록 삭제 컨트롤러 통과");

		return (queryResult == 1) ? true : false;
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
	public boolean updateBlacklist(Complain complain) {
		int queryResult = 0;
		
		System.out.println(complain);

		if (complain != null && complain.getUser().isBlacklistStatus() == false) {
			adminMapper.updateBlacklist(complain);
			System.out.println("블랙리스트 등록 서비스 통과");
		}
		
		queryResult = adminMapper.updateComplainStatus(complain.getComplainNo());	// 신고 상태 변경

		return (queryResult == 1) ? true : false;
	}
	
	
	//=============== 대기중인 신고 목록 개수 =================
	@Override
	public int getComplainTotalCount() {
		return adminMapper.getComplainTotalCountAll();
	}
	
	//=============== 대기중인 문의 목록 개수 =================
	@Override
	public int getWatingInquiryCount() {
		return adminMapper.getWatingInquiryCount();
	}

	
	
	
	// 통계
	//=============== 월별 회원가입 수 =================	
	@Override
	public List<Chart> getJoinForMonthChart() {
		
		List<Chart> joinlist = Collections.emptyList();

		joinlist = adminMapper.getJoinForMonthChart();
		
		return joinlist;
	}
	
	//=============== 역할별 사용자 통계 =================	
	@Override
	public List<Chart> getUserByRole() {
		
		List<Chart> userlist = Collections.emptyList();

		userlist = adminMapper.getUserByRole();
		
		return userlist;
	}
	
	//=============== 월별 주문량, 주문금액 =================	
	@Override
	public List<Chart> getOrderCountAndPrice() {
		
		List<Chart> orderlist = Collections.emptyList();

		orderlist = adminMapper.getOrderCountAndPrice();
		
		return orderlist;
	}
	
	//=============== 사용자 유형 (일반/블랙/탈퇴) =================	
	@Override
	public List<Chart> getUserType() {
		
		List<Chart> usertypelist = Collections.emptyList();

		usertypelist = adminMapper.getUserType();
		
		return usertypelist;
	}
}

