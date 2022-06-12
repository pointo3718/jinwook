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
import com.jinwook.home.service.domain.Request;
import com.jinwook.home.service.domain.Store;

@Mapper
public interface StoreMapper {
	
	public int updateStore(Store store);
	
	public int addStoreProduct(Product Product);

	public int updateStoreProduct(Product product);
	   
	public int deleteStoreProduct(int prodNo);
	   
	public int isSoldout(Product Product);
	
	public int isOpen(Store store);
	
	public int addOrdersCoupon(int couponNo);
	
	public List<Coupon> getCouponList(String userId);
	
	public List<Store> getStore(int storeNo);
	
	public List<Store> getStoreWallet(Store store);
	
	public List<Store> getStoreRefund(int storeNo);
	
	public int getStoreTotalCount();
	
	public int getStoreWalletTotalCount();
	
	public int getCouponTotalCount();
	
	public int getProductTotalCount();
	
	public int getRequestTotalCount();

}
