package com.jinwook.home.service.store;


import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.mapper.StoreMapper;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Store;


@Service
public class StoreServiceImpl implements StoreService{
	
	@Autowired
	private StoreMapper storeMapper;
	
	@Override
	public void updateStore(Store store){
		
		storeMapper.updateStore(store);
	}
	
	@Override
	public void addStoreProduct(Product product){
		
		storeMapper.addStoreProduct(product);
	}
	
	@Override
	public void updateStoreProduct(Product product){
		
		storeMapper.updateStoreProduct(product);
	}
	
	@Override
	public void deleteStoreProduct(Product product){
		
		storeMapper.deleteStoreProduct(product);
	}
	
	
	@Override
	public void isSoldout(Product product){
		
		storeMapper.isSoldout(product);
		
	}
	
	@Override
	public void isOpen(Store store){
		
		storeMapper.isOpen(store);
	}
	
	@Override
	public void addOrderCoupon(Coupon coupon){
		
		storeMapper.addOrderCoupon(coupon);
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
	public List<Store> getStore(int storeNo) {
		List<Store> getStore = Collections.emptyList();

		int storeTotalCount = storeMapper.getStoreTotalCount();

		if (storeTotalCount > 0) {
			getStore = storeMapper.getStore(storeNo);
		}

		return getStore;
	}
	
	@Override	
	public List<Store> getStoreWallet(int storeNo) {
		List<Store> getStoreWallet = Collections.emptyList();

		int storeTotalCount = storeMapper.getStoreTotalCount();

		if (storeTotalCount > 0) {
			getStoreWallet = storeMapper.getStoreWallet(storeNo);
		}

		return getStoreWallet;
	}
	
	
}
