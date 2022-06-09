package com.jinwook.home.service.store;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Store;

public interface StoreService {
	
	public void updateStore(Store store);
	
	public void addStoreProduct(Product Product);

	public void updateStoreProduct(Product product);
	   
	public void deleteStoreProduct(Product Product);
	   
	public void isSoldout(Product Product);
	
	public void isOpen(Store store);
	
	public void addOrderCoupon(Coupon coupon);
	
	public List<Coupon> getCouponList(String userId);
	
	public List<Store> getStore(Store store);

	public List<Store> getStoreWallet(@RequestParam("storeNo") int storeNo, @RequestParam("orderDateStart") Date orderDateStart,
			
			@RequestParam("orderDateEnd") Date orderDateEnd);

	

}
