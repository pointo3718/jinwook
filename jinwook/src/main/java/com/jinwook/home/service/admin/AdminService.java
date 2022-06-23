package com.jinwook.home.service.admin;

import java.util.List;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.domain.Chart;
import com.jinwook.home.service.domain.Complain;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;

public interface AdminService {

		public User getUserAdmin(String userId); // 유저 상세 

		public List<User> getUserListAdmin(User user);	// 유저 목록
		
		public List<Store> getStoreListAdmin(Store store);	// 상점 목록
		
		public List<Complain> getComplainListAdmin(Complain complain);	// 신고 목록
		
		public boolean deleteComplain(int complainNo);	// 신고 목록 삭제
		
		public List<User> getBlacklistAdmin(User user);	// 블랙리스트 목록 
		
		public boolean	updateBlacklist(Complain complain);	// 블랙리스트 등록 
		
		public int	getComplainTotalCount();	// 대기중인 신고목록 개수 
		
		public int	getWatingInquiryCount();	// 대기중인 문의목록 개수 

		public List<Chart>	getJoinForMonthChart();		// 월별 회원가입 수

		public List<Chart> getUserByRole();				// 역할별 사용자 통계
		
		public List<Chart> getOrderCountAndPrice();		// 월별 주문량, 주문금액

		public List<Chart> getUserType();				// 사용자 유형 (일반/블랙/탈퇴)

}
