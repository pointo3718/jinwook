package com.jinwook.home.web.store;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jinwook.home.service.domain.Cart;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.orders.OrdersService;
import com.jinwook.home.service.store.StoreService;



@Controller
@RequestMapping("/store/*")
public class StoreRestController {
	
	@Autowired
	@Qualifier("storeServiceImpl")
	private StoreService storeService;
	
	@Autowired
	@Qualifier("ordersServiceImpl")
	private OrdersService ordersService;
	
	public StoreRestController(){
		System.out.println(this.getClass());
	}
	
	
	@PostMapping(value = "json/addStoreProduct")
	public Product addStoreProduct( @RequestBody Product product) {
		
		product.setSoldout(true);
		storeService.addStoreProduct(product);

		return product;
		
	}
	
	@PostMapping(value = "json/updateStoreProduct")
	public Product updateStoreProduct(@RequestParam("prodNo") int prodNo , @RequestBody Product product) {
		
		storeService.updateStoreProduct(product);
				
		return product;
	}
	
	@PostMapping(value = "json/deleteStoreProduct")
	public Product deleteStoreProduct(@RequestParam("prodNo") int prodNo , @RequestBody Product product) {
		
		storeService.deleteStoreProduct(product);
	
		return product;
	}
	
	@PostMapping(value = "json/isSoldout")
	public Product isSoldout(@RequestParam("prodNo") int prodNo , @RequestBody Product product) {
		
		storeService.isSoldout(product);
		
		return product;
	}
	
	@PostMapping(value = "json/isOpen")
	public Store isOpen(@RequestParam("storeNo") int storeNo , @RequestBody Store store) {
		
		storeService.isOpen(store);	
		
		return store;
	}
	
	@PostMapping(value = "json/addOrderCoupon")
	public Coupon addOrderCoupon(@RequestParam("couponNo") int couponNo , @RequestBody Coupon coupon) {
		
		coupon.setCouponStatus(true);
		storeService.addOrderCoupon(coupon);
		
		
		return coupon;
	}
	
	
	@GetMapping(value = "json/getStore")
	public Cart getStore(@RequestParam("prodNo") int prodNo , @RequestBody Cart cart) {
		
		ordersService.addOrdersCart(cart);	
		
		return cart;
	}

	
	
	@GetMapping(value = "json/getStoreWallet")
	public List<Store> getStoreWallet(@PathVariable int storeNo) {
		
		List<Store> storeList = storeService.getStoreWallet(storeNo);

		return storeList;
	}
	

}