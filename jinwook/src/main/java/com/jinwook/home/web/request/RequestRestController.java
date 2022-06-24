package com.jinwook.home.web.request;


import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.ui.Model;
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
import com.jinwook.home.service.domain.Request;
import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.request.RequestService;

@RestController
@RequestMapping("/request/*")
public class RequestRestController {
	
	
	@Autowired
	@Qualifier("requestServiceImpl")
	private RequestService requestService;
	//setter Method 구현 않음
		
	public RequestRestController(){
		System.out.println(this.getClass());
	}
	
	
	// ========== 상점 등록 요청 상세 ===========
	@GetMapping( value={"/getRequestStore/{reqNo}"})
	public JSONObject getRequestStore( @PathVariable(value = "reqNo", required = false) int reqNo,  @ModelAttribute("request") Request request ) throws Exception {
		
		  System.out.println("/request/getRequestStore : GET ");
	      Gson gson = new Gson();      
	      request = requestService.getRequestStore(reqNo);
				
	      String requestObj = gson.toJson(request);
	      JSONParser parser = new JSONParser();
	      JSONObject jsonObj = (JSONObject)parser.parse(requestObj);
			
		return jsonObj;
	}
	
	
	// ========== 상점 등록 요청 수락 ===========
	@PatchMapping( value={"updateRequestAddStore/{reqNo}"})
	public JsonObject updateRequestAddStore(@PathVariable(value = "reqNo", required = false) int reqNo) {
	
		System.out.println("/request/updateRequestAddStore : PATCH");
		System.out.println("reqNo :: "+reqNo);
		
		JsonObject jsonObj = new JsonObject();
		
		try { 
			boolean result = requestService.updateRequestAddStore(reqNo);
			jsonObj.addProperty("result", result);

		} catch (DataAccessException e) {
			jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

		} catch (Exception e) {
			jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
		}
		
        System.out.println("상점 등록 수락 컨트롤러 통과");
        
		return jsonObj;
	}
	
	
	// ============ 환급 요청 등록 =============   /////// 모든 등록 이렇게 수정 (예외 적용)
	@PostMapping(value = "addRequestRefund/{userId}/{storeNo}/{refundMoney}")
	@ResponseBody
	public JsonObject addRequestRefund(@PathVariable(value = "userId", required = false) String userId,
									@PathVariable(value = "storeNo", required = false) int storeNo,
									@PathVariable(value = "refundMoney", required = false) int refundMoney) {
		
		System.out.println("==================request :: ");
		System.out.println("왜 안지나가지 ....................................");
		System.out.println("왜 안지나가지 ....................................");
		System.out.println("왜 안지나가지 ....................................");
		
		Request request = new Request();
		request.setUserId(userId);
		request.setStoreNo(storeNo);
		request.setRefundMoney(refundMoney);
		
		JsonObject jsonObj = new JsonObject();
		
		try { 
			
			boolean result = requestService.addRequestRefund(request);
			jsonObj.addProperty("result", result);

		} catch (DataAccessException e) {
			jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

		} catch (Exception e) {
			jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
		}
		
        System.out.println("환급 요청 컨트롤러 통과");
        
		return jsonObj;
	}
	

	
	
	// ========== 환급 요청 수락 ===========
	@ResponseBody
	@PatchMapping(value={"updateRequestRefund/{reqNo}/{userId}"})
	public JsonObject updateRequestRefund(@PathVariable(value = "reqNo", required = false) int reqNo,
											 @PathVariable(value = "userId", required = false) String userId) {
	
		System.out.println("/request/updateRequestRefund : PATCH");
		System.out.println("reqNo :: "+reqNo);
		
		JsonObject jsonObj = new JsonObject();
		Request request = new Request();
		
		try { 
			if (request != null) {
				System.out.println("request 객체에 값 넣어줌");
				request.setReqNo(reqNo);
				request.setUserId(userId);
			}
			
			boolean result = requestService.updateRequestRefund(request);
			jsonObj.addProperty("result", result);

		} catch (DataAccessException e) {
			jsonObj.addProperty("message", "해당 사장님의 진욱페이 잔액을 확인해주세요.");

		} catch (Exception e) {
			jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
		}
		
        System.out.println("환급 요청 수락 컨트롤러 통과");
        
		return jsonObj;
	}
	
	
	// =========== 남은 픽업개수 ===========
	 @GetMapping( value={"/countPickup/{storeNo}"} )
	   public JsonObject countPickup(@PathVariable(value = "storeNo", required = false) int storeNo) throws Exception{
	      
	      System.out.println("/request/countPickup : GET ");
	  
	      JsonObject jsonObj = new JsonObject();
	      
	      try { 
				
				int countPickup = requestService.countPickup(storeNo);
				System.out.println("픽업 개수   ::  "+countPickup);
				jsonObj.addProperty("countPickup", countPickup);

			} catch (DataAccessException e) {
				jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

			} catch (Exception e) {
				jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
			}
			
	        System.out.println("픽업 개수 컨트롤러 통과");
	        
			return jsonObj;
	   }
	 
