package com.jinwook.home.web.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.jinwook.home.service.domain.Attach;
import com.jinwook.home.service.domain.Chart;
import com.jinwook.home.service.domain.Complain;
import com.jinwook.home.service.domain.Recipe;
import com.jinwook.home.service.domain.Store;
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
   
   
	///////////////// 일반 유저목록 //////////////////
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
   public JSONObject getUserRest(@PathVariable(value = "userId", required = false) String userId, @ModelAttribute("user") User user) throws Exception{
      
      System.out.println("/admin/getUserRest : GET ");
      Gson gson = new Gson();      
      user = adminService.getUserAdmin(userId);
			
      String userObj = gson.toJson(user);
      JSONParser parser = new JSONParser();
      JSONObject jsonObj = (JSONObject)parser.parse(userObj);
		        
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
	


   ///////////////// 신고 등록  //////////////////	


	//==================== 통계 ======================//
	
	///////////////// 월별 회원가입 수  //////////////////	
	@GetMapping( value="/getJoinForMonthChart" )
	@ResponseBody
	public JsonObject getJoinForMonthChart(@ModelAttribute("chart") Chart chart) throws Exception{
	   
	   System.out.println("/admin/getJoinForMonthChart : GET ");
	
	   JsonObject jsonObj = new JsonObject();
	   
	   List<Chart> joinlist = adminService.getJoinForMonthChart();
	   
	   if (CollectionUtils.isEmpty(joinlist) == false) {
	      JsonArray jsonArr = new Gson().toJsonTree(joinlist).getAsJsonArray();
	      jsonObj.add("joinlist", jsonArr);
	   
	      System.out.println("월별 회원가입 수 통계 컨트롤러 통과");
	   }
	
	   return jsonObj;
	}
	
	///////////////// 역할별 사용자수  //////////////////	
	@GetMapping( value="/getUserByRole" )
	@ResponseBody
	public JsonObject getUserByRole() throws Exception{
	   
	   System.out.println("/admin/getUserByRole : GET ");
	
	   JsonObject jsonObj = new JsonObject();
	   
	   List<Chart> userlist = adminService.getUserByRole();
	   
	   if (CollectionUtils.isEmpty(userlist) == false) {
	      JsonArray jsonArr = new Gson().toJsonTree(userlist).getAsJsonArray();
	      jsonObj.add("userlist", jsonArr);
	   
	      System.out.println("역할별 회원수 통계 컨트롤러 통과");
	   }
	
	   return jsonObj;
	}
	
	///////////////// 월별 주문량/주문금액  //////////////////	
	@GetMapping( value="/getOrderCountAndPrice" )
	@ResponseBody
	public JsonObject getOrderCountAndPrice() throws Exception{
	   
	   System.out.println("/admin/getOrderCountAndPrice : GET ");
	
	   JsonObject jsonObj = new JsonObject();
	   
	   List<Chart> orderlist = adminService.getOrderCountAndPrice();
	   
	   if (CollectionUtils.isEmpty(orderlist) == false) {
	      JsonArray jsonArr = new Gson().toJsonTree(orderlist).getAsJsonArray();
	      jsonObj.add("orderlist", jsonArr);
	   
	      System.out.println("월별 주문량/주문금액 통계 컨트롤러 통과");
	   }
	
	   return jsonObj;
	}
	
	///////////////// 사용자 유형 (일반/블랙/탈퇴)  //////////////////	
	@GetMapping( value="/getUserType" )
	@ResponseBody
	public JsonObject getUserType() throws Exception{
	   
	   System.out.println("/admin/getUserType : GET ");
	
	   JsonObject jsonObj = new JsonObject();
	   
	   List<Chart> usertypelist = adminService.getUserType();
	   
	   if (CollectionUtils.isEmpty(usertypelist) == false) {
	      JsonArray jsonArr = new Gson().toJsonTree(usertypelist).getAsJsonArray();
	      jsonObj.add("usertypelist", jsonArr);
	   
	      System.out.println("사용자 유형 통계 컨트롤러 통과");
	   }
	
	   return jsonObj;
	}
	
	
	///////////////// 레시피 추천수 순 목록 //////////////////
	   @GetMapping( value="/getRecipeHits" )
	   @ResponseBody
	   public JsonObject getRecipeHits(@ModelAttribute("recipe") Recipe recipe) throws Exception{
	      
	      System.out.println("/admin/getRecipeHits : GET ");
	  
	      JsonObject jsonObj = new JsonObject();
	      
	      List<Recipe> recipelist = adminService.getRecipeHits();
	      
		  	for (Recipe recipe2 : recipelist) {
				int i=0;
				Attach attach = new Attach();
				attach = adminService.selectRcpAttachList(recipe2.getRcpNo());
				recipe2.setAttach(attach);
				recipelist.get(i).setAttach(attach);
				i++;
			}
	      
	      
	      if (CollectionUtils.isEmpty(recipelist) == false) {
	         JsonArray jsonArr = new Gson().toJsonTree(recipelist).getAsJsonArray();
	         jsonObj.add("recipelist", jsonArr);
	      	      }

	      return jsonObj;
	   }
	   
	   
		//////////////// 주문내역 카운트 (사용자/사장님) ////////////////
		@GetMapping( value={"/countOrders"} )
		public JsonObject countOrders(HttpSession session)throws Exception{
		
		User user = ((User) session.getAttribute("user"));
		
		System.out.println("USER ::" +user);

		
		JsonObject jsonObj = new JsonObject();
		
		try { 	
			int countOrders= adminService.countOrders(user);
			System.out.println("USER ::" +user);

			jsonObj.addProperty("countOrders", countOrders);
		
			} catch (DataAccessException e) {
				jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");
		
			} catch (Exception e) {
				jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
			}
			
		 System.out.println("문의대기 개수 컨트롤러 통과");
		 
			return jsonObj;
		}
		
		//////////////// 장바구니 카운트 (사용자/사장님) ////////////////
		@GetMapping( value={"/countCart"} )
		public JsonObject countCart(HttpSession session)throws Exception{
		
		User user = ((User) session.getAttribute("user"));
				
		JsonObject jsonObj = new JsonObject();
		
		try { 	
			int countCart= adminService.countCart(user);
			System.out.println("USER ::" +user);

			jsonObj.addProperty("countCart", countCart);
		
			} catch (DataAccessException e) {
				jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");
		
			} catch (Exception e) {
				jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
			}
			
		 System.out.println("문의대기 개수 컨트롤러 통과");
		 
			return jsonObj;
		}
}


   
