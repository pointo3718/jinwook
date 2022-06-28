package com.jinwook.home.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hibernate.annotations.Check;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.user.UserService;




//==> User RestController
//==> ȸ������ RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ���� ����
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	
	
	//아이디 중복 확인 
	@PostMapping("checkId")
    public int checkId(@RequestParam("userId") String userId) throws Exception{
        int cnt = userService.checkId(userId); 
        
        System.out.println("===========ID CHECK SUCCESS==========");
        System.out.println("userId= "+userId);
        
        return cnt;
    }
	
	//닉네임 중복 확인
	@PostMapping("checkNickName")
	public int checkNickName(@RequestParam("nickName") String nickName) throws Exception{
		int cnt = userService.checkNickName(nickName); 
		
		System.out.println("===========NICKNAME CHECK SUCCESS==========");
		System.out.println("nickName= "+nickName);
		
		return cnt;
	}
	
	//이메일 중복 확인
	@PostMapping("checkEmail")
	public int checkEmail(@RequestParam("email") String email) throws Exception{
		int cnt = userService.checkEmail(email); 
		
		System.out.println("===========EMAIL CHECK SUCCESS==========");
		System.out.println("email= "+email);
		
		return cnt;
	}
	
	//정보 수정 시 비밀번호 중복 확인
	@PostMapping("checkPassword")
	public int checkPassword(@RequestParam("userId") String userId, @RequestParam("password") String password) throws Exception {
		User user = new User();
		
		user.setUserId(userId);
		user.setPassword(password);
		
		
		int cnt = userService.confirmPassword(user);
		
		return cnt;
	}
	
	//사업자등록번호 중복 확인 
	@PostMapping("checkBusinessNo")
	public int checkBusinessNo(@RequestParam("businessNo") String businessNo) throws Exception{
		
		int cnt = userService.checkBusinessNo(businessNo);
		return cnt;
	}
	
