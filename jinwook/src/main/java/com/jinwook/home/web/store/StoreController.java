package com.jinwook.home.web.store;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jinwook.home.service.domain.Complain;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Orders;
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

   public StoreController() {
      System.out.println(this.getClass());
   }

//   @GetMapping(value = "confirmPassword")
//   public String updateStore() {
//
//      return "store/confirmPassword";
//   }

   @GetMapping(value = "updateStore")
   public String updateStore(@RequestParam("storeNo") int storeNo, Model model, HttpSession session) {

      Store store1 = new Store();

      String userid = ((User) session.getAttribute("user")).getUserId();

      store1.setUserId(userid);

      if ("false".equals(store1.getStoreStatus())) {
         // TODO => 등록된 상점이 없다는 메세지 전달 후 메인페이지로 이동
         return "redirect:/../index";
      }

      List<Store> storeInfo = storeService.getStoreInfo(userid);

      model.addAttribute("storeInfo", storeInfo);

      List<Store> store = storeService.getStore(storeNo);

      model.addAttribute("store", store);
      
      

      return "store/updateStore";
   }

   @GetMapping(value = "addStoreProduct")
   public String addStoreProduct(@RequestParam("storeNo") int storeNo, Model model, HttpSession session) {

      Store store1 = new Store();

      String userid = ((User) session.getAttribute("user")).getUserId();

      store1.setUserId(userid);

      if ("false".equals(store1.getStoreStatus())) {
         // TODO => 등록된 상점이 없다는 메세지 전달 후 메인페이지로 이동
         return "redirect:/../index";
      }

      List<Store> storeInfo = storeService.getStoreInfo(userid);

      model.addAttribute("storeInfo", storeInfo);

      List<Store> store = storeService.getStore(storeNo);

      model.addAttribute("store", store);
      

      return "store/addStoreProduct";
   }

   @PostMapping(value = "updateStore")
   public String updateStore(@RequestParam("storeNo") int storeNo, Store Store, Model model) {

      Store store = new Store();
      store.setStoreNo(storeNo);

      storeService.updateStore(Store);
      model.addAttribute("Store", Store);
      
      

      return "store/updateStore";
   }
   
   
   


//   @PostMapping(value = "addStoreProduct")
//   public String addStoreProduct(@ModelAttribute("product") Product product) {
//
//      product.setSoldout(true);
//      storeService.addStoreProduct(product);
//
//      return "store/addStoreProduct";
//
//   }

//   @PostMapping(value = "updateStoreProduct")
//   public String updateStoreProduct(@RequestParam("prodNo") int prodNo , Product product, Model model) {
//      
//      storeService.updateStoreProduct(product);
//      
//      model.addAttribute("product", product);
//      
//      return "store/addStoreProduct";
//   }

//   @PostMapping(value = "deleteStoreProduct")
//   public String deleteStoreProduct(@RequestParam("prodNo") int prodNo, Model model) {
//      
//      storeService.deleteStoreProduct(prodNo);
//      
//      
//      
//      return "store/addStoreProduct";
//   }

   @PostMapping(value = "isSoldout")
   public String isSoldout(@RequestParam("prodNo") int prodNo, Product product, Model model) {

      storeService.isSoldout(product);

      model.addAttribute("product", product);

      return "common/myPageTop";
   }

   @PostMapping(value = "isOpen")
   public String isOpen(@RequestParam("storeNo") int storeNo, Store store, Model model) {

      storeService.isOpen(store);

      model.addAttribute("store", store);

      return "common/myPageTop";
   }

   @PostMapping(value = "addOrdersCoupon")
   public String addOrdersCoupon(@RequestParam("couponNo") int couponNo, Model model) {

      storeService.addOrdersCoupon(couponNo);

      model.addAttribute("couponNo", couponNo);

      return "orders/addOrders";
   }

   @GetMapping(value = "getStore")
   public String getStore(@RequestParam("storeNo") int storeNo, Model model) {

      List<Store> getStore = storeService.getStore(storeNo);
      model.addAttribute("getStore", getStore);


      return "store/getStore";
   }

   @GetMapping(value = "getStoreWallet")
   public String getStoreWallet(@RequestParam("storeNo") int storeNo, @ModelAttribute("store") Store store, Model model, HttpSession session) {

      String userid = ((User) session.getAttribute("user")).getUserId();

      store.setUserId(userid);

      List<Store> getStoreRefund = storeService.getStoreRefund(storeNo);
      model.addAttribute("getStoreRefund", getStoreRefund);

      List<Store> getStoreWallet = storeService.getStoreWallet(store);
      model.addAttribute("getStoreWallet", getStoreWallet);

      List<Store> storeInfo = storeService.getStoreInfo(userid);
      model.addAttribute("storeInfo", storeInfo);
      
      


      return "store/getStoreWallet";
   }

//   @GetMapping(value = "getStoreRefund")
//   public String getStoreRefund(@RequestParam("storeNo") int storeNo, Model model) {
//      
//      List<Store> getStoreRefund = storeService.getStoreRefund(storeNo);
//      model.addAttribute("getStoreRefund", getStoreRefund);
//
//      return "store/getStoreRefund";
//   }

   @GetMapping(value = "getCouponList")
   public String getCouponList(@RequestParam("userId") String userId, Model model, HttpSession session) {

      Store store = new Store();

      String userid = ((User) session.getAttribute("user")).getUserId();

      store.setUserId(userid);

      List<Coupon> couponList = storeService.getCouponList(userId);
      model.addAttribute("couponList", couponList);
      


      return "store/getCouponList";
   }
   
   @GetMapping(value = "getCouponCount1")
   public String getCouponCount(@RequestParam("userId") String userId, Model model, HttpSession session) {

      Store store = new Store();

      String userid = ((User) session.getAttribute("user")).getUserId();

      store.setUserId(userid);

      int getCouponCount = storeService.getCouponCount(userId);
      model.addAttribute("getCouponCount", getCouponCount);
      


      return "store/getCouponCount";
   }

}