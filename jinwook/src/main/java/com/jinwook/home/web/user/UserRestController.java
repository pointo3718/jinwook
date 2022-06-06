package com.jinwook.home.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
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
	
	@PostMapping("/checkId")
    public int checkId(@RequestBody String userId) throws Exception{
        int cnt = userService.checkId(userId); 
        
        System.out.println("===========ID CHECK SUCCESS==========");
        
        return cnt;
    }
	
	@PostMapping("/checkNickName")
	public int checkNickName(@RequestBody String nickName) throws Exception{
		int cnt = userService.checkNickName(nickName); 
		
		System.out.println("===========NICKNAME CHECK SUCCESS==========");
		
		return cnt;
	}
	
	@PostMapping("/checkEmail")
	public int checkEMail(@RequestBody String email) throws Exception{
		int cnt = userService.checkEmail(email); 
		
		System.out.println("===========EMAIL CHECK SUCCESS==========");
		
		return cnt;
	}
	
}