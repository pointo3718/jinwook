package com.jinwook.home.service.user;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.jinwook.home.mapper.UserMapper;
import com.jinwook.home.service.domain.User;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService{
	
	///Field
	@Autowired
	@Qualifier("userMapper")
	private UserMapper userMapper;
	public void setuserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addUser(User user) {
		userMapper.addUser(user);
	}

	public User getUser(String userId) {
		return userMapper.getUser(userId);
	}

//	public Map<String , Object > getUserList(Search search) throws Exception {
//		List<User> list= userMapper.getUserList(search);
//		int totalCount = userMapper.getTotalCount(search);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list );
//		map.put("totalCount", new Integer(totalCount));
//		
//		return map;
//	}

	public void updateUser(User user)  {
		userMapper.updateUser(user);
	}

	public void deleteUser(User user) {
		userMapper.deleteUser(user);
		
	}
	public boolean checkId(String userId) {
		boolean result=true;
		User user=userMapper.getUser(userId);
		if(user != null) {
			result=false;
		}
		return result;
	}
	
	public boolean checkPassword(String password) {
		boolean result=true;
		User user=userMapper.getUser(password);
		if(user != null) {
			result=false;
		}
		return result;
	}
	
	public boolean checkNickName(String nickName) {
		boolean result=true;
		User user=userMapper.getUser(nickName);
		if(user != null) {
			result=false;
		}
		return result;
	}
	
	public boolean checkEmail(String email) {
		boolean result=true;
		User user=userMapper.getUser(email);
		if(user != null) {
			result=false;
		}
		return result;
	}

}