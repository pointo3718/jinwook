package com.jinwook.home.web.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.jinwook.home.service.admin.AdminService;
import com.jinwook.home.service.domain.User;

@RestController
@RequestMapping("/admin/*")
public class AdminRestController {
	
	
	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService adminService;
	
	public AdminRestController(){
		System.out.println(this.getClass());
	}
	
	
	@GetMapping( value="/admin/listBlacklistAdmin" )
	public JsonObject listBlacklistAdmin(@ModelAttribute("user") User user) throws Exception{
		
		System.out.println("/admin/listBlacklistAdmin : GET ");
		
//		if(search.getCurrentPage() ==0 ){
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//		
		// Business logic 
		JsonObject jsonObj = new JsonObject();
		
		List<User> blacklist = adminService.getBlacklistAdmin();
		
		if (CollectionUtils.isEmpty(blacklist) == false) {
			JsonArray jsonArr = new Gson().toJsonTree(blacklist).getAsJsonArray();
			jsonObj.add("blacklist", jsonArr);
		
			System.out.println("블랙리스트 컨트롤러 통과");

		}

		
//		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		System.out.println(resultPage);
//		
//		// Model and View 
////		model.addAttribute("list", map.get("list"));
////		model.addAttribute("resultPage", resultPage);
////		model.addAttribute("search", search);
//		
		return jsonObj;
	}
}
