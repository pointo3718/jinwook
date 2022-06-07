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
	
	@GetMapping(value = "addOrders")
	public String addOrders(@ModelAttribute("orders") Orders orders,HttpSession session,@ModelAttribute("product") Product product) throws Exception {
		System.out.println("/orders/addOrders: GET");
		
		User user = (User) session.getAttribute("user");
//		Product product = new Product();
//		product.set
		
		Cart cart = new Cart();
		cart.setProduct(product);
		
		orders.setUser(user);
		orders.setCart(cart);
		
		return "orders/addOrders";
	}
	
	@PostMapping(value = "addOrders")
	public String addOrders(@ModelAttribute("orders") Orders orders) throws Exception {
		
		System.out.println("/orders/addOrders: POST");
		
		return "orders/addOrdersView";
	}
	
	
	@PostMapping(value = "updateOrders")
	public String updateOrders(@ModelAttribute("orders") Orders orders, Model model) throws Exception {
		
		System.out.println("/orders/updateOrders : POST");
		
		ordersService.updateOrders(orders);
		
		model.addAttribute("orders", orders);
		
		return "orders/getOrdersList";
	}
	
	@PostMapping(value = "deleteOrders")
	public String deleteOrders(@RequestParam("orderNo") int orderNo, Model model) throws Exception {
		
		ordersService.deleteOrders(orderNo);
		
		System.out.println("/orders/deleteOrders : POST");
		
		model.addAttribute("orderNo", orderNo);
		
		return "orders/getOrdersList";
	}
	
	@GetMapping(value = "getOrdersList")
	public String getOrdersList(@RequestParam("userId") String userId, Model model) throws Exception {
		
		System.out.println("/orders/getOrdersList : GET");
		
		List<Orders> getOrdersList = ordersService.getOrdersList(userId);
		
		model.addAttribute("getOrdersList", getOrdersList);
		
		return "orders/getOrdersList";
	}
	
	@GetMapping(value = "getOrders")
	public String getOrders(@ModelAttribute("orders") Orders orders, Model model) throws Exception {
		
		System.out.println("/orders/getOrders : GET");
		
//		List<Orders> get
		
		return "orders/getOrders";
	}
	
	
	@PostMapping(value = "addOrdersCart")
	public String addOrdersCart(@ModelAttribute("cart")	Cart cart,HttpSession session, Model model) throws Exception {
		User user = (User) session.getAttribute("user");
		
		ordersService.addOrdersCart(cart);
//		model.addAttribute(null)
		
		return "orders/addOrdersCart";
	}
	
	
	@GetMapping(value = "getOrdersCartList")
	public String getOrdersCartList(@ModelAttribute("cart") Cart cart) throws Exception {
		
		List<Cart> getCartList = ordersService.getOrdersCartList(cart);
		
		return "orders/getOrdersCartList";
	}
	
	@PostMapping(value = "updateOrdersCart") //Getupdate는 rest
	public String updateOrdersCart(@ModelAttribute("cart") Cart cart) throws Exception {
		
		ordersService.updateOrdersCart(cart);
		
		System.out.println("/orders/updateOrdersCart : POST");
		
		return "orders/getOrdersCartList";
	}
	
	@PostMapping(value = "deleteOrdersCart")
	public String deleteOrdersCart(@RequestParam("cartNo") int cartNo) throws Exception {
		
		ordersService.deleteOrdersCart(cartNo);
		
		System.out.println("/orders/deleteOrdersCart : POST");
		
		return "orders/getOrdersCartList";
	}
	
	@PostMapping(value = "deleteOrderCartAfter")
	public String deleteOrderCartAfter(@ModelAttribute("cart") Cart cart) throws Exception {
		
		ordersService.deleteOrdersCartAfter(cart);
		
		System.out.println("/orders/deleteOrderCartAfter : POST");
		
		return "orders/deleteOrderCartAfter";
	}
	
	
}
