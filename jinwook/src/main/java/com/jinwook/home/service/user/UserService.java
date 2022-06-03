package com.jinwook.home.service.user;


import com.jinwook.home.service.domain.User;

public interface UserService {

		public void addUser(User user) throws Exception;
		
		public User getUser(String userId) throws Exception;
		
		public void updateUser(User user) throws Exception;
		
		public void deleteUser(User user) throws Exception;
		
		public int checkId(String userId) throws Exception;
		
		public boolean checkNickName(String nickName) throws Exception;
		
		public boolean checkPhone(String phone) throws Exception;
		
		public boolean checkEmail(String email) throws Exception;
		
		public User findIdPhone(User user) throws Exception;
	
		public User findIdEmail(User user) throws Exception;
		
		public User findPasswordPhone(User user) throws Exception;
		
		public User findPasswordEmail(User user) throws Exception;
		
		public void updatePassword(User user) throws Exception; 
}
