package com.jinwook.home.web.orders;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.jinwook.home.service.domain.Cart;
import com.jinwook.home.service.domain.Jpay;
import com.jinwook.home.service.domain.Notice;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.orders.OrdersService;
import com.jinwook.home.service.store.StoreService;
import com.jinwook.home.service.user.UserService;

@RestController
@RequestMapping("/orders/*")
public class OrdersRestController {
	
	///Field
	@Autowired
	@Qualifier("ordersServiceImpl")
	private OrdersService ordersService;
	
	public OrdersRestController(){
		System.out.println(this.getClass());
	}
	
	@GetMapping(value = "updateOrdersCart/{cartNo}/{prodCount}")
	public int updateOrdersCart(HttpSession session,@PathVariable(value="cartNo", required=false) int cartNo,
			@PathVariable(value="prodCount",required=false) int prodCount) throws Exception{
		
		System.out.println("/orders/updateOrdersCart : GET");
		
		Cart cart = new Cart();
		String userid = ((User) session.getAttribute("user")).getUserId();
		
		cart.setUserId(userid);
		cart.setCartNo(cartNo);
		cart.setProdCount(prodCount);
		int result = ordersService.updateOrdersCart(cart);
		System.out.println(result+"update cart");
		
		return result;
	}
	
	@GetMapping(value = "deleteOrdersCart/{cartNo}")
	public JsonObject deleteOrdersCart(@PathVariable(value="cartNo",required = false) int cartNo){
		
		System.out.println("/orders/deleteOrdersCart : GET");
		System.out.println("rest cartNo"+cartNo);
		
		JsonObject jsonObj = new JsonObject();
		
		try {
			int result = ordersService.deleteOrdersCart(cartNo);
			System.out.println("result"+result);
			jsonObj.addProperty("result", result);

		} catch (DataAccessException e) {
			jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");
		} catch (Exception e) {
			jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
		}
		System.out.println("jsonObj"+jsonObj);
		return jsonObj;
	}
	
	@GetMapping(value = "addOrdersCart/{prodNo}/{storeNo}/{storeName}/{prodCount}")
	public int addOrdersCart(@ModelAttribute("cart")Cart cart,@PathVariable(value="prodNo",required = false) int prodNo,@PathVariable(value="storeNo",required = false)int storeNo,
							HttpSession session,@PathVariable(value="storeName",required = false)String storeName,@PathVariable(value="prodCount",required = false)int prodCount) throws Exception {
	System.out.println("gogogogod");
	User user = (User) session.getAttribute("user");
	Product product =new Product();
	product.setProdNo(prodNo);
	cart.setProduct(product);
	cart.setUserId(user.getUserId());
	cart.setStoreNo(storeNo);
	cart.setStoreName(storeName);
	System.out.println(storeNo+"우우우우우우우");
	System.out.println(storeName+"으으으으으으");
	System.out.println(cart+"킼");
	int result = ordersService.addOrdersCart(cart);
	       return result;
	}
	
	@PostMapping(value = "deleteOrderCartAfter")
	public int deleteOrderCartAfter(@ModelAttribute("cart") Cart cart) throws Exception {
		
		System.out.println("/orders/deleteOrderCartAfter : POST");
		
		int result = ordersService.deleteOrdersCartAfter(cart);

		return result;
	}
	
	@PostMapping(value = "deleteOrdersCartAll")
	public int deleteOrdersCartAll(@RequestParam("cartStatus") boolean cartStatus)  throws Exception {
		
		System.out.println("/orders/deleteOrdersCartAll : POST");
		
		int result = ordersService.deleteOrdersCartAll(false);
		
		return result;
	}
	
	@PostMapping(value = "addOrdersjBCharge")
	public int addOrdersjBCharge(@ModelAttribute("jpay") Jpay jpay) throws Exception {
		
		System.out.println("/orders/addOrdersjBCharge : POST");
		
		int result = ordersService.addOrdersjBCharge(jpay);
		
		return  result;
	}
	
	@PostMapping(value ="updateOrdersCeoJb") 
	public int updateOrdersCeoJb(@ModelAttribute("jpay") Jpay jpay) throws Exception {
		
		System.out.println("/orders/updateOrdersCeoJb : POST");
		
		int result = ordersService.updateOrdersCeoJb(jpay);
		
		return result;
	}
	
	@PostMapping(value="updateOrdersCeoEarn") 
	public int updateOrdersCeoEarn(@ModelAttribute("store") Store store) throws Exception {
		
		System.out.println("/orders/updateOrdersCeoEarn : POST");
		
		int result = ordersService.updateOrdersCeoEarn(store);
		
		return result;
	}
	
	@PostMapping(value = "addOrdersNotice") 
	public int addOrdersNotice(@ModelAttribute("notice") Notice notice) throws Exception {
		
		System.out.println("/orders/addOrdersNotice : POST");
		
		int result = ordersService.addOrdersNotice(notice);
		
		return result;
	}
	
	@PostMapping(value = "deleteOrdersNotice") 
	public String deleteOrdersNotice(@RequestParam("notiNo") int notiNo) throws Exception {
		
		System.out.println("/orders/deleteOrdersNotice : POST");
		
		ordersService.deleteOrdersNotice(notiNo);

		return "orders/getOrdersNoticelist";
	}
	

}