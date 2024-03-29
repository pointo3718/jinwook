package com.jinwook.home.web.orders;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jinwook.home.service.board.BoardService;
import com.jinwook.home.service.domain.Attach;
import com.jinwook.home.service.domain.Cart;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Jpay;
import com.jinwook.home.service.domain.Notice;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Recipe;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.orders.OrdersService;
import com.jinwook.home.service.store.StoreService;

@Controller
@RequestMapping("/orders/*")
public class OrdersController {

   @Autowired
   @Qualifier("ordersServiceImpl")
   private OrdersService ordersService;
   
   @Autowired
   @Qualifier("storeServiceImpl")
   private StoreService storeService;
   @Autowired
   
   @Qualifier("boardServiceImpl")
   private BoardService boardService;
   
   public OrdersController() {
      System.out.println(this.getClass());
   }
   
   @GetMapping(value = "addOrders")
   public String addOrders(@ModelAttribute("cart") Cart cart,HttpSession session,Model model,@RequestParam(value="orderPrice", required = false)int orderPrice) throws Exception {
      System.out.println("/orders/addOrders: GET");
      Orders orders = new Orders();
      orders.setOrderPrice(orderPrice);
      String userid = ((User) session.getAttribute("user")).getUserId();
      cart.setUserId(userid);
      System.out.println(userid);
      cart.setOrders(orders);
      List<Cart> getCartList = ordersService.getOrdersCartList(cart);
      List<Coupon> couponList = storeService.getCouponList(userid);
      model.addAttribute("couponList", couponList);
      System.out.println(couponList);
      System.out.println(getCartList);
      model.addAttribute("getCartList", getCartList);
      return "orders/addOrders";
   }
   
