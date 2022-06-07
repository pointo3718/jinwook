package com.jinwook.home.web.store;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;
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
	
	@PostMapping(value = "addStoreProduct")
	public String addStoreProduct( @ModelAttribute("product") Product product) {
		
		product.setSoldout(true);
		storeService.addStoreProduct(product);

		return "store/addStoreProduct";
		
	}
	
	@PostMapping(value = "updateStoreProduct")
	public String updateStoreProduct(@RequestParam("prodNo") int prodNo , Product product, Model model) {
		
		storeService.updateStoreProduct(product);
		
		model.addAttribute("product", product);
		
		return "store/addStoreProduct";
	}
	
	@PostMapping(value = "deleteStoreProduct")
	public String deleteStoreProduct(@RequestParam("prodNo") int prodNo , Product product, Model model) {
		
		storeService.deleteStoreProduct(product);
		
		model.addAttribute("product", product);
		
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
	
	@PostMapping(value = "addOrderCoupon")
	public String addOrderCoupon(@RequestParam("couponNo") int couponNo , Coupon coupon, Model model) {
		
		coupon.setCouponStatus(true);
		storeService.addOrderCoupon(coupon);
		
		model.addAttribute("coupon", coupon);
		
		return "orders/addOrders";
	}
	
	
	@GetMapping(value = "getStore/{storeNo}")
	public String getStore(@RequestParam("storeNo") int storeNo, Model model) {
		List<Store> storeList = storeService.getStore(storeNo);
		model.addAttribute("storeList", storeList);

		return "/store/getStore";
	}
	
	@GetMapping(value = "getStoreWallet/{storeNo}")
	public String getStoreWallet(int storeNo, Model model) {
		List<Store> storeList = storeService.getStoreWallet(storeNo);
		model.addAttribute("storeList", storeList);

		return "/store/getStoreWallet";
	}
	
	
	@GetMapping(value = "getCouponList/{userId}")
	public String getCouponList(Model model, HttpSession session) {
		
		User user = (User)session.getAttribute("user");
		
		List<Coupon> couponList = storeService.getCouponList(user.getUserId());
		model.addAttribute("couponList", couponList);

		return "/orders/listOrderCoupon";
	}
	

}