package com.jinwook.home.web.request;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jinwook.home.service.domain.Request;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.request.RequestService;
import com.jinwook.home.service.store.StoreService;

@Controller
@RequestMapping("/request/*")
public class RequestController {
	
	@Autowired
	@Qualifier("requestServiceImpl")
	private RequestService requestService;
	
	@Autowired
	@Qualifier("storeServiceImpl")
	private StoreService storeService;
	
	public RequestController(){
		System.out.println(this.getClass());
	}
	
	
	// ========== 상점 등록 요청 !!!!!!! 요청 목록 만들고 다시 !!!!!!!===========
	@PostMapping(value = "addRequestAddStore")
	public String addRequestAddStore(@ModelAttribute("Store") Store store) {
		
		System.out.println("/request/addRequestAddStore : POST");
		
		requestService.addRequestAddStore(store);

		return "redirect:/request/getRequestAdStoreList";
	}
	
	
	
	// ============ 환급 요청 등록 =============   /////// 모든 등록 이렇게 수정 (예외 적용)
	//@PostMapping(value = "addRequestRefund")
	public String addRequestRefund(@ModelAttribute("request") Request request, Model model) {
		
		System.out.println("==================request :: "+ request);
		System.out.println("왜 안지나가지 ....................................");
		System.out.println("왜 안지나가지 ....................................");
		System.out.println("왜 안지나가지 ....................................");
		
		try {
			boolean result = requestService.addRequestRefund(request);
			if (result == false) {
				// TODO => 게시글 등록에 실패하였다는 메시지를 전달
			}
		} catch (DataAccessException e) {
			// TODO => 데이터베이스 처리 과정에 문제가 발생하였다는 메시지를 전달

		} catch (Exception e) {
			// TODO => 시스템에 문제가 발생하였다는 메시지를 전달
		}
		return "/store/getStoreWallet?storeNo=" +request.getStoreNo();
	}
	
	
	// ========== 상점 삭제 신청 ===========
	@PostMapping(value = "addRequestDeleteStore")
	public String addRequestDeleteStore(@ModelAttribute("request") Request request) {
		try {
			boolean result = requestService.addRequestDeleteStore(request);
			if (result == false) {
				// TODO => 등록에 실패하였다는 메시지를 전달
			}
		} catch (DataAccessException e) {
			// TODO => 데이터베이스 처리 과정에 문제가 발생하였다는 메시지를 전달

		} catch (Exception e) {
			// TODO => 시스템에 문제가 발생하였다는 메시지를 전달
		}
		return "redirect:/request/addRequestDeleteStore";
	}
	
	
	// ========== 광고 등록 신청 폼 ===========
	@GetMapping(value = "addRequestAd")
	public String addRequestAdView(@RequestParam("storeNo") int storeNo, Model model) {
		List<Store> storeInfo = storeService.getStoreInfo(storeNo);
		model.addAttribute("storeInfo", storeInfo);
		return "/request/addRequestAdView";
	}
	
	// ========== 광고 등록 신청 ===========
	@PostMapping(value = "addRequestAd")
	public String addRequestAd(@ModelAttribute("request") Request request) {
		try {
			boolean result = requestService.addRequestAd(request);
			if (result == false) {
				// TODO => 등록에 실패하였다는 메시지를 전달
			}
		} catch (DataAccessException e) {
			// TODO => 데이터베이스 처리 과정에 문제가 발생하였다는 메시지를 전달

		} catch (Exception e) {
			// TODO => 시스템에 문제가 발생하였다는 메시지를 전달
		}
		return "redirect:/request/getRequestAdStoreList";
	}
	
	// ========== 광고 등록 요청 보기 ===========
	@GetMapping( value="getRequestAd")
	public String getRequestAd( @RequestParam("reqNo") int reqNo , Model model ) throws Exception {
		
		System.out.println("/request/getRequestAd : GET");
		
		Request request = requestService.getRequestAd(reqNo);
		model.addAttribute("request", request);
		
		return "request/getRequestAd";
	}
	
	// ========== 상점/광고 신청 목록 (사장님용) ============ /////////// 다시
	@GetMapping(value = "getRequestAdStoreList")
	public String listUserAdmin(@RequestParam("storeNo") int storeNo, @RequestParam("userId") String userId, Model model) {
		List<Request> requestList = requestService.getRequestAdStoreList(userId);
		
		List<Store> storeInfo = storeService.getStoreInfo(storeNo);
	      
	    model.addAttribute("storeInfo", storeInfo);
		model.addAttribute("requestList", requestList);

		return "/request/listRequestForBoss";
	}
	
	
	// ============== 요청 목록 (관리자용) ================
	@GetMapping(value = "getRequestListForAdmin")
	public String getRequestListForAdmin(@RequestParam("reqCode") String reqCode, @ModelAttribute("request") Request request, Model model) {
		request.setReqCode(reqCode);
		
		List<Request> requestList = requestService.getRequestListForAdmin(request);
		model.addAttribute("requestList", requestList);

		return "/request/getRequestListForAdmin";
	}
	
}
