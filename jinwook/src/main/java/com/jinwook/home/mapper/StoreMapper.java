package com.jinwook.home.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Request;
import com.jinwook.home.service.domain.Store;

@Mapper
public interface StoreMapper {
	
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
	
	public int getStoreTotalCount();
	
	public int getCouponTotalCount();
	
	public int getProductTotalCount();
	
	public int getRequestTotalCount();

}
