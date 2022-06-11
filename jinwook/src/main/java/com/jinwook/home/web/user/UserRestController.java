package com.jinwook.home.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
//		//==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
//		@Value("#{commonProperties['pageUnit']}")
//		//@Value("#{commonProperties['pageUnit'] ?: 3}")
//		int pageUnit;
//		
//		@Value("#{commonProperties['pageSize']}")
//		//@Value("#{commonProperties['pageSize'] ?: 2}")
//		int pageSize;
	
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}

	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(	@RequestBody User user,
									HttpSession session ) throws Exception{
	
		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return dbUser;
	}
	
	@RequestMapping(value="json/addUser", method=RequestMethod.POST )
	public User addUser(@RequestBody User user) throws Exception {

		System.out.println("/addUser");
		
		
		userService.addUser(user);
		
		 return user;
	}
	
	@RequestMapping( value="json/updateUser", method=RequestMethod.POST )
	public User updateUser( @RequestBody User user ) throws Exception{
		
//		System.out.println("-------------"+body);
		
		System.out.println("/user/updateUser : POST");
		//Business Logic
		System.out.println("========"+user);
		userService.updateUser(user);
		
//		String sessionId=((User)session.getAttribute("user")).getUserId();
//		if(sessionId.equals(user.getUserId())){
//			
//			System.out.println("====================="+user);
//			session.setAttribute("user", user);
//		}
		System.out.println("====================="+user);
		return user;
	}
	
//	@RequestMapping( value="json/listUser" )
//	public Map listUser( @RequestBody Search search ) throws Exception{
//		
//		System.out.println("/user/listUser : GET / POST");
//		
//		if(search.getCurrentPage() ==0 ){
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//		
//		// Business logic ����
//		Map<String , Object> map=userService.getUserList(search);
//		
//		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		System.out.println(resultPage);
//		
//		// Model �� View ����
////		model.addAttribute("list", map.get("list"));
////		model.addAttribute("resultPage", resultPage);
////		model.addAttribute("search", search);
//		
//		return map;
//	}
	
//	@RequestMapping( value="json/checkDuplication", method=RequestMethod.POST )
//	public Map checkDuplication( @RequestBody String userId , Model model ) throws Exception{
//		
//		System.out.println("/user/checkDuplication : POST");
//		//Business Logic
//		boolean result=userService.checkId(userId);
//		// Model �� View ����
////		model.addAttribute("result", new Boolean(result));
////		model.addAttribute("userId", userId);
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("result", result);
//		map.put("userId", userId);
//		return map;
//	}
	
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
	
	//이메일 중복 확
	@PostMapping("checkEmail")
	public int checkEmail(@RequestParam("email") String email) throws Exception{
		int cnt = userService.checkEmail(email); 
		
		System.out.println("===========EMAIL CHECK SUCCESS==========");
		System.out.println("email= "+email);
		
		return cnt;
	}
	
	//아이디 찾기 - 이메일 
	@PostMapping("findIdEmail")
	public ResponseEntity<Object> findIdEmail(@ModelAttribute("user") User user) throws Exception{
	    System.out.println("=====SEND METHOD=====");
		User dbUser =userService.findIdEmail(user);
	    user = dbUser;
	    
	    if(dbUser != null) {
	        userService.sendIdEmail(user);
	    }
	    
	    return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
	//비밀번호 찾기 - 이메일 
	@PostMapping("findPasswordEmail")
	public ResponseEntity<Object> sendPasswordEmail(@ModelAttribute("user") User user, HttpSession session) throws Exception{
		System.out.println("=====SEND METHOD=====");
		User dbUser =userService.findPasswordEmail(user);
		user = dbUser;
		
	    
	    session.setMaxInactiveInterval(300);
	    session.setAttribute("userId", user.getUserId());
		
		if(dbUser != null) {
			userService.sendPasswordEmail(user);
		}
		
		Map<String, Object> authNumMap = new HashMap<>();
	    long createTime = System.currentTimeMillis(); // 인증번호 생성시간
	    long endTime = createTime + (300 *1000);	// 인증번호 만료시간
	    
	    authNumMap.put("createTime", createTime);
	    authNumMap.put("endTime", endTime);
	    
	    session.setMaxInactiveInterval(300);
	    session.setAttribute("authNum", authNumMap);
	    System.out.println(authNumMap);
		
		System.out.println("--------------------------------------------------------"+user);
		
		return new ResponseEntity<Object>(user, HttpStatus.OK);
	}
		
		@PostMapping("updatePassword")
		public String updatePassword(@RequestBody User user, HttpSession session) throws Exception {
			
			userService.updatePassword(user);
				
			session.setAttribute("user", user.getUserId());	
			
				
			return "login";
		}
	
	// 인증번호 보내기
	@PostMapping("/send/authNum")
	private ResponseEntity<String> authNum(String phone, String email, HttpSession session) throws Exception{
	    String authNum = "";
	    for(int i=0;i<6;i++) {
	        authNum += (int)(Math.random() * 10);
	    }
	    
	    System.out.println("인증번호 : " + authNum);
	    
	    // 전화번호로 인증번호 보내기 추가
	    if(phone != null) {
//				System.out.println("전화번호로 인증번호 보내기");
	 
	        
	        
	    // 이메일로 인증번호 보내기
	    } else if(email != null) {
//				System.out.println("이메일로 인증번호 보내기");
	        userService.sendAuthNum(email, authNum);
	    }
	    
	    
	    Map<String, Object> authNumMap = new HashMap<>();
	    long createTime = System.currentTimeMillis(); // 인증번호 생성시간
	    long endTime = createTime + (300 *1000);	// 인증번호 만료시간
	    
	    authNumMap.put("createTime", createTime);
	    authNumMap.put("endTime", endTime);
	    authNumMap.put("authNum", authNum);
	    
	    session.setMaxInactiveInterval(300);
	    session.setAttribute("authNum", authNumMap);
	    
	    return new ResponseEntity<String>("인증번호가 전송되었습니다", HttpStatus.OK);
	}
	
	
	//비밀번호 찾기 - 휴대폰 인증 문자 보내기
	@GetMapping("sendPasswordPhone")
	@ResponseBody
	public String sendPasswordPhone(@RequestParam("phone") String phone, @RequestParam ("userId") String userId, HttpSession session) throws Exception { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
		User user = new User();
		
		user.setUserId(userId);
		user.setPhone(phone);
		
		User dbUser = userService.findPasswordPhone(user);
		
		if(dbUser.getUserId()== userId && dbUser.getPhone()==phone) {
			
			userService.certifiedPhoneNumber(phone,randomNumber);
		}
		session.setAttribute("userId", userId);
		System.out.println(session.getAttribute("userId")+"-=-=-=-=-=-=-=-=-=-=-=-1=-21=-2=1");
		System.out.println(userId+"----=-=-=-=-=-=-=-=-=-=-=-=-=");
		
		System.out.println("-------------"+randomNumber+"------------");
		return Integer.toString(randomNumber);
	}
	
//	//문자 인증
//	@PostMapping("findIdPhone")
//	public User findIdPhone(@ModelAttribute("user") User user ) throws Exception {
//			
//		return userService.findIdPhone(user);
//	}

}