package com.jinwook.home.web.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.jinwook.home.service.domain.Cart;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Request;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.orders.OrdersService;
import com.jinwook.home.service.store.StoreService;

//@RestController
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

//	@PostMapping(value = "addStoreProduct")
//	public Product addStoreProduct(@RequestBody Product product) {
//
//		product.setSoldout(true);
//		storeService.addStoreProduct(product);
//
//		return product;
//
//	}

//	@PostMapping(value = "store/addStoreProduct")
//	public String addStoreProduct(@RequestBody Product product) {
//		return "storeNo : " + product.getStoreNo() + ", prodName : " + product.getProdName()+", "
//				+ "price:"+product.getPrice()+",prodInfo:"+product.getProdInfo()+", prodImg"+product.getProdImg()+", prodOrign"+product.getProdOrign();
//	}
//	
//	@PostMapping( value={"addStoreProduct"})
//	public JsonObject addStoreProduct(@ModelAttribute("product") Product product) {
//	
//		System.out.println("/store/addStoreProduct : PATCH");
//		
//		JsonObject jsonObj = new JsonObject();
//		
//		try { 
//			
//			storeService.addStoreProduct(product);
//			jsonObj.addProperty("product", product);
//
//		} catch (DataAccessException e) {
//			jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");
//
//		} catch (Exception e) {
//			jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
//		}
//		
//        System.out.println("상품 등록 완료");
//        
//		return jsonObj;
//	}

	@PostMapping(value = "json/updateStoreProduct")
	public Product updateStoreProduct(@RequestParam("prodNo") int prodNo, @RequestBody Product product) {

		storeService.updateStoreProduct(product);

		return product;
	}

	@PostMapping(value = "json/deleteStoreProduct")
	public Product deleteStoreProduct(@RequestParam("prodNo") int prodNo, @RequestBody Product product) {

		storeService.deleteStoreProduct(product);

		return product;
	}

	@PostMapping(value = "json/isSoldout")
	public Product isSoldout(@RequestParam("prodNo") int prodNo, @RequestBody Product product) {

		storeService.isSoldout(product);

		return product;
	}

	@PostMapping(value = "json/isOpen")
	public Store isOpen(@RequestParam("storeNo") int storeNo, @RequestBody Store store) {

		storeService.isOpen(store);

		return store;
	}

	@PostMapping(value = "json/addOrderCoupon")
	public Coupon addOrderCoupon(@RequestParam("couponNo") int couponNo, @RequestBody Coupon coupon) {

		coupon.setCouponStatus(true);
		storeService.addOrderCoupon(coupon);

		return coupon;
	}

	@GetMapping(value = "json/getStore")
	public Cart getStore(@RequestParam("prodNo") int prodNo, @RequestBody Cart cart) {

		ordersService.addOrdersCart(cart);

		return cart;
	}

//	@GetMapping(value = "json/getStoreWallet")
//	public List<Store> getStoreWallet(@PathVariable int storeNo) {
//
//		List<Store> storeList = storeService.getStoreWallet(storeNo);
//
//		return storeList;
//	}

}