//	//휴대폰 번호 중복 확인 
//	@PostMapping("checkPhone")
//	public int checkPhone(@RequestParam("phone") String phone) throws Exception {
//		int cnt = userService.checkPhone(phone);
//		
//		return cnt;
//	}
	
	//아이디 찾기 - 이메일 인증 보내기
	@PostMapping("findIdEmail")
	public ResponseEntity<Object> findIdEmail(@ModelAttribute("user") User user) throws Exception{
	    System.out.println("=====SEND METHOD=====");
	    System.out.println(user);
		User dbUser =userService.findIdEmail(user);
	    user = dbUser;
	   
	    
	    if(dbUser != null) {
	        userService.sendIdEmail(user);
	    }
	    
	    System.out.println("===================아이디 찾기 이메일 보내기 성공===================");
	    
	    return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
	//비밀번호 찾기 - 이메일 인증 보내기
	@PostMapping("findPasswordEmail")
	public User findPasswordEmail(@ModelAttribute("user") User user, HttpSession session, Model model) throws Exception{
		
		System.out.println("=====SEND METHOD=====");
		User dbUser =userService.findPasswordEmail(user);
		user = dbUser;
		
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
		
		user.setAuthNumber(randomNumber);
		model.addAttribute("authNumber", user.getAuthNumber());
		if(dbUser != null) {
			userService.sendPasswordEmail(user);
		}
		session.setMaxInactiveInterval(300);
		session.setAttribute("userId", user.getUserId());
		session.setAttribute("phone", user.getPhone());
		
		Map<String, Object> authNumMap = new HashMap<>();
	    long createTime = System.currentTimeMillis(); // 인증번호 생성시간
	    long endTime = createTime + (300 *1000);	// 인증번호 만료시간
	    
	    authNumMap.put("createTime", createTime);
	    authNumMap.put("endTime", endTime);
	    
	    session.setMaxInactiveInterval(300);
	    session.setAttribute("authNum", authNumMap);
	    System.out.println(authNumMap);
		
		
		ResponseEntity<Object> res = new ResponseEntity<Object>(HttpStatus.OK);
		user.setRes(res);
		System.out.println("--------------------------------------------------------"+user);
		System.out.println("===================비민번호 찾기 이메일 보내기 성공===================");
		
		return user;
	}
		
	//아이디 찾기 - 휴대폰 인증 문자 보내기
		@GetMapping("findIdPhoneSend")
		@ResponseBody
		public User findIdPhoneSend(@RequestParam("phone") String phone, @RequestParam ("userName") String userName) throws Exception { // 휴대폰 문자보내기
			int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
			User user = new User();
			
			user.setUserName(userName);
			user.setPhone(phone);
			
			User dbUser = userService.findIdPhone(user);
			
			if(dbUser.getUserName()== userName && dbUser.getPhone()==phone) {
				
				userService.certifiedPhoneNumber(phone,randomNumber);
			}
			user = dbUser;
			
			System.out.println("-------------"+randomNumber+"------------");
			
			user.setAuthNumber(randomNumber);
			
			System.out.println("===================아이디 찾기 문자 보내기 성공===================");
			
			return user;
		}
		
		//비밀번호 찾기 - 휴대폰 인증 문자 보내기
		@GetMapping("findPasswordPhoneSend")
		@ResponseBody
		public User findPasswordPhoneSend(@RequestParam("phone") String phone, @RequestParam ("userId") String userId) throws Exception { // 휴대폰 문자보내기
			int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
			User user = new User();
			
			user.setUserId(userId);
			user.setPhone(phone);
			
			User dbUser = userService.findPasswordPhone(user);
			
			if(dbUser.getUserId()== userId && dbUser.getPhone()==phone) {
				
				userService.certifiedPhoneNumber(phone,randomNumber);
			}
			user = dbUser;
			user.setAuthNumber(randomNumber);
			
			System.out.println(user);
			System.out.println("-------------"+randomNumber+"------------");
			System.out.println("===================비밀번호 찾기 문자 보내기 성공===================");
			return user;
		}
		
		//문자인증 만료 시간 
		
		
		//로그인 아이디, 비밀번호 체크 
		@PostMapping("checkLogin")
		public User checkLogin(@ModelAttribute("user") User user) throws Exception{
			User dbUser = new User();
//			int one = userService.checkId(user.getUserId()); 
//			return one;
			
			dbUser = userService.getUser(user.getUserId());
			System.out.println(dbUser.getUserId()+"1111111111111111111111111111111");
			
			System.out.println(dbUser+"123123123123123123123123213123");
			user = dbUser;
			
			System.out.println(user+"--------------------------------------------------------");
			
			System.out.println("로그인 아이디, 비밀번호 체크 성공 ");
			
			return user;
		}
		
		//회원가입, 정보 수정 인증번호 보내기 
		@GetMapping("authNoSend")
		public User authNoSend(@RequestParam("phone") String phone) throws Exception {
			int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
			
			User user = new User();
			
			int result = userService.checkPhone(phone);
			System.out.println(result);
			if(result !=1) {
				user.setAuthNumber(randomNumber);
				return user;
			}
			userService.certifiedPhoneNumber(phone,randomNumber);
			System.out.println(user.getAuthNumber());
			System.out.println("인증완료? ");
			return user;
		}
	
	// 인증번호 보내기
//	@PostMapping("/send/authNum")
//	private ResponseEntity<String> authNum(String phone, String email, HttpSession session) throws Exception{
//	    String authNum = "";
//	    for(int i=0;i<6;i++) {
//	        authNum += (int)(Math.random() * 10);
//	    }
//	    
//	    System.out.println("인증번호 : " + authNum);
//	    
//	    // 전화번호로 인증번호 보내기 추가
//	    if(phone != null) {
////				System.out.println("전화번호로 인증번호 보내기");
//	 
//	        
//	        
//	    // 이메일로 인증번호 보내기
//	    } else if(email != null) {
////				System.out.println("이메일로 인증번호 보내기");
//	        userService.sendAuthNum(email, authNum);
//	    }
//	    
//	    
//	    Map<String, Object> authNumMap = new HashMap<>();
//	    long createTime = System.currentTimeMillis(); // 인증번호 생성시간
//	    long endTime = createTime + (300 *1000);	// 인증번호 만료시간
//	    
//	    authNumMap.put("createTime", createTime);
//	    authNumMap.put("endTime", endTime);
//	    authNumMap.put("authNum", authNum);
//	    
//	    session.setMaxInactiveInterval(300);
//	    session.setAttribute("authNum", authNumMap);
//	    
//	    return new ResponseEntity<String>("인증번호가 전송되었습니다", HttpStatus.OK);
//	}
	
	
//	//문자 인증
//	@PostMapping("findIdPhone")
//	public User findIdPhone(@ModelAttribute("user") User user ) throws Exception {
//			
//		return userService.findIdPhone(user);
//	}

}