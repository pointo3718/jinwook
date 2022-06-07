package com.jinwook.home.web.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import com.jinwook.home.service.admin.AdminService;
import com.jinwook.home.service.domain.User;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService adminService;
	
	public AdminController(){
		System.out.println(this.getClass());
	}
	
//	@Value("#{commonProperties['pageUnit']}")
//	int pageUnit;
//	@Value("#{commonProperties['pageSize']}")
//	int pageSize;
	
	
	@GetMapping(value = "listUserAdmin")
	public String listUserAdmin(Model model) {
		List<User> userList = adminService.getUserListAdmin();
		model.addAttribute("userList", userList);

		return "/admin/listUserAdmin";
	}
	
	
}









