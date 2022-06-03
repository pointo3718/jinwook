package com.jinwook.home.service.store;

import java.util.List;

import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Request;
import com.jinwook.home.service.domain.Store;

public interface StoreService {
	
	public int updateStore(Store store);
	
	public List<Product> getStoreProductList(int StoreNo);
	
	public Store getStore(int storeNo);
	
	public Orders getStoreReviewStar(int storeNo);
	
	public int addStoreProduct(Product Product);

	public int updateStoreProduct(Product product);
	   
	public int deleteStoreProduct(Product Product);
	   
	public int isSoldout(Product Product);
	
	public int isOpen(Store store);
	
	public Store getStoreWallet(String userId);
	
	public List<Request> getStoreWalletRefund(String userId);
	
	public List<Coupon> getCouponList(String userId);
	
	public int addOrderCoupon(Coupon coupon);

}
