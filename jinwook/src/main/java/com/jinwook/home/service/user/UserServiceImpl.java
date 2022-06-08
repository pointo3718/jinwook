package com.jinwook.home.service.user;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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
	
	@Autowired
	private JavaMailSender mailSender;
	
	/*
	///Constructor
	public UserServiceImpl() throws Exception {
		System.out.println(this.getClass());
	}
	*/

	///Method
	@Override
	public void addUser(User user) throws Exception {
		userMapper.addUser(user);
	}

	@Override
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

	@Override
	public void updateUser(User user) throws Exception{
		userMapper.updateUser(user);
	}

	@Override
	public void deleteUser(User user) throws Exception{
		userMapper.deleteUser(user);
	}
	
	@Override
	public int checkId(String userId) throws Exception {
		int result=userMapper.checkId(userId);
		return result;
	}
	
	@Override
	public int checkNickName(String nickName) throws Exception {
		int result = userMapper.checkNickName(nickName);
		return result;
	}
	
	@Override
	public int checkPhone(String phone) throws Exception{
		int result = userMapper.checkPhone(phone);
		return result;
	}
	
	@Override
	public int checkEmail(String email) throws Exception {
		int result = userMapper.checkEmail(email);
		return result;
	}
	
	@Override
	public int confirmPassword(User user) throws Exception {
		int result = userMapper.checkPassword(user);
		return result;
	}
	
	@Override
	public User findIdPhone(User user) throws Exception {
		return userMapper.findIdPhone(user);
	}
	
	@Override
	public User findIdEmail(User user) throws Exception {
		User dbUser =  userMapper.findIdEmail(user);
		return dbUser;
	}
	
	@Override
	public User findPasswordPhone(User user) throws Exception {
		return userMapper.findPasswordPhone(user);
	}
	
	@Override
	public User findPasswordEmail(User user) throws Exception {
		return userMapper.findPasswordEmail(user);
	}
	
	@Override
	public void updatePassword(User user) throws Exception {
		userMapper.updateUser(user);
//		userMapper.updatePassword(user);
	}
	
	@Override
	public void sendUser(String email, String userId) throws Exception{
		SimpleMailMessage simpleMailMessage = new  SimpleMailMessage();
		simpleMailMessage.setTo(email);
		simpleMailMessage.setSubject("아이디 찾기");
		
		StringBuffer sb = new StringBuffer();
		sb.append("가입하신 아이디는");
//		sb.append(System.lineSeparator());
		
//		for(int i=0;i<usernames.size()-1;i++) {
//			sb.append(usernames.get(i));
//			sb.append(System.lineSeparator());
//		}
		sb.append(userId+"입니다");
		
		simpleMailMessage.setText(sb.toString());
		
		
		new Thread(new Runnable() {
			public void run() {
				mailSender.send(simpleMailMessage);
			}
		}).start();
	}

}