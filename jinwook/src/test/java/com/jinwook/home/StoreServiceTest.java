package com.jinwook.home;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.util.CollectionUtils;

import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.store.StoreService;

@SpringBootTest
class StoreServiceTest {

   @Autowired
   @Qualifier("storeServiceImpl")
   private StoreService storeService;

   @Test
   public void updateStoreTest() throws Exception {
      Store store = new Store();
      store.setStoreNo(10000);
      store.setStoreIntro("우리상점짱짱이다");
      store.setStorePhone("010-2222-3333");
      store.setStoreImage("진욱진욱.jpg");
//      store.setStartTime(LocalDateTime.now());
//      store.setEndTime(LocalDateTime.now());
      store.setHoliday("충청도");
      store.setBank("신한은행");
      store.setAccNo("110-111-1111");

      storeService.updateStore(store);

   }

//   @Test
//   public void addStoreProductTest() throws Exception {
//
//      Product product = new Product();
//      product.setStoreNo(10012);
//      product.setProdName("사과");
//      product.setPrice(1000);
//      product.setProdInfo("150g에 1000원");
//      product.setProdImg("사과.jpg");
//      product.setProdOrign("강원도");
//
//      storeService.addStoreProduct(product);
//
//   }

   @Test
   public void updateStoreProductTest() throws Exception {

      Product product = new Product();
      product.setProdNo(10000);
      product.setPrice(100);
      product.setProdInfo("상품정보수정");
      product.setProdImg("홍길동.jpg");
      product.setProdOrign("전라도");

      storeService.updateStoreProduct(product);

   }

   @Test
   public void deleteStoreProductTest() throws Exception {

      storeService.deleteStoreProduct(10037);

   }

   @Test
   public void isSoldoutTest() throws Exception {

      Product product = new Product();
      product.setProdNo(10000);
      product.setSoldout(false);

      storeService.isSoldout(product);

   }

   @Test
   public void isOpenTest() throws Exception {

      Store store = new Store();
      store.setStoreNo(10000);
      store.setOpen(false);

      storeService.isOpen(store);

   }

   @Test
   public void addOrdersCouponTest() throws Exception {

      storeService.addOrdersCoupon(10030);

   }

   @Test
   public void getCouponListTest() throws Exception {

      List<Coupon> couponList = storeService.getCouponList("test14");

      if (CollectionUtils.isEmpty(couponList) == false) {
         for (Coupon coupon : couponList) {
            System.out.println("=========================");

            System.out.println(coupon.getCouponNo());
            System.out.println(coupon.getCouponType());
            System.out.println(coupon.getCouponDc());
            System.out.println(coupon.getCouponValidDate());

            System.out.println("=========================");
         }
      }
   }

   @Test
   public void getStoreTest() throws Exception {

      List<Store> getStore = storeService.getStore(10013);

      if (CollectionUtils.isEmpty(getStore) == false) {
         for (Store store : getStore) {
            System.out.println("=========================");

            System.out.println(store.getStorePhone());
            System.out.println(store.getStoreName());
            System.out.println(store.getStoreType());
            System.out.println(store.getStoreAddr());
            System.out.println(store.getStartTime());
            System.out.println(store.getEndTime());
            System.out.println(store.getHoliday());
            System.out.println(store.getStoreIntro());
            System.out.println(store.getOrders().getReviewStar());
            System.out.println(store.getProduct().getProdNo());
            System.out.println(store.getProduct().getProdName());
            System.out.println(store.getProduct().getPrice());
            System.out.println(store.getProduct().getProdOrign());
            System.out.println(store.getProduct().getProdInfo());
            System.out.println(store.getProduct().isSoldout());

            System.out.println("=========================");
         }
      }
   }

   @Test
   public void testOfGetStoreRefund() {

      List<Store> refundList = storeService.getStoreRefund(10015);
      if (CollectionUtils.isEmpty(refundList) == false) {
         for (Store store : refundList) {
            System.out.println("=========================");

            System.out.println(store.getRequest().getResDate());
            System.out.println(store.getRequest().getReqDate());
            System.out.println(store.getRequest().getRefundMoney());
            System.out.println(store.getRequest().getReqStatus());

            System.out.println("=========================");
         }
      }
   }

   @Test
   public void testOfGetStoreWallet() {
      
      Store store=new Store();
      store.setStoreNo(10000);
      store.setOrderDateStart(null);
      store.setOrderDateEnd(null);

      List<Store> walletList = storeService.getStoreWallet(store);
      if (CollectionUtils.isEmpty(walletList) == false) {
         for (Store store1 : walletList) {
            System.out.println("=========================");

            System.out.println(store1.getTotalEarn());
            System.out.println(store1.getUser().getJpBalance());
            System.out.println(store1.getOrders().getOrderNo());
            System.out.println(store1.getOrders().getOrderDate());
            System.out.println(store1.getOrders().getOrderPrice());
            System.out.println(store1.getOrders().getBuyerName());

            System.out.println("=========================");
         }
      }
   }
   
   
//   @Test
//   public void getStoreListByOrderCount() {
//
//      List<Store> storeList = storeService.getStoreListByOrderCount();
//      if (CollectionUtils.isEmpty(storeList) == false) {
//         for (Store store : storeList) {
//            System.out.println("=========================");
//
//            System.out.println(store.getRequest().getResDate());
//            System.out.println(store.getRequest().getReqDate());
//            System.out.println(store.getRequest().getRefundMoney());
//            System.out.println(store.getRequest().getReqStatus());
//
//            System.out.println("=========================");
//         }
//      }
//   }
}