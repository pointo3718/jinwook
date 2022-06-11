package com.jinwook.home.web.store;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.jinwook.home.service.domain.Cart;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Request;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.orders.OrdersService;
import com.jinwook.home.service.store.StoreService;

@RestController
@RequestMapping("/store/*")
public class StoreRestController {

	@Autowired
	@Qualifier("storeServiceImpl")
	private StoreService storeService;

	@Autowired
	@Qualifier("ordersServiceImpl")
	private OrdersService ordersService;

	public StoreRestController() {
		System.out.println(this.getClass());
	}

	
	  @PostMapping(value = "addStoreProduct/{storeNo}")
	   public JsonObject addStoreProduct(@PathVariable(value = "storeNo", required = false) int storeNo, @RequestBody Product product) {

		    System.out.println("/store/addStoreProduct : Post ");

			JsonObject jsonObj = new JsonObject();

			try {
				if (product != null) {
					System.out.println("product 객체에 값 넣어줌");
					product.setStoreNo(storeNo);
				}
				
				System.out.println("컨트롤러에서의 Product :: "+product);

				 storeService.addStoreProduct(product);

			} catch (DataAccessException e) {
				jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

			} catch (Exception e) {
				jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
			}
			
	        System.out.println("상품 등록 컨트롤러 통과");
	        
			return jsonObj;
			
	  }

	  @PostMapping(value = "updateStoreProduct/{prodNo}")
	   public JsonObject updateStoreProduct(@PathVariable(value = "prodNo", required = false) int prodNo, 
			   									@RequestBody Product product) {

		    System.out.println("/store/updateStoreProduct : PATCH ");

			JsonObject jsonObj = new JsonObject();

			try {
				if (product != null) {
					System.out.println("product 객체에 값 넣어줌");
					product.setProdNo(prodNo);
				}
				
				System.out.println("컨트롤러에서의 Product :: "+product);

				boolean result = storeService.updateStoreProduct(product);
				jsonObj.addProperty("result", result);

			} catch (DataAccessException e) {
				jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

			} catch (Exception e) {
				jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
			}
			
	        System.out.println("상품 수정 컨트롤러 통과");
	        
			return jsonObj;
			
	  }

	@PostMapping(value = "deleteStoreProduct/{prodNo}")
	public JsonObject deleteStoreProduct(@PathVariable(value="prodNo",required = false) int prodNo){
		
		System.out.println("/orders/deleteStoreProduct : POST");
		
		JsonObject jsonObj = new JsonObject();
		
		try {
			boolean result = storeService.deleteStoreProduct(prodNo);
			jsonObj.addProperty("result", result);

		} catch (DataAccessException e) {
			jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

		} catch (Exception e) {
			jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
		}

		return jsonObj;
	}

	@PostMapping(value = "isSoldout/{prodNo}/{soldout}")
	@ResponseBody
	public JsonObject isSoldout(@PathVariable(value="prodNo",required = false) int prodNo
								,@PathVariable(value="soldout",required = false) boolean soldout) {

	    System.out.println("/store/isSoldout : Post ");

		JsonObject jsonObj = new JsonObject();
		
		Product product = new Product();

		try {
			if (product != null) {
				System.out.println("product 객체에 값 넣어줌");
				product.setProdNo(prodNo);
				product.setSoldout(soldout);
			}
			
			System.out.println("컨트롤러에서의 Store :: "+product);

			boolean result=storeService.isSoldout(product);
			jsonObj.addProperty("result", result);


		} catch (DataAccessException e) {
			jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

		} catch (Exception e) {
			jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
		}
		
        System.out.println("상품 매진 컨트롤러 통과");
        
		return jsonObj;
		
  }

	@PostMapping(value = "isOpen/{storeNo}/{open}")
	@ResponseBody
	public JsonObject isOpen(@PathVariable(value="storeNo",required = false) int storeNo,
							@PathVariable(value="open",required = false) boolean open) {

	    System.out.println("/store/isOpen : Post ");

		JsonObject jsonObj = new JsonObject();
		
		Store store = new Store();

		try {
			if (store != null) {
				System.out.println("product 객체에 값 넣어줌");
				store.setStoreNo(storeNo);
				store.setOpen(open);
			}
			
			System.out.println("컨트롤러에서의 Store :: "+store);

			boolean result=storeService.isOpen(store);
			jsonObj.addProperty("result", result);


		} catch (DataAccessException e) {
			jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

		} catch (Exception e) {
			jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
		}
		
        System.out.println("상점 오픈/마감 컨트롤러 통과");
        
		return jsonObj;
		
  }

	@PostMapping(value = "addOrdersCoupon/{couponNo}")
	public JsonObject addOrdersCoupon(@PathVariable(value="couponNo",required = false) int couponNo){
		
		System.out.println("/orders/addOrdersCoupon : POST");
		
		JsonObject jsonObj = new JsonObject();
		
		try {
			boolean result = storeService.addOrdersCoupon(couponNo);
			jsonObj.addProperty("result", result);

		} catch (DataAccessException e) {
			jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

		} catch (Exception e) {
			jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
		}

		return jsonObj;
	}
	
	   @PostMapping( value="/getStoreWallet/{storeNo}/{orderDateStart}/{orderDateEnd}" )
	   public JsonObject getStoreWallet(@PathVariable(value="storeNo",required = false) int storeNo, 
			   							@PathVariable(value="orderDateStart",required = false) Date orderDateStart,
			   							@PathVariable(value="orderDateEnd",required = false) Date orderDateEnd) throws Exception{
	      
	      System.out.println("/orders/getStoreWallet : POST ");
	  
	      JsonObject jsonObj = new JsonObject();
	      
	      Store store = new Store();
	      
	      HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("storeNo", "store_no");					
			map.put("orderDateStart", "order_date_start");			
			map.put("orderDateEnd", "order_date_end");
	      
	      
			try {
				if (store != null) {
					System.out.println("product 객체에 값 넣어줌");
				}
				
				System.out.println("컨트롤러에서의 Product :: "+store);

				storeService.getStoreWallet(map);
				jsonObj.addProperty("storeNo", storeNo);


			} catch (DataAccessException e) {
				jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

			} catch (Exception e) {
				jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
			}
			
	        System.out.println("지갑 조회 컨트롤러 통과");
	        
			return jsonObj;
			
	  }
	   
//		@PostMapping(value = "addOrdersCart/{prodNo}")
//		public JsonObject getStore(@PathVariable(value = "prodNo", required = false) int prodNo, @RequestBody Cart cart) {
//
//			System.out.println("/store/addOrdersCart : Post ");
//
//			JsonObject jsonObj = new JsonObject();
//
//			try {
//				if (cart != null) {
//					System.out.println("product 객체에 값 넣어줌");
//				}
//				
//				System.out.println("컨트롤러에서의 Product :: "+cart);
//
//				ordersService.addOrdersCart(cart);
//
//
//			} catch (DataAccessException e) {
//				jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");
//
//			} catch (Exception e) {
//				jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
//			}
//			
//	        System.out.println("상품 등록 컨트롤러 통과");
//	        
//			return jsonObj;
//			
//	  }
//
//			    
//		@GetMapping(value = "json/getStoreWallet")
//		public List<Store> getStoreWallet(@PathVariable int storeNo) {
//
//			List<Store> storeList = storeService.getStoreWallet(storeNo);
//
//			return storeList;
//		}
	   


}