package com.jinwook.home.mapper;


import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Product;
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
	
	public List<Store> getStore(Store store);
	
	public List<Store> getStoreWallet(@RequestParam("storeNo") int storeNo, @RequestParam("orderDateStart") Date orderDateStart,
			
			@RequestParam("orderDateEnd") Date orderDateEnd);
	
	public List<Store> getStoreRefund(int storeNo);
	
	public int getStoreTotalCount(Store store);
	
	public int getStoreWalletTotalCount();
	
	public int getCouponTotalCount();
	
	public int getProductTotalCount();
	
	public int getRequestTotalCount();

}
