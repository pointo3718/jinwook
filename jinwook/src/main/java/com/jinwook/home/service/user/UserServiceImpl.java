package com.jinwook.home.service.user;


import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

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
		return userMapper.findIdEmail(user);
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
	public void sendIdUser(User user) throws Exception{
		SimpleMailMessage simpleMailMessage = new  SimpleMailMessage();
		simpleMailMessage.setTo(user.getEmail());
		simpleMailMessage.setSubject("[진욱이네] 아이디 안내를 드립니다.");
		
		StringBuffer sb = new StringBuffer();
		sb.append(user.getUserName()+"님 안녕하세요 마켓컬리입니다.\n"
				+ "\n"
				+ "요청하신 아이디를 안내드립니다.\n"
				+ "\n"
				+ user.getUserId()
				+ " \n"
				+ " ");
//		sb.append(System.lineSeparator());
		
//		for(int i=0;i<usernames.size()-1;i++) {
//			sb.append(usernames.get(i));
//			sb.append(System.lineSeparator());
//		}
		sb.append("가입일 "+user.getRegDate());
		
		simpleMailMessage.setText(sb.toString());
		
		
		new Thread(new Runnable() {
			public void run() {
				mailSender.send(simpleMailMessage);
			}
		}).start();
	}

	@Override
	public void sendPasswordUser(User user) throws Exception{
		SimpleMailMessage simpleMailMessage = new  SimpleMailMessage();
		simpleMailMessage.setTo(user.getEmail());
		simpleMailMessage.setSubject("[진욱이네] 비밀번호 재설정 안내를 드립니다.");
		
		StringBuffer sb = new StringBuffer();
		sb.append("강진욱님 안녕하세요 마켓컬리입니다.\n"
				+ "\n"
				+ "아래 버튼을 눌러 비밀번호를 재설정 해주세요.\n"
				+ "\n"
				+ "유효 시간 : "+LocalDateTime.now()+"\n"
				+ "유효 시간 내에 비밀번호 재설정을 완료해 주세요.\n"
				+ "");
//		sb.append(System.lineSeparator());
		
//		for(int i=0;i<usernames.size()-1;i++) {
//			sb.append(usernames.get(i));
//			sb.append(System.lineSeparator());
//		}
		
//		simpleMailMessage.setText(sb.toString()+"\n"+msg);
		
		
		new Thread(new Runnable() {
			public void run() {
				mailSender.send(simpleMailMessage);
			}
		}).start();
	}
	
	@Override
	public void sendAuthNum(String email, String authNum) throws Exception {
	    SimpleMailMessage simpleMailMessage = new  SimpleMailMessage();
	    simpleMailMessage.setTo(email);
	    simpleMailMessage.setSubject("비밀번호 찾기 인증번호");
	    
	    String text = "인증번호는 " + authNum + "입니다";
	    
	    simpleMailMessage.setText(text);
	    new Thread(new Runnable() {
	        public void run() {
	            mailSender.send(simpleMailMessage);
	        }
	    }).start();
	    
	}
	//-----------------------------------------
	@Override
	public boolean emailCheck(String username, String email) throws Exception{
	    Map<String, Object> map = new HashMap<>();
	    map.put("username", username);
	    map.put("email", email);
	    String result = userMapper.emailCheck(map);
	    if("1".equals(result)) {
	        return true;
	    }
	    return false;
	}
	 
	 
	@Override
	public boolean phoneCheck(String username, String phone) throws Exception {
	    Map<String, Object> map = new HashMap<>();
	    map.put("username", username);
	    map.put("phone", phone);
	    System.out.println(map);
	    String result = userMapper.phoneCheck(map);
	    if("1".equals(result)) {
	        return true;
	    }
	    return false;
	}
	//-----------------------------------------

	
}