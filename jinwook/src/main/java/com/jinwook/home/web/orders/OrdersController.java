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
import com.jinwook.home.service.domain.Notice;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Store;
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
   public String addOrders(@ModelAttribute("cart") Cart cart,HttpSession session,Model model,@RequestParam(value="orderPrice", required = false)int orderPrice) throws Exception {
      Orders orders = new Orders();
      orders.setOrderPrice(orderPrice);
      String userid = ((User) session.getAttribute("user")).getUserId();
      cart.setUserId(userid);
      cart.setOrders(orders);
      System.out.println("/orders/addOrders: GET");
      List<Cart> getCartList = ordersService.getOrdersCartList(cart);
      
      model.addAttribute("getCartList", getCartList);
      System.out.println();
      return "orders/addOrders";
   }
   
   @PostMapping(value = "addOrders") 
   public String addOrders(@ModelAttribute("orders") Orders orders,@ModelAttribute("cart") Cart cart) throws Exception {
      
      System.out.println("/orders/addOrders: POST");
      
      orders.setCart(cart);
      
      ordersService.addOrders(orders);
//      Product product = new Product();
//      product.set
      
//      Cart cart = new Cart();
//      cart.setProduct(product);
//      
//      orders.setCart(cart);
      
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
   
   @GetMapping(value = "getOrdersList")//리뷰날짜가 null이아닐경우 후기버튼 지움
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
   public String addOrdersCart(@ModelAttribute("cart")   Cart cart,HttpSession session, Model model) throws Exception {
      User user = (User) session.getAttribute("user");
      
      ordersService.addOrdersCart(cart);
      
      model.addAttribute("cart",cart);
      model.addAttribute("user",user);
      
      return "orders/addOrdersCart";
   }
   
   
   @GetMapping(value = "getOrdersCartList")
   public String getOrdersCartList(@ModelAttribute("cart") Cart cart, Model model,HttpSession session) throws Exception {
      
      String userid = ((User) session.getAttribute("user")).getUserId();
      cart.setUserId(userid);
      //cart.setStoreName();
      List<Cart> getCartList = ordersService.getOrdersCartList(cart);
      model.addAttribute("getCartList", getCartList);
      
      System.out.println(getCartList);
      return "orders/getOrdersCartList";
   }
   
   @GetMapping(value = "addOrdersJpayPassword")/// 모달창
   public String addOrdersJpayPassword() throws Exception {
      
      System.out.println("/orders/addOrdersJpayPassword : GET");
      
      return  "orders/addOrdersJpayPassword";
   }
   
   @PostMapping(value = "addOrdersJpayPassword")///MyPage
   public String addOrdersJpayPassword(@ModelAttribute("user") User user) throws Exception {
      
      System.out.println("/orders/addOrdersJpayPassword : POST");
      
      ordersService.addOrdersJpayPassword(user);
      
      return  "myPage";
   }
   
   @GetMapping(value = "updateOrdersJpayPassword")
   public String updateOrdersJpayPassword() throws Exception {
      
      System.out.println("/orders/updateOrdersJpayPassword : GET");
      
      return  "orders/updateOrdersJpayPassword";
   }
   
   @PostMapping(value = "updateOrdersJpayPassword")///MyPage
   public String updateOrdersJpayPassword(@ModelAttribute("user")User user,Model model) throws Exception {
      
      System.out.println("/orders/updateOrdersJpayPassword : POST");
      ordersService.updateOrdersJpayPassword(user);
      
      model.addAttribute("user", user);
      
      return  "orders/addOrdersJpayPassword";
   }
   
   @PostMapping(value = "addOrdersJpayCharge")
   public String addOrdersJpayCharge(@ModelAttribute("jpay") Jpay jpay,Model model) throws Exception {
      
      System.out.println("/orders/addOrdersJpayCharge : POST");
      
      ordersService.addOrdersJpayCharge(jpay);
      
      model.addAttribute("jpay", jpay);
      
      return  "orders/addOrdersJpayCharge";
   }
   
   @GetMapping(value = "getOrdersJpaylist")
   public String getOrdersJpaylist(@RequestParam("userId") String userId,Model model) throws Exception {
      
      System.out.println("/orders/getOrdersJpaylist : GET");
      
      ordersService.getOrdersJpaylist(userId);
      
      model.addAttribute("userId", userId);
      
      return  "orders/getOrdersJpaylist";
   }
   
   @GetMapping(value ="getOrdersNoticelist")
   public String getOrdersNoticelist(@RequestParam("receiveId") String receiveId,Model model) throws Exception {
      
      System.out.println("/orders/getOrdersNoticelist : POST");
      
      ordersService.getOrdersNoticelist(receiveId);
      
      model.addAttribute("receiveId", receiveId);
      
      return "orders/getOrdersNoticelist";
   }
   
}