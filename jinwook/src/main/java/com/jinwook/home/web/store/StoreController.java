package com.jinwook.home.web.store;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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

import com.jinwook.home.service.board.BoardService;
import com.jinwook.home.service.domain.Attach;
import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Complain;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Recipe;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.store.StoreService;
import com.jinwook.home.service.user.UserService;

@Controller
@RequestMapping("/store/*")
public class StoreController {

   @Autowired
   @Qualifier("storeServiceImpl")
   private StoreService storeService;
   
   @Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
   
   @Autowired
   @Qualifier("userServiceImpl")
   private UserService userService;

   public StoreController() {
      System.out.println(this.getClass());
   }

//   @GetMapping(value = "confirmPassword")
//   public String updateStore() {
//
//      return "store/confirmPassword";
//   }

   @GetMapping(value = "updateStore")
   public String updateStore(@RequestParam("storeNo") int storeNo, Model model, HttpSession session) {

      Store store1 = new Store();

      String userid = ((User) session.getAttribute("user")).getUserId();
      

      store1.setUserId(userid);

      if ("false".equals(store1.getStoreStatus())) {
         // TODO => 등록된 상점이 없다는 메세지 전달 후 메인페이지로 이동
         return "redirect:/../index";
      }

      List<Store> storeInfo = storeService.getStoreInfo(userid);
      
		for (Store store11 : storeInfo) {
			Attach attach = new Attach();
			attach = storeService.selectStoreAttachList(storeNo);
			store11.setAttach(attach);
		}
      
      model.addAttribute("storeInfo", storeInfo);

      List<Store> store = storeService.getStore(storeNo);

      model.addAttribute("store", store);
      
      

      return "store/updateStore";
   }

   @GetMapping(value = "addStoreProduct")
   public String addStoreProduct(@RequestParam("storeNo") int storeNo, Model model, HttpSession session) {

      Store store1 = new Store();

      String userid = ((User) session.getAttribute("user")).getUserId();

      store1.setUserId(userid);

      if ("false".equals(store1.getStoreStatus())) {
         // TODO => 등록된 상점이 없다는 메세지 전달 후 메인페이지로 이동
         return "redirect:/../index";
      }

      List<Store> storeInfo = storeService.getStoreInfo(userid);

      model.addAttribute("storeInfo", storeInfo);

      List<Store> store = storeService.getStore(storeNo);
      
		for (Store store11 : store) {
			Attach attach = new Attach();
			attach = storeService.selectProductAttachList(store11.getProduct().getProdNo());
			store11.setAttach(attach);
		}

      model.addAttribute("store", store);
      

      return "store/addStoreProduct";
   }

   @PostMapping(value = "updateStore")
   public String updateStore(@RequestParam("storeNo") int storeNo, Store Store, Model model) {

      Store store = new Store();
      store.setStoreNo(storeNo);

      storeService.updateStore(Store);
      model.addAttribute("Store", Store);
      
      

      return "store/updateStore";
   }
   
   
   


//   @PostMapping(value = "addStoreProduct")
//   public String addStoreProduct(Product product, MultipartHttpServletRequest mpRequest) throws Exception {
//
//
//	System.out.println("/store/addStoreProduct : POST");
//      
//		//////// 파일 업로드 ///////
//		List<MultipartFile> fileList = mpRequest.getFiles("file");
//      String src = mpRequest.getParameter("src");
//
//      String path = "C:\\Users\\sujin\\git\\jinwook\\jinwook\\src\\main\\webapp\\resources\\static\\";
//
//      for (MultipartFile mf : fileList) {
//          String originFileName = mf.getOriginalFilename(); // 원본 파일 명
//          long fileSize = mf.getSize(); // 파일 사이즈
//
//          System.out.println("originFileName : " + originFileName);
//          System.out.println("fileSize : " + fileSize);
//
//          String safeFile = path + originFileName;
//          System.out.println(safeFile);
//          try {
//              mf.transferTo(new File(safeFile));
//              storeService.addStoreProduct(product, mpRequest);//상품 등록
//          } catch (IllegalStateException e) {
//              // TODO Auto-generated catch block
//              e.printStackTrace();
//          } catch (IOException e) {
//              // TODO Auto-generated catch block
//              e.printStackTrace();
//          }
//      }
//		
//		///////////////////////////
//
//      return "store/addStoreProduct?storeNo=10000";
//
//   }
   
   
	@PostMapping(value = "addStoreProduct")
	
