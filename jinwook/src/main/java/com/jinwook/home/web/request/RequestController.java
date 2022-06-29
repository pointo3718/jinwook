package com.jinwook.home.web.request;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	
	
	// ========== 마이페이지 폼 ===========
	@GetMapping(value = "myPage")
	public String mypage() {
		return "/user/myPage";
	}
	
	// ========== 상점 등록 요청 !!!!!!! 요청 목록 만들고 다시 !!!!!!!===========
	@PostMapping(value = "addRequestAddStore")
	
	public String addRequestAddStore(Store store, HttpSession session, MultipartHttpServletRequest mpRequest
										) throws Exception {
		
		System.out.println("/request/addRequestAddStore : POST");
		
		String sessionUserId = ((User) session.getAttribute("user")).getUserId();
		store.setUserId(sessionUserId);

		//////// 파일 업로드 ///////
		List<MultipartFile> fileList = mpRequest.getFiles("file");
        String src = mpRequest.getParameter("src");

        String path = "C:\\Users\\ghdtj\\git\\jinwook\\jinwook\\src\\main\\webapp\\resources\\static\\";

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);

            String safeFile = path + originFileName;
            System.out.println(safeFile);
            try {
                mf.transferTo(new File(safeFile));
                requestService.addRequestAddStore(store, mpRequest);//레시피 등록
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
		
		///////////////////////////
		
		return "redirect:/request/getRequestAdStoreList";
	}

	
	// ============ 환급 요청 등록 =============   /////// 모든 등록 이렇게 수정 (예외 적용)
	@PostMapping(value = "addRequestRefund")
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

	
	// ========== 광고 등록 신청 폼 ===========
	@GetMapping(value = "addRequestAd")
	public String addRequestAdView(Model model, HttpSession session) {
		String userId = ((User) session.getAttribute("user")).getUserId();

		List<Store> storeInfo = storeService.getStoreInfo(userId);
		model.addAttribute("storeInfo", storeInfo);
		return "/request/addRequestAdView";
	}
	
	// ========== 광고 등록 신청 ===========
	@PostMapping(value = "addRequestAd")
	public String addRequestAd(Request request, HttpSession session, MultipartHttpServletRequest mpRequest) throws Exception {
		String sessionUserId = ((User) session.getAttribute("user")).getUserId();
		request.setUserId(sessionUserId);
		
		try {
			boolean result = requestService.addRequestAd(request, mpRequest);
			if (result == false) {
				// TODO => 등록에 실패하였다는 메시지를 전달
			}
		} catch (DataAccessException e) {
			// TODO => 데이터베이스 처리 과정에 문제가 발생하였다는 메시지를 전달

		} catch (Exception e) {
			// TODO => 시스템에 문제가 발생하였다는 메시지를 전달
		}
		
		//////// 파일 업로드 ///////
		List<MultipartFile> fileList = mpRequest.getFiles("file");
		String src = mpRequest.getParameter("src");

		String path = "C:\\Users\\ghdtj\\git\\jinwook\\jinwook\\src\\main\\webapp\\resources\\static\\";

	       for (MultipartFile mf : fileList) {
	           String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	           long fileSize = mf.getSize(); // 파일 사이즈
	
	           System.out.println("originFileName : " + originFileName);
	           System.out.println("fileSize : " + fileSize);
	
	           String safeFile = path + originFileName;
	           System.out.println(safeFile);
	           try {
	               mf.transferTo(new File(safeFile));
	               requestService.addRequestAd(request, mpRequest);//광고 등록
	           } catch (IllegalStateException e) {
	               // TODO Auto-generated catch block
	               e.printStackTrace();
	           } catch (IOException e) {
	               // TODO Auto-generated catch block
	               e.printStackTrace();
	           }
	       }
		return "redirect:/request/getRequestAdStoreList?storeNo=" + request.getStoreNo() + "&userId=" +sessionUserId;
	}
	

	
	// ========== 상점/광고 신청 목록 (사장님용) ============ /////////// 다시
	@GetMapping(value = "getRequestAdStoreList")
	public String getRequestAdStoreList(HttpSession session, Model model) {
		String userId = ((User) session.getAttribute("user")).getUserId();
		List<Request> requestList = requestService.getRequestAdStoreList(userId);
		
		List<Store> storeInfo = storeService.getStoreInfo(userId);
	      
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
