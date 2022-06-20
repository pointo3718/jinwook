//package com.jinwook.home;
//
//import java.time.LocalDate;
//import java.time.LocalDateTime;
//import java.time.ZoneId;
//import java.util.List;
//
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.util.CollectionUtils;
//
//import com.jinwook.home.mapper.OrdersMapper;
//import com.jinwook.home.service.domain.Cart;
//import com.jinwook.home.service.domain.Coupon;
//import com.jinwook.home.service.domain.Jpay;
//import com.jinwook.home.service.domain.Notice;
//import com.jinwook.home.service.domain.Orders;
//import com.jinwook.home.service.domain.Product;
//import com.jinwook.home.service.domain.Store;
//import com.jinwook.home.service.domain.User;
//
//@SpringBootTest
//public class OrdersMapperTest {
//   
//   @Autowired
//   private OrdersMapper ordersMapper;
//   
//   @Test
//   public void testOfaddOrders() {
//      Product product = new Product();
//      product.setProdNo(10000);
//      product.setPrice(500);
//      
//      User user = new User();
//      user.setUserId("test01");
//      user.setGrade("일반회원");
//      
//      Coupon coupon = new Coupon();
//      coupon.setCouponNo(10000);
//      coupon.setCouponType("0");
//      coupon.setCouponDc(30);
//      
//      Store store = new Store();
//      store.setStoreNo(10000);
//      
//      
//      Orders orders = new Orders();
//      orders.setPlusTime(90);
//      orders.setUser(user);
//      orders.setStore(store);
//      orders.setBuyerName("강진욱");
//      orders.setBuyerPhone("010-1234-9876");
////      ZoneId zoneId = ZoneId.of("Asia/Seoul");
////      orders.setPickupTime(LocalDateTime.now().plusMinutes(orders.getPlusTime()));
////      orders.setPickupTime(LocalDateTime.now().plusMinutes(orders.getPlusTime()));
//      orders.setOrderReq(null);
//      orders.setProdCount(3);
//      orders.setOrderStatus("0");
//      orders.setProduct(product);
//      orders.setOrderPrice(10000);
//      orders.setFinalPrice(5000);
//      orders.setCoupon(coupon);
//         
//      int result = ordersMapper.addOrders(orders);
//      System.out.println("결과는"+result+"입니다.");
//   }
//   
//   //@Test
//   public void testOfupdateOrders() {
//      Orders orders = new Orders();
//      orders.setOrderNo(10047);
//      orders.setOrderStatus("5");
//      int result = ordersMapper.updateOrders(orders);
//      System.out.println("결과는"+result+"입니다.");
//   }
//   
//   //@Test
//   public void testOfdeleteOrders() {   
////      Orders orders = new Orders();
////      orders.setOrderNo(10005);
//      int result = ordersMapper.deleteOrders(10005);
//       System.out.println("결과는" + result + "입니다.");
//        
//   }
//   
//   @Test
//   public void testSelectListOrders() {
//     Orders orders = new Orders();
//      int ordersTotalCount = ordersMapper.getOrdersTotalCount(orders);
//      if(ordersTotalCount > 0) {
//         List<Orders> ordersList = ordersMapper.getOrdersList(orders);
//         System.out.println(ordersList.get(1)); 
//         System.out.println(ordersTotalCount);
//         if(CollectionUtils.isEmpty(ordersList) == false) {
//            System.out.println("==2");
//            for(Orders orders1 : ordersList) {
//               
//               System.out.println("=========================");
//               System.out.println(orders1.getUser().getUserId());
//               System.out.println(orders1.getOrderNo());
//               System.out.println(orders1.getOrderStatus());
//               System.out.println(orders1.getPickupTime());
//               System.out.println(orders1.getOrderDate());
//               System.out.println(orders1.getOrderPrice());
//               System.out.println(orders1.getProduct().getProdName());
//               System.out.println(orders1.getProduct().getProdImg());
//               System.out.println("=========================");
//            }
//         }
//      }
//   }
//   
//   //@Test
//   public void testgetOrders() {
//     Orders orders = new Orders();
//      int ordersTotalCount = ordersMapper.getOrdersTotalCount(orders);
//      if(ordersTotalCount > 0) {
//         List<Orders> ordersGet = ordersMapper.getOrders(10007);
//         if(CollectionUtils.isEmpty(ordersGet) == false) {
//            System.out.println("==2");
//            for(Orders orders1 : ordersGet) {
//            
//               System.out.println("=========================");
//               System.out.println(orders1.getUser().getUserId());
//               System.out.println(orders1.getProduct().getProdName());
//               System.out.println(orders1.getProdCount());
//               System.out.println(orders1.getProduct().getPrice());
//               System.out.println(orders1.getProduct().getProdInfo());
//               System.out.println(orders1.getProduct().getProdImg());
//               System.out.println(orders1.getStore().getStoreName());
//               System.out.println(orders1.getOrderDate());
//               System.out.println(orders1.getOrderPrice());
//               System.out.println(orders1.getBuyerName());
//               System.out.println(orders1.getBuyerPhone());
//               System.out.println(orders1.getOrderReq());
//               System.out.println(orders1.getPickupTime());
//               System.out.println(orders1.getOrderStatus());
//               System.out.println("=========================");
//            }
//         }
//      }
//   }
//   
//   //@Test
//   public void testaddOrdersCart() {
//      
//      Product product = new Product();
//      product.setProdNo(10003);
//      
//      Cart cart = new Cart();
//      cart.setUserId("test01");
//      cart.setProduct(product);
////      cart.setOrderNo(null); 
//      cart.setProdCount(2);
//      cart.setStoreName("진욱이네");
//      cart.setCartStatus(false);
//      
//      int result = ordersMapper.addOrdersCart(cart);
//      System.out.println("결과는"+result+"입니다.");
//   }
//   
//   //@Test
//   public void testupdateOrdersCart() {
//      Cart cart= new Cart();
//      cart.setUserId("test01");
//      cart.setCartNo(10005);
//      cart.setProdCount(4);
//      int result = ordersMapper.updateOrdersCart(cart);
//      System.out.println("결과는"+result+"입니다.");
//   }
//   
//   //@Test
//   public void testdeleteOrderCartAfter() {
//      Orders orders = new Orders();
//      orders.setOrderNo(10003);
//      
//      Cart cart = new Cart();
//      cart.setUserId("test01");
//      cart.setCartNo(10006);
//      cart.setCartStatus(true);
//      cart.setOrders(orders);
//      int result = ordersMapper.deleteOrdersCartAfter(cart);
//      System.out.println("결과는"+result+"입니다.");
//   }
//   
//   //@Test
//      public void testdeleteOrdersCart() {
////         Cart cart = new Cart();
////         cart.setCartNo(10011);
//         int result = ordersMapper.deleteOrdersCart(10011);
//          System.out.println("결과는" + result + "입니다.");
//      }
//      
//   //@Test
//      public void testdeleteOrdersCartAll() {
////         Cart cart = new Cart();
////         cart.setCartStatus(false);
//         int result = ordersMapper.deleteOrdersCartAll(false);
//          System.out.println("결과는" + result + "입니다.");
//      }
//      
//   //@Test
//   public void testgetOrdersCartList() {
//      
//   int getCartTotalCount = ordersMapper.getCartTotalCount();
//   if(getCartTotalCount > 0) {
//      Cart carts = new Cart();
//      carts.setUserId("test01");
//      carts.setCartStatus(false);
//      carts.setStoreName("진욱이네");
//      List<Cart> cartList = ordersMapper.getOrdersCartList(carts);
//      if(CollectionUtils.isEmpty(cartList) == false) {
//         for(Cart cart : cartList) {
//
//            System.out.println("=========================");
//            System.out.println(cart.getStoreName());
//            System.out.println(cart.getProduct().getProdImg());
//            System.out.println(cart.getProduct().getProdName());
//            System.out.println(cart.getProduct().getProdInfo());
//            System.out.println(cart.getProdCount());
//            System.out.println(cart.getProduct().getPrice());
//            System.out.println(cart.getOrders().getOrderPrice());
//            System.out.println("=========================");
//            }
//         }
//      }
//   }
//   
//   //@Test
//   public void testaddJpayPassword() {
//      User user = new User();
//      user.setUserId("test01");
//      user.setJpPassword("333333");
//      
//      int result = ordersMapper.addOrdersJpayPassword(user);
//      System.out.println("결과는"+result+"입니다.");
//   }
//   
//   //@Test
//   public void testupdateOrdersJpayPassword() {
//      User user = new User();
//      user.setUserId("test01");
//      user.setJpPassword("012345");
//      
//      int result = ordersMapper.updateOrdersJpayPassword(user);
//      System.out.println("결과는"+result+"입니다.");
//   }
//   
//   //@Test
//   public void addOrdersjBCharge() {
//      Orders orders = new Orders();
//      orders.setOrderNo(10047);
//      
//      Jpay jpay = new Jpay();
//      jpay.setJpStatus(1);
//      jpay.setUserId("test01");
//      jpay.setJpNo(10000);
//      jpay.setOrders(orders);
//      
//      int result = ordersMapper.addOrdersjBCharge(jpay);
//         System.out.println("결과는 " + result + "입니다.");
//
//   }
//
//   //@Test
//   public void testaddOrdersJpayCharge() {
//      Orders orders = new Orders();
//      orders.setOrderNo(0);
//      
//      Jpay jpay = new Jpay();
//      jpay.setUserId("test01");
//      jpay.setOrders(orders);
//      jpay.setJpStatus(1);
//      jpay.setFinalPrice(0);
//      jpay.setChargePay(1000);
//      
//      int result = ordersMapper.addOrdersJpayCharge(jpay);
//      System.out.println("결과는"+result+"입니다.");
//   }
//   
//   //@Test
//   public void testgetOrdersJpaylist() {
//      Jpay jpay =new Jpay();
//      int jpayTotalCount = ordersMapper.getOrdersJpayListTotalCount(jpay);
//      System.out.println(jpayTotalCount);
//      if(jpayTotalCount > 0) {
//         List<Jpay> jpayList = ordersMapper.getOrdersJpayList(jpay);
//         System.out.println(jpayList.get(1)); 
//         System.out.println(jpayTotalCount);
//         if(CollectionUtils.isEmpty(jpayList) == false) {
//            for(Jpay jpay1 : jpayList) {
//               System.out.println("=========================");
//               System.out.println(jpay1.getJpNo());
//               System.out.println(jpay1.getJpDate());
//               System.out.println(jpay1.getJpStatus());
//               System.out.println(jpay1.getChargePay());
//               System.out.println(jpay1.getFinalPrice());
//               System.out.println(jpay1.getOrders().getStore().getStoreName());
//               System.out.println("=========================");
//            }
//            
//         }
//      }
//   }
//   
//   //@Test
//   public void testaddOrdersNotice() {
//   Notice notice = new Notice();
//   notice.setSendId("test01");
//   notice.setReceiveId("test14");
//   notice.setOrderNo(10000);
//   notice.setNotiType('0');
//   notice.setNotiContent("고객님이 주문하셨습니다.");
//   notice.setStoreName("몽자네");
//   notice.setBuyerName("부들이");
//   int result = ordersMapper.addOrdersNotice(notice);
//   System.out.println("결과는"+result+"입니다.");
//   }
//   
//   //@Test
//   public void testdeleteOrdersNotice() {
////      Notice notice = new Notice();
////      notice.setNotiNo(10002);
//      int result = ordersMapper.deleteOrdersNotice(10002);
//       System.out.println("결과는" + result + "입니다.");
//   }
//   
//   //@Test
//   public void testgetOrdersNoticelist() {
//      Notice notice = new Notice();
//      int getOrdersNoticelistTotalCount = ordersMapper.getOrdersNoticeListTotalCount(notice);
//      if(getOrdersNoticelistTotalCount > 0) {
//         List<Notice> noticeList = ordersMapper.getOrdersNoticeList(notice);
//         System.out.println(noticeList.get(1)); 
//         System.out.println(getOrdersNoticelistTotalCount);
//         if(CollectionUtils.isEmpty(noticeList) == false) {
//            System.out.println("==");
//            for(Notice notice1 : noticeList) {
//               System.out.println("=========================");
//               System.out.println(notice1.getNotiNo());
//               System.out.println(notice1.getSendId());
//               System.out.println(notice1.getReceiveId());
//               System.out.println(notice1.getOrderNo());
//               System.out.println(notice1.getNotiType());
//               System.out.println(notice1.getNotiContent());
//               System.out.println(notice1.getNotiDate());
//               System.out.println(notice1.getBuyerName());
//               System.out.println("=========================");
//            }
//         }
//      }
//   }
//   
//   //Test
//   public void testupdateOrdersCeoPrice() {
//      Orders orders = new Orders();
//      orders.setOrderNo(10047);
//      orders.setOrderStatus("5");
//      
//      Jpay jpay = new Jpay();
//      jpay.setJpStatus(1);
//      jpay.setUserId("test01");
//      jpay.setJpNo(10000);
//      jpay.setOrders(orders);
//      
//      int result = ordersMapper.updateOrdersCeoJb(jpay);
//         System.out.println("결과는 " + result + "입니다.");
//   }
//
//   //@Test
//   public void testupdateOrdersCeoEarn() {
//      Orders orders = new Orders();
//      orders.setOrderNo(10047);
//      orders.setOrderStatus("5");
//      
//      Store store = new Store();
//      store.setTotalEarn(0);
//      store.setUserId("test01");
//      store.setOrders(orders);
//      
//      int result = ordersMapper.updateOrdersCeoEarn(store);
//       System.out.println("결과는 " + result + "입니다.");   
//   }
//   
//   
//}