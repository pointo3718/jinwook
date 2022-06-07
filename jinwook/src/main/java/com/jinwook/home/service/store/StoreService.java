package com.jinwook.home.service.store;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Request;
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
	
	public List<Store> getStore(int storeNo);
	
	public List<Store> getStoreWallet(int storeNo);
	

}
