package com.jinwook.home.web.user;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.user.UserService;


//==> ȸ������ Controller
@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ���� ����
		
	public UserController(){
		System.out.println(this.getClass());
	}
	
//	@Value("#{commonProperties['pageUnit']}")
//	int pageUnit;
//	@Value("#{commonProperties['pageSize']}")
//	int pageSize;
	
	@GetMapping("index")
	public String index(HttpSession session) throws Exception{
		System.out.println("==========index===========");
		return "index";
	}
	
	@GetMapping("addUser")
	public String addUser() throws Exception{
	
		System.out.println("/user/addUserView : GET");
		
		return "/user/addUserView";
	}
	
	@PostMapping("addUser" )
	public String addUser( @ModelAttribute("user") User user ) throws Exception {

		System.out.println("/user/addUser : POST");
		//Business Logic
		//일반회원, 사장님, 관리자 구분 가입
		user.setRole("일반");
		userService.addUser(user);
		
		return "/user/loginView";
	}
	

	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		model.addAttribute("user", user);
		
		return "/user/getUser";
	}
	

	@RequestMapping( value="updateUser", method=RequestMethod.GET )
	public String updateUser( @RequestParam("userId") String userId , Model model ) throws Exception{

		System.out.println("/user/updateUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		model.addAttribute("user", user);
		
		return "/user/updateUser";
	}

	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{

		System.out.println("/user/updateUser : POST");
		//Business Logic
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
		return "/user/updateUser";
	}
	
	
	@GetMapping("login")
	public String login() throws Exception{
		
		System.out.println("/user/logon : GET");

		return "/user/loginView";
	}
	
	@PostMapping("login" )
	public String login(@ModelAttribute("user") User user , HttpSession session, Model model ) throws Exception{
		
		System.out.println("/user/login : POST");
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());

		if(dbUser == null) {
			return "/user/loginView";
		}
		
		System.out.println(dbUser.isUserByeStatus());

		if(dbUser.isUserByeStatus()==true) {
			return "/user/loginView";
		}
		
		if( !(user.getPassword().equals(dbUser.getPassword()))){
			return "/user/loginView";
		}
		session.setAttribute("user", dbUser);
		
//		model.addAttribute("msg", "로그인 성공");
//		model.addAttribute("url", "login");
		
		return "index";
	}
		
	
	@GetMapping("logout")
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/logout : POST");
		
		session.invalidate();
		
		return "index";
	}
	
	
	@PostMapping("deleteUser")
	public String deleteUser(@ModelAttribute("user") User user, HttpSession session) throws Exception {
		System.out.println("=============DELETE USER=============");
		
		System.out.println(user.getUserId());
		user.setUserByeStatus(false);
		userService.updateUser(user);
		session.invalidate();
		System.out.println(user.getUserId());
		
		return "index";
	}
	
//	@RequestMapping( value="checkDuplication", method=RequestMethod.POST )
//	public String checkDuplication( @RequestParam("userId") String userId , Model model ) throws Exception{
//		
//		System.out.println("/user/checkDuplication : POST");
//		//Business Logic
//		boolean result=userService.checkId(userId);
//		// Model �� View ����
//		model.addAttribute("result", new Boolean(result));
//		model.addAttribute("userId", userId);
//
//		return "forward:/user/checkDuplication.jsp";
//	}

	
	
	@GetMapping("confirmPasswordView")
	public String comfirmPasswordView() throws Exception {
		
		System.out.println("===========CONFIRM PASSWORD PAGE===========");
		
		return "/user/confirmPasswordView";
	}
	
	@PostMapping("confirmPassword")
	public String comfirmPassword(@ModelAttribute("user") User user ,  HttpSession session, Model model ) throws Exception {
		System.out.println("===========CONFIRM PASSWORD=========");
		System.out.println(user);
		user.setUserId( ((User)session.getAttribute("user")).getUserId());
		int password = userService.confirmPassword(user);
		if(password==0) {
			return "/user/confirmPasswordView";
		}
		User dbUser = userService.getUser("userId");
		model.addAttribute("user", dbUser);
		System.out.println(user.getUserId());
		return "/user/updateUser";
	}
	
	@GetMapping("findId")
	public String findId() {
		
		System.out.println("============FIND ID PAGE============");
		return "/user/findId";
	}
	
//	@PostMapping("findIdEmail")
//	public String findIdEmail(@ModelAttribute("user") User user, HttpSession session) throws Exception {
//		
//		user.setUserName( ((User)session.getAttribute("user")).getUserName());
//		
//		int result = userService.findIdEmail(user);
//		
//		if(result != 0) {
//			
//		}
//		return null;
//	}
	
}