package com.jinwook.home.web.request;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.request.RequestService;

@Controller
@RequestMapping("/request/*")
public class RequestController {
	
	@Autowired
	@Qualifier("requestServiceImpl")
	private RequestService requestService;
	
	public RequestController(){
		System.out.println(this.getClass());
	}
	
	@GetMapping(value = "addRequestAddStore")
	public String listUserAdmin(@ModelAttribute("user") User user, Model model) {
		List<User> userList = adminService.getUserListAdmin(user);
		model.addAttribute("userList", userList);

		return "/request/addRequestAddStore";
	}

	
}
