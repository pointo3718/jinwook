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
import com.jinwook.home.service.domain.Attach;
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
	
	public int isSell(Product Product);
	
	public int isOpen(Store store);
	
	public int addOrdersCoupon(int couponNo);
	
	public List<Coupon> getCouponList(String userId);
	
	public int getCouponCount(String userId);		  // 갖고있는 쿠폰개수
	
	public List<Store> getStore(int storeNo);
	
	public List<Store> getStoreInfo(String userId);
	
	public List<Store> getStoreWallet(Store store);
	
	public List<Store> getStoreRefund(int storeNo);
	
	public List<Store> getStoreListByOrderCount();
	
	public List<Store> getStoreMap();
	
	public List<Store> getStoreOnly(int storeNo);
	
	public Attach selectStoreAttachList(int storeNo); 	// 상점 사진 조회
	
	
	public int getStoreMapTotalCount();
	
	public int getStoreTotalCount();
	
	public int getStoreWalletTotalCount();
	
	public int getCouponTotalCount();
	
	public int getProductTotalCount();
	
	public int getRequestTotalCount();
	
	public int getStoreListTotalCount();

}
