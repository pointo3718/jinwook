package com.jinwook.home.web.orders;

import java.util.List;

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

import com.jinwook.home.service.domain.Cart;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.orders.OrdersService;

@Controller
@RequestMapping("/orders/*")
public class OrdersController {

	@Autowired
	@Qualifier("ordersServiceImpl")
	
	private OrdersService ordersService;
	
	public OrdersController() {
		System.out.println(this.getClass());
	}
	
//	@PostMapping(value = "addOrders")
//	public String addOrders(@ModelAttribute("orders") Orders orders,HttpSession session) {
//		
//		System.out.println("/orders/addOrders: POST");
//		User user = (User) session.getAttribute("user");
//		
//		
//		return null;
//	}

	@PostMapping(value = "addOrdersCart")
	public String addOrdersCart(@ModelAttribute("cart")	Cart cart,HttpSession session)throws Exception {
		User user = (User) session.getAttribute("user");
//		Product product = new Product();
		
//		cart.setProduct(prodNo);
//		cart.setPrice(prodNo);
//		cart.setUserId(user.getUserId());
		
		ordersService.addOrdersCart(cart);
		
		return "/cart/addOrderCart";
	}
	
	
	@GetMapping(value = "getOrdersCartList")
	public String getOrdersCartList(@ModelAttribute("cart") Cart cart) {
		List<Cart> getCartList = ordersService.getOrdersCartList(cart);
		
		return null;
	}
	
}
