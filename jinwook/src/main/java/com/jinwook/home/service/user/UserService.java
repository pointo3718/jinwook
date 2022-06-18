package com.jinwook.home.service.user;



import com.jinwook.home.service.domain.User;


public interface UserService {

		public void addUser(User user) throws Exception;
		
		public User getUser(String userId) throws Exception;
		
		public void updateUser(User user) throws Exception;
		
		public void deleteUser(User user) throws Exception;
		
		public int checkId(String userId) throws Exception;
		
		public int checkNickName(String nickName) throws Exception;
		
		public int checkPhone(String phone) throws Exception;
		
		public int checkEmail(String email) throws Exception;
		
		public int confirmPassword(User user) throws Exception;
		
		public User findIdPhone(User user) throws Exception;
	
		public User findIdEmail(User user) throws Exception;
		
		public User findPasswordPhone(User user) throws Exception;
		
		public User findPasswordEmail(User user) throws Exception;
		
		public User updatePassword(User user) throws Exception; 
		
		public void sendIdEmail(User user) throws Exception;
		
		public void sendPasswordEmail(User user) throws Exception;
		
		public void sendAuthNum(String email, String authNum) throws Exception;
		
		//----------------------------------
		public boolean emailCheck(String username, String email) throws Exception;
		 
		public boolean phoneCheck(String username, String phone) throws Exception;
		//----------------------------------
		public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber);
		
}
