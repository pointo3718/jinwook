package com.jinwook.home.service.store;

import java.util.List;
import java.util.Map;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Request;
import com.jinwook.home.service.domain.Store;

public interface StoreService {
	
	public int updateStore(Store store);
	
	public int addStoreProduct(Product Product);

	public int updateStoreProduct(Product product);
	   
	public int deleteStoreProduct(Product Product);
	   
	public int isSoldout(Product Product);
	
	public int isOpen(Store store);
	
	public int addOrderCoupon(Coupon coupon);
	
	public List<Coupon> getCouponList(String userId);
	
	public List<Store> getStore(int storeNo);
	
	public List<Store> getStoreWallet(int storeNo);

}
