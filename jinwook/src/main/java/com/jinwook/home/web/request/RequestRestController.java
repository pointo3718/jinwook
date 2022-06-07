package com.jinwook.home.web.request;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
	
	
	// ========== 상점 등록 요청 수락 ===========
	@GetMapping( value="json/updateRequestAddStore")
	public boolean updateRequestAddStore(@RequestParam int reqNo) throws Exception{
	
		System.out.println("/request/json/updateRequestAddStore : POST");
		System.out.println("reqNo :: "+reqNo);
		
		boolean result = requestService.updateRequestAddStore(reqNo);
		
		return result;
	}
	
	// ========== 환급 요청 수락 ===========
	// =========== 남은 픽업개수 ===========
	// ========== 상점 삭제 수락 ===========
	// ========== 광고 등록 요청 수락 ===========
	// ============= 요청 거절 ================
	// ================= 요청 목록 삭제 ===================
	// ============== 대기중인 요청 목록 개수 ================

	
}