   @PostMapping(value = "addOrders") 
   public String addOrders(@ModelAttribute("orders") Orders orders,@ModelAttribute("cart") Cart cart
         ,@RequestParam(value="plusTime", required = false)int plusTime,HttpSession session,@RequestParam(value="couponNo",required = false)int couponNo) throws Exception {
      
      System.out.println("/orders/addOrders: POST");
      String userid = ((User) session.getAttribute("user")).getUserId();
      String role = ((User) session.getAttribute("user")).getRole();
      User user = new User();
      Coupon coupon = new Coupon();
      coupon.setUserId(userid);
      coupon.setCouponNo(couponNo);
      System.out.println(coupon);
      ordersService.updateOrdersCoupon(coupon);
      user.setUserId(userid);
      user.setRole(role);
      cart.setCartStatus(true);
      orders.setCart(cart);
      orders.setUser(user);
      orders.setPickupTime(Timestamp.valueOf(LocalDateTime.now(ZoneId.of("Asia/Seoul")).plusMinutes(plusTime).plusHours(9)));
      ordersService.deleteOrdersCartAfter(cart);
      System.out.println(cart);
      System.out.println(user);
      System.out.println(orders);
      ordersService.addOrders(orders);
    
      return "redirect:/orders/getOrdersList";
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
   public String getOrdersList(@ModelAttribute("orders") Orders orders,HttpSession session,Model model) throws Exception {
     User user = ((User) session.getAttribute("user"));
     
//     User user = new User();
//      user.setUserId(userid);
      orders.setUser(user);

      List<Coupon> couponList = storeService.getCouponList(user.getUserId());
      model.addAttribute("couponList", couponList);
      
      
      System.out.println("/orders/getOrdersList : GET");
      List<Orders> getOrdersList = ordersService.getOrdersList(orders);
      System.out.println(orders);
      
      model.addAttribute("getOrdersList", getOrdersList);
      
      return "user/myPage";
   }
   
   @GetMapping(value = "getOrdersListCeo")//리뷰날짜가 null이아닐경우 후기버튼 지움
   public String getOrdersListCeo(@ModelAttribute("orders") Orders orders,HttpSession session,Model model) throws Exception {
     User user = ((User) session.getAttribute("user"));
     
//     User user = new User();
//      user.setUserId(userid);
      orders.setUser(user);

      List<Coupon> couponList = storeService.getCouponList(user.getUserId());
      model.addAttribute("couponList", couponList);
      
      List<Store> storeInfo = storeService.getStoreInfo(user.getUserId());
      model.addAttribute("storeInfo", storeInfo);
      
      System.out.println("/orders/getOrdersList : GET");
      List<Orders> getOrdersList = ordersService.getOrdersList(orders);
      System.out.println(orders);
      
      model.addAttribute("getOrdersList", getOrdersList);
      System.out.println(getOrdersList);
      return "orders/getOrdersListCeo";
   }
   
   @GetMapping(value = "getOrders")
   public String getOrders(@RequestParam("orderNo") int orderNo, Model model,@ModelAttribute("cart")Cart cart) throws Exception {
      
      System.out.println("/orders/getOrders : GET");
      
      List<Orders> getOrders = ordersService.getOrders(orderNo);
      System.out.println(getOrders);
      
      model.addAttribute("getOrders", getOrders);
      
      return "orders/getOrders";
   }
   
   @GetMapping(value = "getOrdersCeo")
   public String getOrdersCeo(@RequestParam("orderNo") int orderNo, Model model,@ModelAttribute("cart")Cart cart,HttpSession session) throws Exception {
      
      System.out.println("/orders/getOrders : GET");
      
      List<Orders> getOrders = ordersService.getOrders(orderNo);
      System.out.println(getOrders);
      
      String userid = ((User) session.getAttribute("user")).getUserId();
      List<Store> storeInfo = storeService.getStoreInfo(userid);
      model.addAttribute("storeInfo", storeInfo);
      
      model.addAttribute("getOrders", getOrders);
      
      return "orders/getOrdersCeo";
   }
   
   
   @GetMapping(value = "getOrdersCartList")
   public String getOrdersCartList(@ModelAttribute("cart") Cart cart, Model model,HttpSession session) throws Exception {
      
      String userid = ((User) session.getAttribute("user")).getUserId();
      cart.setUserId(userid);
      System.out.println("cart"+cart);
      List<Cart> getCartList = ordersService.getOrdersCartList(cart);
      System.out.println("getCartList악"+getCartList);
      for (Cart cart2 : getCartList) {
			Attach attach = new Attach();
			attach = ordersService.selectFileList(cart2.getProduct().getProdNo());
			cart2.setAttach(attach);
		}
     
      model.addAttribute("getCartList", getCartList);
      System.out.println("getCartList억"+getCartList);
      return "orders/getOrdersCartList";
   }
   
   @GetMapping(value = "addOrdersJpayPassword")/// 모달창
   public String addOrdersJpayPassword() throws Exception {
      
      System.out.println("/orders/addOrdersJpayPassword : GET");
      
      return  "orders/addOrdersJpayPassword";
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
   
   @GetMapping(value = "addOrdersJpayCharge")
   public String addOrdersJpayCharge(@ModelAttribute("jpay") Jpay jpay,Model model,HttpSession session) throws Exception {
      
      System.out.println("/orders/addOrdersJpayCharge : POST");
      System.out.println("여기에요");
      String userid = ((User) session.getAttribute("user")).getUserId();
      
      jpay.setUserId(userid);
      
      ordersService.addOrdersJpayCharge(jpay);
      
      model.addAttribute("jpay", jpay);
      
      return  "orders/addOrdersJpayCharge";
   }
   
   @GetMapping(value = "getOrdersJpayList")
   public String getOrdersJpayList(@ModelAttribute("jpay") Jpay jpay,HttpSession session,Model model) throws Exception {
      
      System.out.println("/orders/getOrdersJpayList : GET");
      
      String userid = ((User) session.getAttribute("user")).getUserId();
      jpay.setUserId(userid);
//      ordersService.getOrdersJpayList(jpay);
      
      List<Jpay> getJpayList = ordersService.getOrdersJpayList(jpay);
      model.addAttribute("getJpayList", getJpayList);
      return  "orders/getOrdersJpayList";
   }
   
   @GetMapping(value="getOrdersJpayChargeList")
   public String getOrdersJpayChargeList() throws Exception{
	   
	   System.out.println("/orders/getOrdersJpayChargeList : GET");
	   
	   return "orders/getOrdersJpayChargeList";
   }
   
//   @GetMapping(value ="getOrdersNoticeList")
//   public String getOrdersNoticeList(@ModelAttribute("notice") Notice notice,HttpSession session,Model model) throws Exception {
//      
//      System.out.println("/orders/getOrdersNoticeList : GET");
//      
//      String userid = ((User) session.getAttribute("user")).getUserId();
//      notice.setReceiveId(userid);
////      ordersService.getOrdersNoticeList(notice);
//      
//      List<Notice> noticeList = ordersService.getOrdersNoticeList(notice);
//      model.addAttribute("noticeList", noticeList);
//      
//      return "orders/getOrdersNoticeList";
//   }
   
   
//   @GetMapping(value="addOrdersJpayPasswordCk")
//   public String addOrdersJpayPasswordCk() throws Exception {
//	   
//	   System.out.println("/orders/addOrdersJpayPasswordCk : GET");
//	   
//       return "orders/addOrdersJpayPasswordCk";
//   }

}