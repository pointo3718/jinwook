<<<<<<< HEAD
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
import com.jinwook.home.service.domain.Jpay;
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
	public String getOrders(@RequestParam("orderNo") int orderNo, Model model) throws Exception {
		
		System.out.println("/orders/getOrders : GET");
		
		List<Orders> getOrders = ordersService.getOrders(orderNo);
		
		model.addAttribute("getOrders", getOrders);
		
		return "orders/getOrders";
	}
	
	
	@PostMapping(value = "addOrdersCart")
	public String addOrdersCart(@ModelAttribute("cart")	Cart cart,HttpSession session, Model model) throws Exception {
		User user = (User) session.getAttribute("user");
		
		ordersService.addOrdersCart(cart);
		
		model.addAttribute("cart",cart);
		model.addAttribute("user",user);
		
		return "orders/addOrdersCart";
	}
	
	
	@GetMapping(value = "getOrdersCartList")
	public String getOrdersCartList(@ModelAttribute("cart") Cart cart, Model model) throws Exception {
		
		List<Cart> getCartList = ordersService.getOrdersCartList(cart);
		
		model.addAttribute("getCartList", getCartList);
		
		return "orders/getOrdersCartList";
	}
	
	@PostMapping(value = "updateOrdersCart") // rest
	public String updateOrdersCart(@ModelAttribute("cart") Cart cart, Model model) throws Exception {
		
		System.out.println("/orders/updateOrdersCart : POST");
		
		ordersService.updateOrdersCart(cart);

		model.addAttribute("cart", cart);
		
		return "orders/getOrdersCartList";
	}
	
	@PostMapping(value = "deleteOrdersCart") //rest
	public String deleteOrdersCart(@RequestParam("cartNo") int cartNo) throws Exception {
		
		System.out.println("/orders/deleteOrdersCart : POST");
		
		ordersService.deleteOrdersCart(cartNo);
		
		return "orders/getOrdersCartList";
	}
	
	@PostMapping(value = "deleteOrderCartAfter")// result 1or0반환
	public String deleteOrderCartAfter(@ModelAttribute("cart") Cart cart, Model model) throws Exception {
		
		System.out.println("/orders/deleteOrderCartAfter : POST");
		
		ordersService.deleteOrdersCartAfter(cart);

		model.addAttribute("cart", cart);
		
		return "orders/deleteOrderCartAfter";
	}
	
	@PostMapping(value = "deleteOrdersCartAll")//rest
	public String deleteOrdersCartAll(@RequestParam("cartStatus") boolean cartStatus)  throws Exception {
		
		System.out.println("/orders/deleteOrdersCartAll : POST");
		
		ordersService.deleteOrdersCartAll(false);
		
		return "orders/getOrdersCartList";
	}
	
	
