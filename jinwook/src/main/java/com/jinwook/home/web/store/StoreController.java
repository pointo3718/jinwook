package com.jinwook.home.web.store;


import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.store.StoreService;




@Controller
@RequestMapping("/store/*")
public class StoreController {
	
	@Autowired
	@Qualifier("storeServiceImpl")
	private StoreService storeService;
	
	public StoreController(){
		System.out.println(this.getClass());
	}

	
	@GetMapping(value = "confirmPassword")
	public String updateStore() {

		return "store/confirmPassword";
	}

	@PostMapping(value = "updateStore")
	public String updateStore(@RequestParam("storeNo") int storeNo , Store store, Model model) {
		
		storeService.updateStore(store);
		
		model.addAttribute("store", store);
		
		return "store/updateStore";
	}
	
	@GetMapping(value = "addStoreProduct")
	public String addStoreProduct() {

		return "store/addStoreProduct";
	}
	
//	@PostMapping(value = "addStoreProduct")
//	public String addStoreProduct( @ModelAttribute("product") Product product) {
//		
//		product.setSoldout(true);
//		storeService.addStoreProduct(product);
//
//		return "store/addStoreProduct";
//		
//	}
	
	@PostMapping(value = "updateStoreProduct")
	public String updateStoreProduct(@RequestParam("prodNo") int prodNo , Product product, Model model) {
		
		storeService.updateStoreProduct(product);
		
		model.addAttribute("product", product);
		
		return "store/addStoreProduct";
	}
	
	@PostMapping(value = "deleteStoreProduct")
	public String deleteStoreProduct(@RequestParam("prodNo") int prodNo, Model model) {
		
		storeService.deleteStoreProduct(prodNo);
		
		
		
		return "store/addStoreProduct";
	}
	
	@PostMapping(value = "isSoldout")
	public String isSoldout(@RequestParam("prodNo") int prodNo , Product product, Model model) {
		
		storeService.isSoldout(product);
		
		model.addAttribute("product", product);
		
		return "common/myPageTop";
	}
	
	@PostMapping(value = "isOpen")
	public String isOpen(@RequestParam("storeNo") int storeNo , Store store, Model model) {
		
		storeService.isOpen(store);
		
		model.addAttribute("store", store);
		
		return "common/myPageTop";
	}
	
	@PostMapping(value = "addOrdersCoupon")
	public String addOrdersCoupon(@RequestParam("couponNo") int couponNo , Model model) {
		
		storeService.addOrdersCoupon(couponNo);
		
		model.addAttribute("couponNo", couponNo);
		
		return "orders/addOrders";
	}
	

	@GetMapping(value = "getStore")
	public String getStore(@RequestParam("storeNo") int storeNo, Model model) {
		
		List<Store> getStore = storeService.getStore(storeNo);
		model.addAttribute("getStore", getStore);
		
		return "store/getStore";
	}

	/*
	
	@GetMapping(value = "getStoreWallet")
	public String getStoreWallet(@RequestParam HashMap<String, Object> map, Model model) {
		
//		map = new HashMap<>();
//		
//		map.put("storeNo", "store_no");					
//		map.put("orderDateStart", "order_date_start");			
//		map.put("orderDateEnd", "order_date_end");
		
		List<Store> getStoreWallet = storeService.getStoreWallet(map);
		model.addAttribute("getStoreWallet", getStoreWallet);

		return "store/getStoreWallet";
	}
	
	*/
	
	@GetMapping(value = "getStoreRefund")
	public String getStoreWallet(@RequestParam("storeNo") int storeNo, Model model) {
		
		List<Store> getStoreRefund = storeService.getStoreRefund(storeNo);
		model.addAttribute("getStoreRefund", getStoreRefund);

		return "store/getStoreRefund";
	}
	
	
	@GetMapping(value = "getCouponList")
	public String getCouponList(@RequestParam("userId") String userId, Model model) {
		
		List<Coupon> couponList = storeService.getCouponList(userId);
		model.addAttribute("couponList", couponList);

		return "orders/listOrderCoupon";
	}
	
	

}