	public String addStoreProduct(@ModelAttribute Product product, MultipartHttpServletRequest mpRequest) throws Exception {
		
		System.out.println("/store/addStoreProduct : POST");

		//////// 파일 업로드 ///////
		List<MultipartFile> fileList = mpRequest.getFiles("file");
       String src = mpRequest.getParameter("src");

       String path = "C:\\Users\\sujin\\git\\jinwook\\jinwook\\src\\main\\webapp\\resources\\static\\";

       for (MultipartFile mf : fileList) {
           String originFileName = mf.getOriginalFilename(); // 원본 파일 명
           long fileSize = mf.getSize(); // 파일 사이즈

           System.out.println("originFileName : " + originFileName);
           System.out.println("fileSize : " + fileSize);

           String safeFile = path + originFileName;
           System.out.println(safeFile);
           try {
               mf.transferTo(new File(safeFile));
               storeService.addStoreProduct(product, mpRequest);//상점 등록
           } catch (IllegalStateException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
           } catch (IOException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
           }
       }
		
		///////////////////////////
		
		return "/store/addStoreProduct";
	}
   
   
   
   

//   @PostMapping(value = "updateStoreProduct")
//   public String updateStoreProduct(@RequestParam("prodNo") int prodNo , Product product, Model model) {
//      
//      storeService.updateStoreProduct(product);
//      
//      model.addAttribute("product", product);
//      
//      return "store/addStoreProduct";
//   }

//   @PostMapping(value = "deleteStoreProduct")
//   public String deleteStoreProduct(@RequestParam("prodNo") int prodNo, Model model) {
//      
//      storeService.deleteStoreProduct(prodNo);
//      
//      
//      
//      return "store/addStoreProduct";
//   }

   @PostMapping(value = "isSoldout")
   public String isSoldout(@RequestParam("prodNo") int prodNo, Product product, Model model) {

      storeService.isSoldout(product);

      model.addAttribute("product", product);

      return "common/myPageTop";
   }

   @PostMapping(value = "isOpen")
   public String isOpen(@RequestParam("storeNo") int storeNo, Store store, Model model) {

      storeService.isOpen(store);

      model.addAttribute("store", store);

      return "common/myPageTop";
   }

   @PostMapping(value = "addOrdersCoupon")
   public String addOrdersCoupon(@RequestParam("couponNo") int couponNo, Model model) {

      storeService.addOrdersCoupon(couponNo);

      model.addAttribute("couponNo", couponNo);

      return "orders/addOrders";
   }

   @GetMapping(value = "getStore")
   public String getStore(Store store, @RequestParam("storeNo") int storeNo, 
		   @RequestParam(value = "userId", required = false) String userId,
		   @ModelAttribute("orders") Orders orders,
		   Model model) throws Exception {
	   	   
			   
	   		List<Store> getStore = storeService.getStore(storeNo);
         
			for (Store store1 : getStore) {
				Attach attach = new Attach();
				attach = storeService.selectProductAttachList(store1.getProduct().getProdNo());
				store1.setAttach(attach);
			}
			
			model.addAttribute("getStore", getStore);
			
			List<Store> getStore1 = storeService.getStore(storeNo);
			
			for (Store store11 : getStore1) {
				Attach attach = new Attach();
				attach = storeService.selectStoreAttachList(storeNo);
				store11.setAttach(attach);
			}
			
			model.addAttribute("getStore1", getStore1);
			
			System.out.println(getStore);
	   
      List<Orders> getReviewList = boardService.getReviewList(orders);
      model.addAttribute("getReviewList", getReviewList);

      return "store/getStore";
   }

   
   @GetMapping(value = "getStoreWallet")
   public String getStoreWallet(@RequestParam("storeNo") int storeNo, @ModelAttribute("store") Store store, Model model, HttpSession session) {

      String userid = ((User) session.getAttribute("user")).getUserId();

      store.setUserId(userid);

      List<Store> getStoreRefund = storeService.getStoreRefund(storeNo);
      model.addAttribute("getStoreRefund", getStoreRefund);

      List<Store> getStoreWallet = storeService.getStoreWallet(store);
      model.addAttribute("getStoreWallet", getStoreWallet);

      List<Store> storeInfo = storeService.getStoreInfo(userid);
      model.addAttribute("storeInfo", storeInfo);

      return "store/getStoreWallet";
   }

//   @GetMapping(value = "getStoreRefund")
//   public String getStoreRefund(@RequestParam("storeNo") int storeNo, Model model) {
//      
//      List<Store> getStoreRefund = storeService.getStoreRefund(storeNo);
//      model.addAttribute("getStoreRefund", getStoreRefund);
//
//      return "store/getStoreRefund";
//   }

   @GetMapping(value = "getCouponList")
   public String getCouponList(@RequestParam("userId") String userId, Model model, HttpSession session) {

      Store store = new Store();

      String userid = ((User) session.getAttribute("user")).getUserId();

      store.setUserId(userid);

      List<Coupon> couponList = storeService.getCouponList(userId);
      model.addAttribute("couponList", couponList);

      return "store/getCouponList";
   }
   
   @GetMapping(value = "getCouponCount1")
   public String getCouponCount(@RequestParam("userId") String userId, Model model, HttpSession session) {

      Store store = new Store();

      String userid = ((User) session.getAttribute("user")).getUserId();

      store.setUserId(userid);

      int getCouponCount = storeService.getCouponCount(userId);
      model.addAttribute("getCouponCount", getCouponCount);
      


      return "store/getCouponCount";
   }
   
   @GetMapping(value = "getStoreNo")
   public String getStoreNo( @ModelAttribute("store") Store store, Model model, HttpSession session) {

      String userId = ((User) session.getAttribute("user")).getUserId();

      store.setUserId(userId);

      List<Store> getStoreNo = storeService.getStoreNo(userId);
      model.addAttribute("getStoreNo", getStoreNo);


      return "store/getStoreNo";
   }

}