package com.jinwook.home.service.user;


import com.jinwook.home.service.domain.User;

public interface UserService {

		public void addUser(User user);
		
		public User getUser(String userId);
		
		public void updateUser(User user);
		
		public void deleteUser(User user);
		
		public boolean checkId(String userId);
		
		public boolean checkPassword(String password);
		
		public boolean checkNickName(String nickName);
		
		public boolean checkEmail(String email);
		
		
	
}
