package com.jinwook.home.web.admin;

import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
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
import com.jinwook.home.service.domain.Complain;
import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.request.RequestService;

@RestController
@RequestMapping("/admin/*")
public class AdminRestController {
   
   
   @Autowired
   @Qualifier("adminServiceImpl")
   private AdminService adminService;
   
   @Autowired
   @Qualifier("requestServiceImpl")
   private RequestService requestService;
   
   public AdminRestController(){
      System.out.println(this.getClass());
   }
   
   
	///////////////// 일반 유저 목록 //////////////////
   @GetMapping( value="/listUserAdmin" )
   @ResponseBody
   public JsonObject listUserAdmin(@ModelAttribute("user") User user) throws Exception{
      
      System.out.println("/admin/listUserAdmin : GET ");
  
      JsonObject jsonObj = new JsonObject();
      
      List<User> userList = adminService.getUserListAdmin(user);
      
      if (CollectionUtils.isEmpty(userList) == false) {
         JsonArray jsonArr = new Gson().toJsonTree(userList).getAsJsonArray();
         jsonObj.add("userList", jsonArr);
      
         System.out.println("일반 유저 목록 컨트롤러 통과");
      }

      return jsonObj;
   }
   
   
	///////////////// 유저 상세 //////////////////
   @GetMapping( value={"/getUserRest/{userId}"} )
   public JSONObject countPickup(@PathVariable(value = "userId", required = false) String userId, @ModelAttribute("user") User user) throws Exception{
      
      System.out.println("/admin/getUserRest : GET ");
      Gson gson = new Gson();      
      user = adminService.getUserAdmin(userId);
			
      String userObj = gson.toJson(user);
      JSONParser parser = new JSONParser();
      JSONObject jsonObj = (JSONObject)parser.parse(userObj);
		
      System.out.println("픽업 개수 컨트롤러 통과");
        
      return jsonObj;
   }
   
	///////////////// 신고목록 삭제 //////////////////
   @DeleteMapping(value = { "deleteComplain/{complainNo}" })
   public JsonObject deleteComplain(@PathVariable(value = "complainNo", required = false) int complainNo) {
	   
	    System.out.println("/admin/deleteComplain : DELETE ");
	  	JsonObject jsonObj = new JsonObject();

		try { 	
			boolean deleteComplain = adminService.deleteComplain(complainNo);
			jsonObj.addProperty("result", deleteComplain);
		
			} catch (DataAccessException e) {
				jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");
		
			} catch (Exception e) {
				jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
			}
        System.out.println("신고목록 삭제 컨트롤러 통과");
        
		return jsonObj;
   }
   
   
	///////////////// 블랙리스트 목록 //////////////////
   @GetMapping( value="/listBlacklistAdmin" )
   @ResponseBody
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
   @PatchMapping(value = { "updateBlacklist/{userId}/{blackPeriod}/{complainNo}" })
   public JsonObject updateBlacklist(@PathVariable(value = "userId", required = false) String userId, 
		   								@PathVariable(value = "blackPeriod", required = false) String blackPeriod,
		   								@PathVariable(value = "complainNo", required = false) int complainNo) {
	   
	    System.out.println("/admin/updateBlacklist : PATCH ");

	    Complain complain = new Complain();
		JsonObject jsonObj = new JsonObject();
		
		
			if (complain != null) {
				System.out.println("user 객체에 값 넣어줌");
				User user = new User();
				user.setUserId(userId);
				user.setBlackPeriod(blackPeriod);
				complain.setComplainNo(complainNo);
				complain.setUser(user);
			}
			
			System.out.println("컨트롤러에서의 complain :: "+complain);

			boolean result = adminService.updateBlacklist(complain);
			jsonObj.addProperty("result", result);
		
        System.out.println("블랙리스트 등록 컨트롤러 통과");
        
		return jsonObj;
   }
	

// ============== 대기중인 요청 목록 개수 ================
	@GetMapping( value={"/CountRequestWaiting/{reqCode}"} )
	public JsonObject CountRequestWaiting(@PathVariable(value = "reqCode", required = false) String reqCode) throws Exception{
	   
	   System.out.println("/admin/CountRequestWaiting : GET ");
	
	   JsonObject jsonObj = new JsonObject();
	   
	   try { 	
			int CountRequestWaiting = requestService.CountRequestWaiting(reqCode);
			System.out.println("   ::  "+CountRequestWaiting);
			jsonObj.addProperty("CountRequestWaiting", CountRequestWaiting);
	
			} catch (DataAccessException e) {
				jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");
	
			} catch (Exception e) {
				jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
			}
			
	     System.out.println("요청대기 개수 컨트롤러 통과");
	     
			return jsonObj;
		}

	
	//////////////// 대기중인 신고 목록 개수 ////////////////
	@GetMapping( value={"/getComplainTotalCount"} )
	public JsonObject getComplainTotalCount()throws Exception{
   
	   System.out.println("/admin/getComplainTotalCount : GET ");
	
	   JsonObject jsonObj = new JsonObject();
   
	   try { 	
			int countWaitingComplain= adminService.getComplainTotalCount();
			System.out.println("   ::  "+countWaitingComplain);
			jsonObj.addProperty("countWaitingComplain", countWaitingComplain);
	
		} catch (DataAccessException e) {
				jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");
	
		} catch (Exception e) {
				jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
		}
		
	   System.out.println("신고대기 개수 컨트롤러 통과");
		return jsonObj;
	}

   
	//////////////// 대기중인 문의 목록 개수 ////////////////
	@GetMapping( value={"/getWatingInquiryCount"} )
	public JsonObject getWatingInquiryCount()throws Exception{
	
	System.out.println("/admin/getWatingInquiryCount : GET ");
	
	JsonObject jsonObj = new JsonObject();
	
	try { 	
		int getWatingInquiryCount= adminService.getWatingInquiryCount();
		System.out.println("   ::  "+getWatingInquiryCount);
		jsonObj.addProperty("getWatingInquiryCount", getWatingInquiryCount);
	
		} catch (DataAccessException e) {
			jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");
	
		} catch (Exception e) {
			jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
		}
		
	 System.out.println("문의대기 개수 컨트롤러 통과");
	 
		return jsonObj;
	}
	}



   ///////////////// 신고 등록  //////////////////	



   
