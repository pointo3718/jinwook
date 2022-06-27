package com.jinwook.home.web.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;

import com.jinwook.home.service.admin.AdminService;
import com.jinwook.home.service.board.BoardService;
import com.jinwook.home.service.domain.Attach;
import com.jinwook.home.service.domain.Complain;
import com.jinwook.home.service.domain.Recipe;
import com.jinwook.home.service.domain.Request;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.request.RequestService;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService adminService;
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Autowired
	@Qualifier("requestServiceImpl")
	private RequestService requestService;
	
	public AdminController(){
		System.out.println(this.getClass());
	}
	
	//========== 카테고리별 상점 목록 ==========
	@GetMapping(value = "listStoreForUser")
	public String getStoreList(@ModelAttribute("store") Store store, @RequestParam(value = "storeType", required = false) String storeType, Model model) {
		
		store.setStoreType(storeType);
		
		List<Store> storeList = adminService.getStoreList(storeType);
		
		for (Store store2 : storeList) {
			int i=0;
			Attach attach = new Attach();
			attach = requestService.selectStoreAttachList(store2.getStoreNo());
			store2.setAttach(attach);
			storeList.get(i).setAttach(attach);
			i++;
		}
		model.addAttribute("storeList", storeList);

		return "/admin/listStoreForUser";
	}

	// ========== 회원 목록 ==========	
	@GetMapping(value = "blog")
	public String listUserAdmin(@ModelAttribute("user") User user, Model model) {
		
		List<User> userList = adminService.getUserListAdmin(user);
		model.addAttribute("userList", userList);

		return "/admin/blog";
	}

	// ========== 통계 navi ==========	
	@GetMapping(value = "chart")
	public String getChart() {
		return "/admin/chart";
	}
	
	// ========== 회원 목록 ==========	
	@GetMapping(value = "getUserAdmin")
	public String getUserAdmin(@RequestParam(value = "userId", required = false) String userId, Model model) {
		
		if (userId == null) {
			// TODO => 올바르지 않은 접근이라는 메시지를 전달하고, 유저 리스트로 리다이렉트
			return "redirect:/admin/listUserAdmin";
		}

		User user = adminService.getUserAdmin(userId);
		System.out.println("userid="+userId);

		model.addAttribute("user", user);

		return "admin/getUserAdmin";
	}
	
	
	// ========== 관리용 상점 목록 ==========		
	@GetMapping(value = "listStoreAdmin")
	public String listStoreAdmin(@ModelAttribute("store") Store store, Model model) {
		List<Store> storeList = adminService.getStoreListAdmin(store);
		model.addAttribute("storeList", storeList);

		return "/admin/listStoreAdmin";
	}
	
	
	// ========== 레시피 신고 등록 ===========
	@PostMapping(value = "addComplainRecipe")
	public String addComplainRecipe(@ModelAttribute("complain") Complain complain) {		
		// 겟레시피 통해 등록한 사람 아이디 불러오기 ... 
		Recipe recipe = boardService.getRecipe(complain.getRcpNo());
		String complainId = recipe.getUserId();
		System.out.println("왜 안나와~!~!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" +complainId);
		complain.setComplainId(complainId);// 신고당한 자의 아이디 세팅
		
		try {
			boolean result = adminService.addComplainRecipe(complain);
			if (result == false) {
				// TODO => 등록에 실패하였다는 메시지를 전달
			}
		} catch (DataAccessException e) {
			// TODO => 데이터베이스 처리 과정에 문제가 발생하였다는 메시지를 전달

		} catch (Exception e) {
			// TODO => 시스템에 문제가 발생하였다는 메시지를 전달
		}
		return "redirect:/board/getRecipe?rcpNo="+complain.getRcpNo();
	}
	
	
	// ========== 신고 목록 ==========		
	@GetMapping(value = "listComplainAdmin")
	public String listComplainAdmin(@ModelAttribute("complain") Complain complain, Model model) {
		List<Complain> complainList = adminService.getComplainListAdmin(complain);
		model.addAttribute("complainList", complainList);

		return "/admin/listComplainAdmin";
	}

}