	// ========== 상점 삭제 신청 ===========
	@PostMapping(value = {"addRequestDeleteStore/{userId}/{storeNo}"})
	public JsonObject addRequestDeleteStore(@ModelAttribute("request") Request request) {
		
	     JsonObject jsonObj = new JsonObject();

	     try { 
				boolean result = requestService.addRequestDeleteStore(request);
				jsonObj.addProperty("result", result);

			} catch (DataAccessException e) {
				jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

			} catch (Exception e) {
				jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
			}
			
	        System.out.println("상점삭제신청 컨트롤러 통과");
	        
			return jsonObj;
	}
	

	// ========== 상점 삭제 수락 ===========
	 @ResponseBody
	 @PatchMapping(value={"deleteStore/{reqNo}/{storeNo}"})
		public JsonObject deleteStore(@PathVariable(value = "reqNo", required = false) int reqNo,
										@PathVariable(value = "storeNo", required = false) int storeNo,
										 @PathVariable(value = "userId", required = false) String userId){
		
			System.out.println("/request/deleteStore : PATCH");
			System.out.println("reqNo :: "+reqNo);
			
			JsonObject jsonObj = new JsonObject();
			Request request = new Request();
			
			try { 
				if (request != null) {
					System.out.println("request 객체에 값 넣어줌");
					request.setReqNo(reqNo);
					request.setStoreNo(storeNo);
					request.setUserId(userId);
				}
				
				boolean result = requestService.deleteStore(request);
				jsonObj.addProperty("result", result);

			} catch (DataAccessException e) {
				jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

			} catch (Exception e) {
				jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
			}
	        System.out.println("환급 요청 수락 컨트롤러 통과");
	        
			return jsonObj;
		} 
	 
	 
	// ========== 광고 등록 요청 수락 ===========
	 @PatchMapping( value={"updateRequestStatusToAccept/{reqNo}"})
		public JsonObject updateRequestStatusToAccept(@PathVariable(value = "reqNo", required = false) int reqNo) {
		
			System.out.println("/request/updateRequestStatusToAccept : PATCH");
			System.out.println("reqNo :: "+reqNo);
			
			JsonObject jsonObj = new JsonObject();
			
			try { 
				int result = requestService.updateRequestStatusToAccept(reqNo);
				jsonObj.addProperty("result", result);

			} catch (DataAccessException e) {
				jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

			} catch (Exception e) {
				jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
			}
			
	        System.out.println("상점 등록 수락 컨트롤러 통과");
	        
			return jsonObj;
			
		}
	 
	 
	// ========== 광고 등록 요청 보기 ===========
	@GetMapping( value="getRequestAd/{reqNo}")
	public JSONObject getRequestAd( @PathVariable(value = "reqNo", required = false) int reqNo,  @ModelAttribute("request") Request request ) throws Exception {
		
		System.out.println("/request/getRequestAd : GET ");
	      Gson gson = new Gson();      
	      request = requestService.getRequestAd(reqNo);
				
	      String requestObj = gson.toJson(request);
	      JSONParser parser = new JSONParser();
	      JSONObject jsonObj = (JSONObject)parser.parse(requestObj);
			
		return jsonObj;
	}
	 
	 
	// ============= 요청 거절 ================
	 @PatchMapping( value={"updateRequestStatusToRefuse/{reqNo}"})
		public JsonObject updateRequestStatusToRefuse(@PathVariable(value = "reqNo", required = false) int reqNo) {
		
			System.out.println("/request/updateRequestStatusToRefuse : PATCH");
			System.out.println("reqNo :: "+reqNo);
			
			JsonObject jsonObj = new JsonObject();
			
			try { 
				int result = requestService.updateRequestStatusToRefuse(reqNo);
				jsonObj.addProperty("result", result);

			} catch (DataAccessException e) {
				jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

			} catch (Exception e) {
				jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
			}
			
	        System.out.println("상점 등록 수락 컨트롤러 통과");
	        
			return jsonObj;
		}
	 
	 
	// ================= 요청 목록 삭제 ===================
	 @DeleteMapping(value = "deleteRequest/{reqNo}")
		public JsonObject deleteRequest(@PathVariable(value="reqNo",required = false) int reqNo) {

			JsonObject jsonObj = new JsonObject();

			try {
				int result = requestService.deleteRequest(reqNo);
				jsonObj.addProperty("result", result);

			} catch (DataAccessException e) {
				jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

			} catch (Exception e) {
				jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
			}

			return jsonObj;
		}
}
	 

	

