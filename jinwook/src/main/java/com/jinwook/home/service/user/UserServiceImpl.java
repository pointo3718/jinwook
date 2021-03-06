package com.jinwook.home.service.user;


import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jinwook.home.mapper.UserMapper;
import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Recipe;
import com.jinwook.home.service.domain.User;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

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
	
	public int checkBusinessNo(String businessNo) throws Exception{
		int result = userMapper.checkBusinessNo(businessNo);
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
	public int updatePassword(User user) throws Exception {
		return userMapper.updatePassword(user);
//		int result =  userMapper.updatePassword(user);
		
	}
	
	@Override
	public void sendIdEmail(User user) throws Exception{
		
		
//		SimpleMailMessage simpleMailMessage = new  SimpleMailMessage();
//		simpleMailMessage.setTo(user.getEmail());
//		simpleMailMessage.setSubject("[????????????] ????????? ????????? ????????????.");

		MimeMessage mimeMessage = mailSender.createMimeMessage();
			System.out.println("==============sendIdEmail================");
		try {
	         
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
	         MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, false, "UTF-8");
	         mimeMessageHelper.setTo(user.getEmail());
	         
	         mimeMessageHelper.setSubject("[????????????] ????????? ????????? ????????????.");
	         String content= " ";
	         content = "<html><body><div class='text-center'>"+user.getUserName()+"??? ???????????????! ????????? ?????? ?????????????????????.\n \r</div></body></html>  ";
	         content += "<br><br> ";
	        content += "???????????? ???????????? ??????????????????.\n ";
	        content += "<br><br> ";
	        content += user.getUserId();
	        content += "<br><br> ";
	        content += "????????? "+sdf.format(user.getRegDate())+"\n ";
	        content += "<br><br> ";
//	         StringBuffer sb = new StringBuffer();
//			 sb.append(user.getUserName()+"??? ???????????????! ????????? ?????? ?????????????????????.\n"
//					+ "\n"
//					+ "???????????? ???????????? ??????????????????.\n"
//					+ "\n"
//					+ user.getUserId()
//					+ " \n"
//					+ "<a href='http://localhost:8082/user/updatePassword'>????????????</a><br/>\n ");
//			 sb.append(System.lineSeparator());
	         
	         
	         mimeMessageHelper.setText(content, true);
//	         mailSender.send(mimeMessage);
	         System.out.println("??????");
	      } catch (Exception e) {
	         // TODO: handle exception
	         System.out.println("??????");
	         throw new RuntimeException(e);
	      }
		
		
//		for(int i=0;i<usernames.size()-1;i++) {
//			sb.append(usernames.get(i));
//			sb.append(System.lineSeparator());
//		}
//		sb.append("????????? "+user.getRegDate());
//		sb.append("<a href='http://localhost:8082/user/updatePassword'>????????????</a><br/>\n ");
//		
//		simpleMailMessage.setText(sb.toString());
		
		
		new Thread(new Runnable() {
			public void run() {
				mailSender.send(mimeMessage);
			}
		}).start();
	}

	@Override
	public void sendPasswordEmail(User user) throws Exception{
		
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		
		try {
	         
	         MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, false, "UTF-8");
	         mimeMessageHelper.setTo(user.getEmail());
	         
	         mimeMessageHelper.setSubject("[????????????] ???????????? ????????? ????????? ????????????.");
	         String content= " ";
	         content = user.getUserName()+"??? ???????????????! ????????? ?????? ?????????????????????.\n \r ";
	        content += "<br><br>  ";
	        content += "[????????????] ";
	        content += "???????????????" + " ["+user.getAuthNumber()+"] " + "?????????." ;
	        content += "<br><br>  ";
	        content += "?????? ?????? ??? ???????????? ???????????? ????????? ?????????.\n ";
//	         StringBuffer sb = new StringBuffer();
//			 sb.append(user.getUserName()+"??? ???????????????! ????????? ?????? ?????????????????????.\n"
//					+ "\n"
//					+ "???????????? ???????????? ??????????????????.\n"
//					+ "\n"
//					+ user.getUserId()
//					+ " \n"
//					+ "<a href='http://localhost:8082/user/updatePassword'>????????????</a><br/>\n ");
//			 sb.append(System.lineSeparator());
	         
	         mimeMessageHelper.setText(content, true);
//	         mailSender.send(mimeMessage);
	         System.out.println("??????");
	      } catch (Exception e) {
	         // TODO: handle exception
	         System.out.println("??????");
	         throw new RuntimeException(e);
	      }
		
		new Thread(new Runnable() {
			public void run() {
				mailSender.send(mimeMessage);
			}
		}).start();
	}
	
	@Override
	public void sendAuthNum(String email, String authNum) throws Exception {
	    SimpleMailMessage simpleMailMessage = new  SimpleMailMessage();
	    simpleMailMessage.setTo(email);
	    simpleMailMessage.setSubject("???????????? ?????? ????????????");
	    
	    String text = "??????????????? " + authNum + "?????????";
	    
	    simpleMailMessage.setText(text);
	    new Thread(new Runnable() {
	        public void run() {
	            mailSender.send(simpleMailMessage);
	        }
	    }).start();
	    
	}
	
	//coolSMS ?????? ??????
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "NCS87JA0BTTN1MRQ";
	    String api_secret = "EBUZN3IA9R8VWORF1YIUUM3METWNMPWM";
	    Message coolsms = new Message(api_key, api_secret);
	    if(randomNumber == 0) {
	    	System.out.println("return=====");
	    	return;
	    }
	    System.out.println("?????????");
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhoneNumber);    // ??????????????????
	    params.put("from", "01024863718");    // ??????????????????. ?????????????????? ??????,?????? ?????? ?????? ????????? ?????? ???
	    params.put("type", "SMS");
	    params.put("text", "???????????????" + "["+randomNumber+"]" + "?????????."); // ?????? ?????? ??????
	    params.put("app_version", "[????????????]"); // application name and version
	    System.out.println("?????? ??????2222222222");
	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	    
	}
	public List<Recipe> getMyRecipe(Recipe recipe)throws Exception{
		
		List<Recipe> recipeList = userMapper.getMyRecipe(recipe);
		
		return recipeList;
	}
	
	public List<Board> getMyInquiry(Board board) throws Exception{
		List<Board> boardList = userMapper.getMyInquiry(board);
		
		return boardList;
	}
}