//	@GetMapping()
=======
//package com.jinwook.home.web.orders;
//
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.jinwook.home.service.domain.Cart;
//import com.jinwook.home.service.domain.Jpay;
//import com.jinwook.home.service.domain.Notice;
//import com.jinwook.home.service.domain.Orders;
//import com.jinwook.home.service.domain.Product;
//import com.jinwook.home.service.domain.Store;
//import com.jinwook.home.service.domain.User;
//import com.jinwook.home.service.orders.OrdersService;
//
//@Controller
//@RequestMapping("/orders/*")
//public class OrdersController {
//
//	@Autowired
//	@Qualifier("ordersServiceImpl")
//	
//	private OrdersService ordersService;
//	
//	public OrdersController() {
//		System.out.println(this.getClass());
//	}
//	
//	@GetMapping(value = "addOrders")
//	public String addOrders(@ModelAttribute("orders") Orders orders,HttpSession session,@ModelAttribute("product") Product product) throws Exception {
//		System.out.println("/orders/addOrders: GET");
//		
//		User user = (User) session.getAttribute("user");
////		Product product = new Product();
////		product.set
//		
//		Cart cart = new Cart();
//		cart.setProduct(product);
//		
//		orders.setUser(user);
//		orders.setCart(cart);
//		
//		return "orders/addOrders";
//	}
//	
//	@PostMapping(value = "addOrders")
//	public String addOrders(@ModelAttribute("orders") Orders orders) throws Exception {
//		
//		System.out.println("/orders/addOrders: POST");
//		
//		return "orders/addOrdersView";
//	}
//	
//	
//	@PostMapping(value = "updateOrders")
//	public String updateOrders(@ModelAttribute("orders") Orders orders, Model model) throws Exception {
//		
//		System.out.println("/orders/updateOrders : POST");
//		
//		ordersService.updateOrders(orders);
//		
//		model.addAttribute("orders", orders);
//		
//		return "orders/getOrdersList";
//	}
//	
//	@PostMapping(value = "deleteOrders")
//	public String deleteOrders(@RequestParam("orderNo") int orderNo, Model model) throws Exception {
//		
//		ordersService.deleteOrders(orderNo);
//		
//		System.out.println("/orders/deleteOrders : POST");
//		
//		model.addAttribute("orderNo", orderNo);
//		
//		return "orders/getOrdersList";
//	}
//	
//	@GetMapping(value = "getOrdersList")
//	public String getOrdersList(@RequestParam("userId") String userId, Model model) throws Exception {
//		
//		System.out.println("/orders/getOrdersList : GET");
//		
//		List<Orders> getOrdersList = ordersService.getOrdersList(userId);
//		
//		model.addAttribute("getOrdersList", getOrdersList);
//		
//		return "orders/getOrdersList";
//	}
//	
//	@GetMapping(value = "getOrders")
//	public String getOrders(@RequestParam("orderNo") int orderNo, Model model) throws Exception {
//		
//		System.out.println("/orders/getOrders : GET");
//		
//		List<Orders> getOrders = ordersService.getOrders(orderNo);
//		
//		model.addAttribute("getOrders", getOrders);
//		
//		return "orders/getOrders";
//	}
//	
//	
//	@PostMapping(value = "addOrdersCart")
//	public String addOrdersCart(@ModelAttribute("cart")	Cart cart,HttpSession session, Model model) throws Exception {
//		User user = (User) session.getAttribute("user");
//		
//		ordersService.addOrdersCart(cart);
//		
//		model.addAttribute("cart",cart);
//		model.addAttribute("user",user);
//		
//		return "orders/addOrdersCart";
//	}
//	
//	
//	@GetMapping(value = "getOrdersCartList")
//	public String getOrdersCartList(@ModelAttribute("cart") Cart cart, Model model) throws Exception {
//		
//		List<Cart> getCartList = ordersService.getOrdersCartList(cart);
//		
//		model.addAttribute("getCartList", getCartList);
//		
//		return "orders/getOrdersCartList";
//	}
//	
//	@PostMapping(value = "updateOrdersCart") // rest
//	public String updateOrdersCart(@ModelAttribute("cart") Cart cart, Model model) throws Exception {
//		
//		System.out.println("/orders/updateOrdersCart : POST");
//		
//		ordersService.updateOrdersCart(cart);
//
//		model.addAttribute("cart", cart);
//		
//		return "orders/getOrdersCartList";
//	}
//	
//	@PostMapping(value = "deleteOrdersCart") //rest
//	public String deleteOrdersCart(@RequestParam("cartNo") int cartNo) throws Exception {
//		
//		System.out.println("/orders/deleteOrdersCart : POST");
//		
//		ordersService.deleteOrdersCart(cartNo);
//		
//		return "orders/getOrdersCartList";
//	}
//	
//	@PostMapping(value = "deleteOrderCartAfter")// result 1or0반환
//	public String deleteOrderCartAfter(@ModelAttribute("cart") Cart cart, Model model) throws Exception {
//		
//		System.out.println("/orders/deleteOrderCartAfter : POST");
//		
//		ordersService.deleteOrdersCartAfter(cart);
//
//		model.addAttribute("cart", cart);
//		
//		return "orders/deleteOrderCartAfter";
//	}
//	
//	@PostMapping(value = "deleteOrdersCartAll")//rest
//	public String deleteOrdersCartAll(@RequestParam("cartStatus") boolean cartStatus)  throws Exception {
//		
//		System.out.println("/orders/deleteOrdersCartAll : POST");
//		
//		ordersService.deleteOrdersCartAll(false);
//		
//		return "orders/getOrdersCartList";
//	}
//	
//	
////	@GetMapping()
////	public String addOrdersJpayPassword() throws Exception {
////		
////		return  "";
////	}
////	
//	@PostMapping()
>>>>>>> refs/heads/Song
//	public String addOrdersJpayPassword() throws Exception {
//		
//		return  "";
//	}
//	
//	@PostMapping()
//	public String updateOrdersJpayPassword() throws Exception {
//		
//		return  "";
//	}
//	
//	@PostMapping(value = "addOrdersJpayCharge")
//	public String addOrdersJpayCharge(@ModelAttribute("jpay") Jpay jpay,Model model) throws Exception {
//		
//		System.out.println("/orders/addOrdersJpayCharge : POST");
//		
//		ordersService.addOrdersJpayCharge(jpay);
//		
//		model.addAttribute("jpay", jpay);
//		
//		return  "orders/addOrdersJpayCharge";
//	}
//	
//	@PostMapping(value = "addOrdersjBCharge")// result 1or0반환
//	public String addOrdersjBCharge(@ModelAttribute("jpay") Jpay jpay,Model model) throws Exception {
//		
//		System.out.println("/orders/addOrdersjBCharge : POST");
//		
//		ordersService.addOrdersjBCharge(jpay);
//		
//		model.addAttribute("jpay", jpay);
//		
//		return  "orders/addOrdersjBCharge";
//	}
//	
//	@GetMapping(value = "getOrdersJpaylist")
//	public String getOrdersJpaylist(@RequestParam("userId") String userId,Model model) throws Exception {
//		
//		System.out.println("/orders/getOrdersJpaylist : GET");
//		
//		ordersService.getOrdersJpaylist(userId);
//		
//		model.addAttribute("userId", userId);
//		
//		return  "orders/getOrdersJpaylist";
//	}
//	
//	@PostMapping()
//	public String addOrdersNotice() throws Exception {
//		
//		return "";
//	}
//	
//	@PostMapping()
//	public String deleteOrdersNotice() throws Exception {
//		
//
//		return "";
//	}
//	
//	@GetMapping()
//	public String getOrdersNoticelist() throws Exception {
//		
//		return "";
//	}
//	
//	@PostMapping()
//	public String updateOrdersCeoJb() throws Exception {
//		
//		return "";
//	}
//	
//	@PostMapping()
//	public String updateOrdersCeoEarn() throws Exception {
//		
//		return "";
//	}
//	
//} 
