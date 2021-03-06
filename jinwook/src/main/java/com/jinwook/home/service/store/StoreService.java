package com.jinwook.home.service.store;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.domain.Attach;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Store;

public interface StoreService {
	
	public boolean updateStore(Store store);
	
	public void addStoreProduct(Product product, MultipartHttpServletRequest mpRequest) throws Exception; 
	
	public boolean updateStoreProduct(Product product);
	   
	public boolean deleteStoreProduct(int prodNo);
	   
	public boolean isSoldout(Product Product);
	
	public boolean isSell(Product Product);
	
	public boolean isOpen(Store store);
	
	public boolean addOrdersCoupon(int couponNo);
	
	public List<Store> getStoreOnly(int storeNo);
	
	public Attach selectStoreAttachList(int storeNo); 	// 상점 사진 조회
	
	public Attach selectProductAttachList(int prodNo); 	// 상품 사진 조회
	
	public List<Coupon> getCouponList(String userId);
	
	public int getCouponCount(String userId);		// 갖고있는 쿠폰개수
	
	public List<Store> getStore(int storeNo);
	
	public List<Store>  getStoreInfo(String userId);
	
	public List<Store> getStoreRefund(int storeNo);

	public List<Store> getStoreWallet(Store store);
	
	public List<Store> getStoreListByOrderCount();
	
	public List<Store> getStoreMap();
	
	public List<Store> getStoreNo(String userId);

	

}
