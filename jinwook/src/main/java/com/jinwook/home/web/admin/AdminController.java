package com.jinwook.home.web.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.jinwook.home.service.admin.AdminService;
import com.jinwook.home.service.domain.Complain;
import com.jinwook.home.service.domain.Store;
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

		
	@GetMapping(value = "blog")
	public String listUserAdmin(@ModelAttribute("user") User user, Model model) {
		
		List<User> userList = adminService.getUserListAdmin(user);
		model.addAttribute("userList", userList);

		return "/admin/blog";
	}

	@GetMapping(value = "chart")
	public String getChart() {

		return "/admin/chart";
	}
	
	@GetMapping(value = "getUserAdmin")
	public String getUserAdmin(@RequestParam(value = "userId", required = false) String userId, Model model) {
		
		if (userId == null) {
			// TODO => 올바르지 않은 접근이라는 메시지를 전달하고, 유저 리스트로 리다이렉트
			return "redirect:/admin/listUserAdmin";
		}

		User user = adminService.getUserAdmin(userId);
		System.out.println("userid="+userId);
		if (user == null || "0".equals(user.getRole())) {
			// TODO => 없는 사용자이거나, 탈퇴한 사용자라는 메시지를 전달하고, 유저 리스트로 리다이렉트
			return "redirect:/admin/listUserAdmin";
		}
		
		model.addAttribute("user", user);

		return "admin/getUserAdmin";
	}
	
	
	@GetMapping(value = "listStoreAdmin")
	public String listStoreAdmin(@ModelAttribute("store") Store store, Model model) {
		List<Store> storeList = adminService.getStoreListAdmin(store);
		model.addAttribute("storeList", storeList);

		return "/admin/listStoreAdmin";
	}
	
	
	@GetMapping(value = "listComplainAdmin")
	public String listComplainAdmin(@ModelAttribute("complain") Complain complain, Model model) {
		List<Complain> complainList = adminService.getComplainListAdmin(complain);
		model.addAttribute("complainList", complainList);

		return "/admin/listComplainAdmin";
	}

}

