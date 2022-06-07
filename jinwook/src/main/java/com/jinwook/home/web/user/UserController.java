package com.jinwook.home.web.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.annotation.JsonAppend.Attr;
import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.user.UserService;

import net.bytebuddy.asm.Advice.Exit;


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
	
	@GetMapping(value="index")
	public String index(HttpSession session) throws Exception{
		System.out.println("==========index===========");
		return "index";
	}
	
	@RequestMapping( value="addUser", method=RequestMethod.GET )
	public String addUser() throws Exception{
	
		System.out.println("/user/addUserView : GET");
		
		return "/user/addUserView";
	}
	
	@RequestMapping( value="addUser", method=RequestMethod.POST )
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
	
	
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{
		
		System.out.println("/user/logon : GET");

		return "/user/loginView";
	}
	
	@RequestMapping( value="login", method=RequestMethod.POST )
	public String login(@ModelAttribute("user") User user , HttpSession session, RedirectAttributes attr ) throws Exception{
		
		System.out.println("/user/login : POST");
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());

		if(dbUser == null) {
			return "/user/loginView";
		}
		
		System.out.println(dbUser.isUserByeStatus());

		if(dbUser.isUserByeStatus()==true) {
			System.out.println("FALILED");
			return "/user/loginView";
		}
		
		if( !(user.getPassword().equals(dbUser.getPassword()))){
			return "/user/loginView";
		}
		session.setAttribute("user", dbUser);
		System.out.println(user.getPassword()+"=================");
		System.out.println(dbUser.getPassword()+"=================");
		
		return "index";
	}
		
	
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/logout : POST");
		
		session.invalidate();
		
		return "index";
	}
	
	@PostMapping(value="deleteUser")
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

	
	
	@GetMapping(value="confirmPasswordView")
	public String comfirmPasswordView() throws Exception {
		
		System.out.println("===========CONFIRM PASSWORD PAGE===========");
		
		return "/user/confirmPasswordView";
	}
	
	@PostMapping(value="confirmPassword")
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
	
	
	
	
}