package com.jinwook.home.web.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		return "/user/getUser?userId="+user.getUserId();
	}
	
	
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{
		
		System.out.println("/user/logon : GET");

		return "/user/loginView";
	}
	
	@RequestMapping( value="login", method=RequestMethod.POST )
	public String login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
		
		System.out.println("/user/login : POST");
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return "index";
	}
		
	
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/logout : POST");
		
		session.invalidate();
		
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

	
//	@RequestMapping( value="listUser" )
//	public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
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
//		model.addAttribute("list", map.get("list"));
//		model.addAttribute("resultPage", resultPage);
//		model.addAttribute("search", search);
//		
//		return "forward:/user/listUser.jsp";
//	}
	
	@GetMapping(value="confirmPasswordView")
	public String comfirmPasswordView() throws Exception {
		
		System.out.println("===========CONFIRM PASSWORD PAGE===========");
		
		return "/user/confirmPasswordView";
	}
	
	@PostMapping(value="confirmPassword")
	public String comfirmPassword(@ModelAttribute("user") User user , Model model  ) throws Exception {
		System.out.println("===========CONFIRM PASSWORD=========");
		System.out.println(user.getUserId());
		int password = userService.confirmPassword(user);
		if(password==0) {
			return "/user/confirmPasswordView";
		}
		
		return "/user/updateUser";
	}
	
	
}