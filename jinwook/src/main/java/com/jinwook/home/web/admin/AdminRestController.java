package com.jinwook.home.web.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
   
   
	///////////////// 블랙리스트 목록 //////////////////
   @GetMapping( value="/listBlacklistAdmin" )
   public JsonObject listBlacklistAdmin(@ModelAttribute("user") User user) throws Exception{
      
      System.out.println("/admin/listBlacklistAdmin : GET ");
  
      JsonObject jsonObj = new JsonObject();
      
      List<User> blacklist = adminService.getBlacklistAdmin(user);
      
      if (CollectionUtils.isEmpty(blacklist) == false) {
         JsonArray jsonArr = new Gson().toJsonTree(blacklist).getAsJsonArray();
         jsonObj.add("blacklist", jsonArr);
      
         System.out.println("블랙리스트 목록 컨트롤러 통과");
      }

      return jsonObj;
   }
   
   
	///////////////// 블랙리스트 등록 //////////////////
   @PatchMapping(value = { "updateBlacklist/{userId}" })
   public JsonObject updateBlacklist(@PathVariable(value = "userId", required = false) String userId, 
		   									@RequestBody User user) {

	    System.out.println("/admin/updateBlacklist : PATCH ");

		JsonObject jsonObj = new JsonObject();

		try {
			if (user != null) {
				System.out.println("user 객체에 값 넣어줌");
				user.setUserId(userId);
			}
			System.out.println("컨트롤러에서의 User :: "+user);

			boolean result = adminService.updateBlacklist(user);
			jsonObj.addProperty("result", result);

		} catch (DataAccessException e) {
			jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

		} catch (Exception e) {
			jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
		}
		
        System.out.println("블랙리스트 등록 컨트롤러 통과");
        
		return jsonObj;
	}

   
   
   ///////////////// 신고 등록  //////////////////	
   

}