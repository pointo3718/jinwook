package com.jinwook.home.service.store;

import java.sql.Date;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.jinwook.home.common.PaginationInfo;
import com.jinwook.home.mapper.StoreMapper;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Request;
import com.jinwook.home.service.domain.Store;

@Service
public class StoreServiceImpl implements StoreService {

   @Autowired
   private StoreMapper storeMapper;

   @Override
   public boolean updateStore(Store store) {

      int queryResult = 0;
      queryResult =storeMapper.updateStore(store);
      
      return (queryResult == 1) ? true : false;
   }

   @Override
   public void addStoreProduct(Product product) {

      storeMapper.addStoreProduct(product);
   }

   @Override
   public boolean updateStoreProduct(Product product) {

      int queryResult = 0;
      queryResult =storeMapper.updateStoreProduct(product);
      return (queryResult == 1) ? true : false;
   }

   @Override
   public boolean deleteStoreProduct(int prodNo) {

      int queryResult = 0;
      queryResult =storeMapper.deleteStoreProduct(prodNo);
      return (queryResult == 1) ? true : false;
   }

   @Override
   public boolean isSoldout(Product product) {

      int queryResult = 0;
      queryResult =storeMapper.isSoldout(product);
      return (queryResult == 1) ? true : false;

   }

   @Override
   public boolean isOpen(Store store) {

      int queryResult = 0;
      queryResult =storeMapper.isOpen(store);
      return (queryResult == 1) ? true : false;
   }

   @Override
   public boolean addOrdersCoupon(int couponNo) {

      int queryResult = 0;
      queryResult = storeMapper.addOrdersCoupon(couponNo);
      return (queryResult == 1) ? true : false;
   }
   

   @Override
   public List<Coupon> getCouponList(String userId) {
      List<Coupon> couponList = Collections.emptyList();

      int couponTotalCount = storeMapper.getCouponTotalCount();

      if (couponTotalCount > 0) {
         couponList = storeMapper.getCouponList(userId);
      }

      return couponList;
   }



   @Override
   public List<Store> getStore(int storeNo){
      
      List<Store> getStore = Collections.emptyList();
      
      int storeTotalCount = storeMapper.getStoreTotalCount();

      if (storeTotalCount > 0) {
         getStore = storeMapper.getStore(storeNo);
      }

      return getStore;
   }
   
   @Override
   public List<Store> getStoreInfo(int storeNo){
      
      List<Store> getStore = Collections.emptyList();
      
      int storeTotalCount = storeMapper.getStoreTotalCount();

      if (storeTotalCount > 0) {
         getStore = storeMapper.getStoreInfo(storeNo);
      }

      return getStore;
   }
   
   @Override
   public List<Store> getStoreRefund(int storeNo){
      
      List<Store> getStore = Collections.emptyList();
      
      int storeTotalCount = storeMapper.getStoreTotalCount();

      if (storeTotalCount > 0) {
         getStore = storeMapper.getStoreRefund(storeNo);
      }

      return getStore;
   }


   



   @Override
   public List<Store> getStoreWallet(Store store) {
      
      List<Store> getStoreWallet = Collections.emptyList();

      int storeTotalCount = storeMapper.getStoreWalletTotalCount();

      if (storeTotalCount > 0) {
         getStoreWallet = storeMapper.getStoreWallet(store);
      }

      return getStoreWallet;
      
   }
   
}