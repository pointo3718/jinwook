package com.jinwook.home.web.store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.store.StoreService;
import com.jinwook.home.service.user.UserService;
import com.model2.mvc.service.domain.User;


@Controller
public class StoreController {

	@Autowired
	@Qualifier("storeServiceImpl")
	private StoreService storeService;
	
	@Autowired
	@Qualifier("UserServiceImpl")
	private UserService userService;

	@PostMapping(value = "updateStore")
	public String updateStore(Model model) {
		return "store/updateStore";
	}
	
	@PostMapping(value = "addStoreProduct")
	public String addStoreProduct( @ModelAttribute("product") Product product) {
		
		product.setSoldout(true);
		storeService.addStoreProduct(product);

		return "store/addStoreProduct";
	}
	
	@PostMapping(value = "updateStoreProduct")
	public String updateStoreProduct(Model model) {
		return "store/addStoreProduct";
	}
	
	@PostMapping(value = "deleteStoreProduct")
	public String deleteStoreProduct(Model model) {
		return "store/addStoreProduct";
	}
	
	@PostMapping(value = "isSoldout")
	public String isSoldout(Model model) {
		return "common/myPageTop";
	}
	
	@PostMapping(value = "isOpen")
	public String isOpen(Model model) {
		return "common/myPageTop";
	}
	
	@PostMapping(value = "addOrderCoupon")
	public String addOrderCoupon(Model model) {
		return "orders/?";
	}
	
	@PostMapping(value = "getCouponList")
	public String getCouponList(Model model) {
		return "orders/?";
	}
	
	@PostMapping(value = "getStore")
	public String getStore(Model model) {
		return "store/getStore";
	}
	
	@PostMapping(value = "getStoreWallet")
	public String getStoreWallet(Model model) {
		return "store/getStoreWallet";
	}

}