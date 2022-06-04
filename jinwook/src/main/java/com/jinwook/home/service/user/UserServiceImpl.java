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
	public void setuserMapper(UserMapper userMapper) throws Exception{
		this.userMapper = userMapper;
	}
	
	/*
	///Constructor
	public UserServiceImpl() throws Exception {
		System.out.println(this.getClass());
	}
	*/

	///Method
	public void addUser(User user) throws Exception {
		userMapper.addUser(user);
	}

	public User getUser(String userId) throws Exception {
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

	public void updateUser(User user) throws Exception{
		userMapper.updateUser(user);
	}

	public void deleteUser(User user) throws Exception{
		userMapper.deleteUser(user);
	}
	
	public int checkId(String userId) throws Exception {
		int result=userMapper.checkId(userId);
		return result;
	}
	
	public int checkNickName(String nickName) throws Exception {
		int result = userMapper.checkNickName(nickName);
		return result;
	}
	
	public int checkPhone(String phone) throws Exception{
		int result = userMapper.checkPhone(phone);
		return result;
	}
	
	public int checkEmail(String email) throws Exception {
		int result = userMapper.checkEmail(email);
		return result;
	}
	
	public int checkPassword(String userId, String password) throws Exception {
		int result = userMapper.checkPassword(userId, password);
		return result;
	}
	
	public User findIdPhone(User user) throws Exception {
		return userMapper.findIdPhone(user);
	}
	
	public User findIdEmail(User user) throws Exception {
		return userMapper.findIdEmail(user);
	}
	
	public User findPasswordPhone(User user) throws Exception {
		return userMapper.findPasswordPhone(user);
	}
	
	public User findPasswordEmail(User user) throws Exception {
		return userMapper.findPasswordEmail(user);
	}
	
	public void updatePassword(User user) throws Exception {
		userMapper.updateUser(user);
//		userMapper.updatePassword(user);
	}

}